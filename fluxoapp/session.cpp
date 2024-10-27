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
#include <QStandardPaths>


bool Fluxo::SessionHandler::isAppInitialized(Fluxo::App* app) {
    return app != nullptr && app->getNetworkManager() != nullptr;
}

void Fluxo::SessionHandler::writeSession(const QString& username, const QString& password, Fluxo::App* app) {

    QString dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";
    QJsonObject data;
    data["email"] = username;
    data["authenticated"] = true;

    QJsonDocument jsonDoc(data);
    QByteArray convertedData = jsonDoc.toJson();

    if (!isAppInitialized(app))
        return;

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

    QUrl url("https://fluxo-api.me/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* reply = manager->post(request, convertedData);

    if (!reply)
        qFatal("Failed to send network request.");

    qDebug() << username << password;
}

bool Fluxo::SessionHandler::isLogged() {

    QString filePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly))
        return false;

    QByteArray fileData = file.readAll();
    file.close();

    QJsonDocument jsonDoc = QJsonDocument::fromJson(fileData);
    if (jsonDoc.isNull() || !jsonDoc.isObject())
        return false;

    QJsonObject jsonObj = jsonDoc.object();
    if (jsonObj.contains("authenticated") && jsonObj["authenticated"].isBool())
        return jsonObj["authenticated"].toBool();

    qDebug() << "Field 'authenticated' not found or not a boolean.";
    return false;
}
