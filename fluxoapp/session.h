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
#include <QFunctionPointer>


namespace Fluxo {

    class App;

    class SessionHandler : public QObject {
        Q_OBJECT

        Q_PROPERTY(bool sessionWritingCompleted READ isSessionWritingCompleted WRITE setSessionWritingCompleted NOTIFY sessionWritingCompletedChanged)
        Q_PROPERTY(bool isTransactionDone READ getIsTransactionDone WRITE setIsTransactionDone NOTIFY transactionDone)
        Q_PROPERTY(QString username READ getUsername WRITE setUsername NOTIFY usernameChanged)


    public:

        explicit SessionHandler(QObject *parent = nullptr) : QObject(parent), isTransactionDone(false), sessionWritingCompleted(false) {}

        Q_INVOKABLE void writeSession(const QString& username, const QString& password, Fluxo::App* app);
        QString createSessionID(const QString& email, const QString& userId);
        Q_INVOKABLE void fetchBalance(Fluxo::App* app);

        bool isTransactionDone = false;
        QString username;

    signals:

        void balanceUpdated(QString newBalance);
        void sessionWritten();
        void sessionWritingCompletedChanged();
        void transactionDone();
        void usernameChanged();

    private:

        QString password;
        bool sessionWritingCompleted = false;

    public:

        bool isSessionWritingCompleted() const { return this->sessionWritingCompleted; }
        QString getUsername() const { return this->username; }
        bool getIsTransactionDone() const { return this->isTransactionDone; }

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


        Q_REQUIRED_RESULT
            bool isAppInitialized(Fluxo::App* app) const;
    };
} // end of namespace Fluxo

#endif // SESSION_H
