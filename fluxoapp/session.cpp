#include "session.h"
#include "fluxo.h"

QString Fluxo::SessionHandler::getUsername() {
    return this->username;
}

QString Fluxo::SessionHandler::getPassword() {
    return this->password;
}

void Fluxo::SessionHandler::setUsername(const QString &val) {
    this->username = val;
}

void Fluxo::SessionHandler::setPassword(const QString &val) {
    this->password = val;
}

// Check if the app is initialized
bool Fluxo::SessionHandler::isAppInitialized(Fluxo::App* app) {
    return app != nullptr && app->getNetworkManager() != nullptr;
}

void Fluxo::SessionHandler::writeSession(const QString& username, const QString& password, Fluxo::App* app) {
    if (!isAppInitialized(app)) {
        qFatal("Not initialized");
        return;
    }

    QNetworkAccessManager* manager = app->getNetworkManager();
    if (!manager) {
        qFatal("Network manager not initialized");
        return;
    }

    QUrl url("http://localhost:3000/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject data;
    data["email"] = username;
    data["password"] = password;

    QJsonDocument json(data);
    QByteArray convertedData = json.toJson();

    QNetworkReply* reply = manager->post(request, convertedData);

    if (!reply) {
        qFatal("Failed to send network request.");
    }
}
