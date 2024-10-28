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
class App; // Forward declaration of App
}

namespace Fluxo {
class SessionHandler : public QObject {
    Q_OBJECT

    Q_PROPERTY(bool sessionWritingCompleted READ isSessionWritingCompleted WRITE setSessionWritingCompleted NOTIFY sessionWritingCompletedChanged)

public:
    Q_INVOKABLE void writeSession(const QString& username, const QString& password, Fluxo::App* app);
    QString createSessionID(const QString& email, const QString& userId);
    Q_INVOKABLE void fetchBalance(Fluxo::App* app);

signals:
    void balanceUpdated(QString newBalance);
    void sessionWritten();
    void sessionWritingCompletedChanged();

private:
    QString username, password;
    bool m_sessionWritingCompleted = false;

public:

    bool isSessionWritingCompleted() const { return m_sessionWritingCompleted; }

    void setSessionWritingCompleted(bool completed) {
        if (m_sessionWritingCompleted != completed) {
            m_sessionWritingCompleted = completed;
            emit sessionWritingCompletedChanged();
        }
    }

    Q_REQUIRED_RESULT
        bool isAppInitialized(Fluxo::App* app) const;
};
} // end of namespace Fluxo

#endif // SESSION_H
