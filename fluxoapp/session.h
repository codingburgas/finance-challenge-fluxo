// session.h

#ifndef SESSION_H
#define SESSION_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QUrl>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>
#include <QList>
#include "transaction.h"

namespace Fluxo {

class App;

class SessionHandler : public QObject {

    Q_OBJECT

    Q_PROPERTY(bool sessionWritingCompleted READ isSessionWritingCompleted WRITE setSessionWritingCompleted NOTIFY sessionWritingCompletedChanged)
    Q_PROPERTY(bool isTransactionDone READ getIsTransactionDone WRITE setIsTransactionDone NOTIFY transactionDone)
    Q_PROPERTY(QString username READ getUsername WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(QList<QObject*> transactions READ getTransactions NOTIFY transactionsChanged)

public:

    Q_INVOKABLE void writeSession(const QString& username, const QString& password, Fluxo::App* app);
    QString createSessionID(const QString& email, const QString& userId);
    Q_INVOKABLE void fetchBalance(Fluxo::App* app);
    Q_INVOKABLE void fetchTransactions(Fluxo::App* app);

signals:

    void balanceUpdated(QString newBalance);
    void sessionWritten();
    void sessionWritingCompletedChanged();
    void transactionDone();
    void usernameChanged();
    void transactionsChanged();

private:

    QString password;
    bool sessionWritingCompleted = false;
    bool isTransactionDone = false;
    QString username;
    QList<QObject*> transactions;

public:

    bool isSessionWritingCompleted() const { return sessionWritingCompleted; }
    QString getUsername() const { return username; }
    bool getIsTransactionDone() const { return isTransactionDone; }

    Q_REQUIRED_RESULT QList<QObject*> getTransactions() const {
        return transactions;
    }

    void addTransaction(QObject* transaction) {
        if (transaction && qobject_cast<Fluxo::Transaction*>(transaction)) {
            transactions.append(transaction);
            emit transactionsChanged();
            auto txn = static_cast<Fluxo::Transaction*>(transaction);
            qDebug() << "New transaction: " << txn->getTarget() << " " << txn->getTimeProcessed() << " " << txn->getTransactionAmount();
        } else {
            qWarning() << "Attempted to add a null or invalid Transaction object.";
        }
    }

    void setSessionWritingCompleted(bool completed) {
        if (sessionWritingCompleted != completed) {
            sessionWritingCompleted = completed;
            emit sessionWritingCompletedChanged();
        }
    }

    void setIsTransactionDone(bool done) {
        if (isTransactionDone != done) {
            isTransactionDone = done;
            emit transactionDone();
        }
    }

    void setUsername(const QString &newUsername) {
        if (username != newUsername) {
            username = newUsername;
            emit usernameChanged();
        }
    }

    Q_REQUIRED_RESULT bool isAppInitialized(Fluxo::App* app) const;
};

}

#endif // SESSION_H
