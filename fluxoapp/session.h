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
#include "budget.h"

namespace Fluxo {

class App;

class SessionHandler : public QObject {

        Q_OBJECT

        Q_PROPERTY(bool sessionWritingCompleted READ isSessionWritingCompleted WRITE setSessionWritingCompleted NOTIFY sessionWritingCompletedChanged)
        Q_PROPERTY(bool isTransactionDone READ getIsTransactionDone WRITE setIsTransactionDone NOTIFY transactionDone)
        Q_PROPERTY(bool isBudgetDone READ getIsBudgetDone WRITE setIsBudgetDone NOTIFY budgetDone)
        Q_PROPERTY(QString username READ getUsername WRITE setUsername NOTIFY usernameChanged)
        Q_PROPERTY(QList<QObject*> transactions READ getTransactions NOTIFY transactionsChanged)
        Q_PROPERTY(QList<QObject*> budgets READ getBudgets NOTIFY budgetsChanged)

    public:

        Q_INVOKABLE void writeSession(const QString& username, const QString& password, Fluxo::App* app);
        QString createSessionID(const QString& email, const QString& userId);
        Q_INVOKABLE void fetchBalance(Fluxo::App* app);
        Q_INVOKABLE void fetchTransactions(Fluxo::App* app);
        Q_INVOKABLE void fetchBudgets(Fluxo::App* app);

    signals:

        void balanceUpdated(QString newBalance);
        void sessionWritten();
        void sessionWritingCompletedChanged();
        void transactionDone();
        void budgetDone();
        void usernameChanged();
        void transactionsChanged();
        void budgetsChanged();

    private:

        QString password;
        bool sessionWritingCompleted = false;
        bool isTransactionDone = false;
        bool isBudgetDone = false;
        QString username;
        QList<QObject*> transactions;
        QList<QObject*> budgets;

    public:

        bool isSessionWritingCompleted() const { return sessionWritingCompleted; }
        QString getUsername() const { return username; }
        bool getIsTransactionDone() const { return isTransactionDone; }
        bool getIsBudgetDone() const { return isBudgetDone; }

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


        Q_REQUIRED_RESULT QList<QObject*> getBudgets() const {
            return budgets;
        }

        void addBudget(QObject* budget) {
            if (budget && qobject_cast<Fluxo::Budget*>(budget)) {
                budgets.append(budget);
                emit budgetsChanged();
                auto txn = static_cast<Fluxo::Budget*>(budget);
                qDebug() << "New transaction: " << txn->getBudgetTitle() << " " << txn->getBudgetAmountInserted() << "/" << txn->getBudgetGoal() << " on " << txn->getBudgetCategory();
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

        void setIsBudgetDone(bool done) {
            if (isBudgetDone != done) {
                isBudgetDone = done;
                emit budgetDone();
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
