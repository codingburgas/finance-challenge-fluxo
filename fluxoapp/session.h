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

namespace Fluxo {
class App; // Forward declaration of App
}

namespace Fluxo{
    class SessionHandler : public QObject {
        Q_OBJECT
    public:
        Q_INVOKABLE void writeSession(const QString& username, const QString& password, Fluxo::App* app);

    private:
        QString username, password;

        bool isAppInitialized(Fluxo::App* app);
    };
} //end of namespace Fluxo

#endif // SESSION_H
