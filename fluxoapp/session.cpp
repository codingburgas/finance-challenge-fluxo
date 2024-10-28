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


bool Fluxo::SessionHandler::isAppInitialized(Fluxo::App* app) const {
    return app != nullptr && app->getNetworkManager() != nullptr;
}

// void Fluxo::SessionHandler::writeSession(const QString& username, const QString& password, Fluxo::App* app) {
//     QString dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";
//     QJsonObject data;
//     data["password"] = password;

//     QJsonDocument sendAuth(data);
//     QByteArray sendAuthArr = sendAuth.toJson();

//     if (!isAppInitialized(app)) {
//         qWarning() << "Application not initialized";
//         return;
//     }

//     QNetworkAccessManager* manager = app->getNetworkManager();
//     if (!manager) {
//         qFatal("Network manager not initialized");
//         return;
//     }

//     QUrl authUrl("https://fluxo-api.me/auth");
//     QUrl sessionWriteUrl("https://fluxo-api.me/session");

//     QNetworkRequest authRequest(authUrl);
//     authRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

//     qDebug() << "Starting auth request to:" << authUrl.toString();
//     QNetworkReply* authReply = manager->post(authRequest, sendAuthArr);

//     if (!authReply) {
//         qFatal("Failed to send auth network request.");
//         return;
//     }

//     // Auth request completion handler
//     QObject::connect(authReply, &QNetworkReply::finished, [authReply, manager, sessionWriteUrl, sendAuthArr, &data, dir]() {
//         if (authReply->error() == QNetworkReply::NoError) {
//             qDebug() << "Auth request successful.";

//             // Create and send the session write request only after auth succeeds
//             QNetworkRequest sessionRequest(sessionWriteUrl);
//             sessionRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

//             qDebug() << "Starting session write request to:" << sessionWriteUrl.toString();
//             QNetworkReply* sessionReply = manager->post(sessionRequest, sendAuthArr);

//             if (!sessionReply) {
//                 qFatal("Failed to send session write network request.");
//                 return;
//             }

//             // Session write request completion handler
//             QObject::connect(sessionReply, &QNetworkReply::finished, [sessionReply, &data, dir]() {
//                 if (sessionReply->error() == QNetworkReply::NoError) {
//                     qDebug() << "Session write request successful.";

//                     QByteArray responseData = sessionReply->readAll();
//                     QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);

//                     if (responseDoc.isNull()) {
//                         qWarning() << "Failed to parse JSON from session response.";
//                         return;
//                     }

//                     QJsonObject responseObj = responseDoc.object();
//                     qDebug() << "Received response JSON:" << responseObj;

//                     if (responseObj.contains("id") && responseObj.contains("userId")) {
//                         data["sessionID"] = responseObj["id"].toString();
//                         data["userID"] = responseObj["userId"].toString();

//                         QJsonDocument jsonDoc(data);
//                         QByteArray convertedData = jsonDoc.toJson();

//                         QFile file(dir);
//                         qDebug() << "Opening file for writing:" << dir;
//                         if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
//                             file.write(convertedData);
//                             file.close();
//                             qDebug() << "Data written to file successfully.";
//                         } else {
//                             qWarning() << "Failed to open file for writing:" << file.errorString();
//                         }

//                         qDebug() << "Opening file for reading to confirm contents:" << dir;
//                         if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
//                             QByteArray fileData = file.readAll();
//                             file.close();

//                             QJsonDocument debugDoc = QJsonDocument::fromJson(fileData);
//                             if (debugDoc.isNull()) {
//                                 qWarning() << "Failed to parse JSON from file contents.";
//                                 return;
//                             }

//                             QJsonObject debugObj = debugDoc.object();
//                             qDebug() << "Contents of data.json:";
//                             for (auto it = debugObj.begin(); it != debugObj.end(); ++it) {
//                                 qDebug() << it.key() << ":" << it.value().toString();
//                             }
//                         } else {
//                             qWarning() << "Failed to open file for reading:" << file.errorString();
//                         }
//                     } else {
//                         qWarning() << "Response JSON does not contain expected keys 'id' or 'userId'.";
//                     }
//                 } else {
//                     qWarning() << "Session write request error:" << sessionReply->errorString()
//                     << " with status code:" << sessionReply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
//                 }

//                 sessionReply->deleteLater();
//             });
//         } else {
//             qWarning() << "Auth request error:" << authReply->errorString()
//             << " with status code:" << authReply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
//         }
//         authReply->deleteLater();
//     });
// }




