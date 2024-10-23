#include "session.h"

QString SessionHandler::getUsername() {
    qDebug() << this->password;
    return this->username;
}

QString SessionHandler::getPassword() {
    qDebug() << this->password;
    return this->password;
}

void SessionHandler::setUsername(const QString &val){
    this->username = val;

}
void SessionHandler::setPassword(const QString &val){
    this->password = val;
}

void SessionHandler::writeSession(const QString& username, const QString& password, QNetworkAccessManager *manager){
    QUrl url("http://locahost:3000/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    QJsonObject data;
    data["email"] = username;
    data["password"] = password;

    QJsonDocument json(data);
    QByteArray convertedData = json.toJson();
    QNetworkReply* reply = manager->post(request, convertedData);
}
