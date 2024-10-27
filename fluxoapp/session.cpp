#include "session.h"
#include "fluxo.h"
#include <qlogging.h>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QUrl>
#include <QDir>

bool Fluxo::SessionHandler::isAppInitialized(Fluxo::App* app) {
    return app != nullptr && app->getNetworkManager() != nullptr;
}

void Fluxo::SessionHandler::writeSession(const QString& username, const QString& password, Fluxo::App* app) {

    QString dir = "dir/data.json";
    QJsonObject data;
    data["email"] = username;
    data["password"] = password;
    data["authanticated"] = "true";

    QJsonDocument jsonDoc(data);
    QByteArray convertedData = jsonDoc.toJson();

    if (!isAppInitialized(app)) {
        qFatal("Not initialized");
        return;
    }

    QNetworkAccessManager* manager = app->getNetworkManager();
    if (!manager) {
        qFatal("network manager not initialized");
        return;
    }

    QFile file(dir);
    if (file.exists()) {
        qInfo() << "file already exists.";
        return;
    }


    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "Current working directory:" << dir;
        qWarning() << "couldn't open or create file:" << file.fileName();
        qWarning() << "Error: " << file.errorString();
        return;
    }

    file.write(convertedData);
    file.close();

    QUrl url("http://localhost:3000/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* reply = manager->post(request, convertedData);

    if (!reply)
        qFatal("Failed to send network request.");

    qDebug() << username << password;
}