void Fluxo::SessionHandler::writeSession(const QString& username, const QString& password, Fluxo::App* app) {

    QString dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";
    QJsonObject data;
    data["email"] = username;
    data["password"] = password;

    QJsonDocument jsonDoc(data);
    QByteArray convertedData = jsonDoc.toJson();

    if (!isAppInitialized(app)) {
        qWarning() << "Application is not initialized.";
        return;
    }

    QNetworkAccessManager* manager = app->getNetworkManager();
    if (!manager) {
        qFatal("Network manager not initialized.");
        return;
    }

    QFile file(dir);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qWarning() << "Couldn't open or create file:" << file.fileName();
        qWarning() << "Error:" << file.errorString();
        return;
    }
    file.write(convertedData);
    file.close();
    // qDebug() << "Data written to file:" << dir;

    QUrl url("https://fluxo-api.me/auth");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QPointer<QNetworkReply> reply = manager->post(request, convertedData);
    if (!reply) {
        qFatal("Failed to send network request.");
        return;
    }

    QObject::connect(reply, &QNetworkReply::finished, this, [reply, username, dir, data, this]() mutable {

        if (!reply) {
            qWarning() << "Reply is null!";
            return;
        }

        if (reply->error() == QNetworkReply::NoError) {
            QByteArray responseData = reply->readAll();
            qDebug() << "Network request successful, response:" << responseData;

            QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
            if (responseDoc.isNull()) {
                qWarning() << "Failed to parse JSON response.";
                return;
            }

            QJsonObject responseObj = responseDoc.object();
            if (responseObj.contains("user") && responseObj["user"].isObject()) {
                QJsonObject userObj = responseObj["user"].toObject();
                QString userId;

                if (userObj.contains("id")) {
                    if (userObj["id"].isString()) {
                        userId = userObj["id"].toString();
                    } else if (userObj["id"].isDouble()) {
                        userId = QString::number(static_cast<int>(userObj["id"].toDouble()));
                    }

                    QString sessionID = createSessionID(username, userId);
                    data["token"] = sessionID;
                    data["id"] = userId;
                }
            }
        } else {
            qWarning() << reply->errorString();
            qWarning() << reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
        }

        QJsonDocument updatedDoc(data);
        QByteArray updatedData = updatedDoc.toJson();
        QFile file(dir);

        if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
            return;

        file.write(updatedData);
        file.close();


        this->setSessionWritingCompleted(true);
        emit sessionWritten();

    });
}





QString Fluxo::SessionHandler::createSessionID(const QString& email, const QString& userId) {

    int mid = email.length() / 2;

    QString leftPart = email.left(mid);
    QString rightPart = email.mid(mid);

    QString sessionID = leftPart + userId + rightPart;
    qDebug() << sessionID;

    return sessionID;
}


void Fluxo::SessionHandler::fetchBalance(Fluxo::App* app) {

    QString dir = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";
    QFile file(dir);

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Couldn't open file:" << file.fileName();
        return;
    }

    QByteArray fileData = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(fileData);
    QJsonObject jsonObj = doc.object();
    QString token = jsonObj["token"].toString();
    auto id = jsonObj["id"];

    if (token.isEmpty() || id == 0) {
        qWarning() << "Token or ID is missing.";
        return;
    }

    if (!isAppInitialized(app)) {
        qWarning() << "Application is not initialized.";
        return;
    }

    QNetworkAccessManager* manager = app->getNetworkManager();
    if (!manager) {
        qWarning() << "Network manager not initialized.";
        return;
    }

    QJsonObject requestBody;
    requestBody["token"] = token;
    requestBody["id"] = id;
    QJsonDocument requestDoc(requestBody);
    QByteArray requestData = requestDoc.toJson();

    QUrl url("https://fluxo-api.me/getInfo");
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* reply = manager->post(request, requestData);
    connect(reply, &QNetworkReply::finished, this, [reply, this]() {
        if (reply->error() == QNetworkReply::NoError) {
            QByteArray responseData = reply->readAll();
            QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
            QJsonObject responseObj = responseDoc.object();

            if (responseObj.contains("balance")) {
                double balance = responseObj["balance"].toDouble();
                QString balanceText = QString::number(balance, 'f', 2) + " BGN";

                emit balanceUpdated(balanceText);
                qDebug() << "Balance fetched successfully:" << balanceText;
            } else {
                qWarning() << "'balance' not found in response JSON.";
            }
        } else {
            qWarning() << "Network error:" << reply->errorString();
        }
        reply->deleteLater();
    });
}






// bool Fluxo::SessionHandler::isLogged() {

//     QString filePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data.json";

//     QFile file(filePath);
//     if (!file.open(QIODevice::ReadOnly))
//         return false;

//     QByteArray fileData = file.readAll();
//     file.close();

//     QJsonDocument jsonDoc = QJsonDocument::fromJson(fileData);
//     if (jsonDoc.isNull() || !jsonDoc.isObject())
//         return false;

//     QJsonObject jsonObj = jsonDoc.object();
//     if (jsonObj.contains("authenticated") && jsonObj["authenticated"].isBool())
//         return jsonObj["authenticated"].toBool();

//     qDebug() << "Field 'authenticated' not found or not a boolean.";
//     return false;
// }
