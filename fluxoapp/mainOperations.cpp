#include "fluxo.h"
#include "urls.h"

#include <QDir>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QUrl>
#include <QJsonDocument>
#include <QFile>
#include <QDebug>
#include <QJsonObject>
#include <QStandardPaths>




void Fluxo::MainOperations::deposit(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler) {


    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f) {
        qDebug() << "Invalid amount read from cache. Operation aborted.";
        return;
    }

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
    QString id = jsonObj["id"].toString();


    if (token.isEmpty() || id.isEmpty()) {
        qWarning() << "Token or ID is missing in data.json.";
        return;
    }

    QJsonObject getInfoRequestBody;
    getInfoRequestBody["token"] = token;
    getInfoRequestBody["id"] = id;

    QJsonDocument getInfoDoc(getInfoRequestBody);
    QByteArray getInfoData = getInfoDoc.toJson();

    QNetworkAccessManager* manager = app->getNetworkManager();
    QUrl getInfoUrl("https://fluxo-api.me/getInfo");
    QNetworkRequest getInfoRequest(getInfoUrl);
    getInfoRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* getInfoReply = manager->post(getInfoRequest, getInfoData);

    QObject::connect(getInfoReply, &QNetworkReply::finished, this, [getInfoReply, category, amount, manager, app, handler]() {

        if (getInfoReply->error() == QNetworkReply::NoError) {
            QByteArray responseData = getInfoReply->readAll();
            QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
            QJsonObject responseObj = responseDoc.object();

            if (responseObj.contains("email") && responseObj["email"].isString()) {
                QString email = responseObj["email"].toString();

                QJsonObject testData;
                testData["amount"] = amount;
                testData["category"] = category;
                testData["email"] = email;
                testData["token"] = responseObj["token"].toString();
                testData["id"] = responseObj["id"].toString();
                testData["target"] = "test";

                QJsonDocument testDoc(testData);
                QByteArray testConverted = testDoc.toJson();

                QNetworkRequest depositRequest(Fluxo::Url::deposit);
                depositRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

                QNetworkReply* depositReply = manager->post(depositRequest, testConverted);

                QObject::connect(depositReply, &QNetworkReply::finished, [depositReply, handler]() {
                    if (depositReply->error() == QNetworkReply::NoError) {
                        qDebug() << "Deposit request successful, reply:" << depositReply->readAll();
                        handler->setIsTransactionDone(true);
                    }
                    else {
                        qDebug() << "Deposit request failed, error:" << depositReply->errorString();
                    }
                    depositReply->deleteLater();
                });
            }

            else {
                qWarning() << "Failed to retrieve email from /getInfo response.";
            }
        }

        else {
            qWarning() << "Request to /getInfo failed, error:" << getInfoReply->errorString();
        }

        getInfoReply->deleteLater();

    });


    Fluxo::MainOperations::deleteCache(true);
    handler->setIsTransactionDone(false);
}




void Fluxo::MainOperations::withdraw(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler) {

    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f) {
        qDebug() << "Invalid amount read from cache. Operation aborted.";
        return;
    }

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
    QString id = jsonObj["id"].toString();

    if (token.isEmpty() || id.isEmpty()) {
        qWarning() << "Token or ID is missing in data.json.";
        return;
    }

    QJsonObject getInfoRequestBody;
    getInfoRequestBody["token"] = token;
    getInfoRequestBody["id"] = id;

    QJsonDocument getInfoDoc(getInfoRequestBody);
    QByteArray getInfoData = getInfoDoc.toJson();

    QNetworkAccessManager* manager = app->getNetworkManager();
    QUrl getInfoUrl("https://fluxo-api.me/getInfo");
    QNetworkRequest getInfoRequest(getInfoUrl);
    getInfoRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* getInfoReply = manager->post(getInfoRequest, getInfoData);

    QObject::connect(getInfoReply, &QNetworkReply::finished, this, [getInfoReply, category, amount, manager, app, handler]() {

        if (getInfoReply->error() == QNetworkReply::NoError) {
            QByteArray responseData = getInfoReply->readAll();
            QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
            QJsonObject responseObj = responseDoc.object();

            if (responseObj.contains("email") && responseObj["email"].isString()) {
                QString email = responseObj["email"].toString();

                QJsonObject testData;
                testData["amount"] = amount;
                testData["category"] = category;
                testData["email"] = email;
                testData["token"] = responseObj["token"].toString();
                testData["id"] = responseObj["id"].toString();
                testData["target"] = "test";

                QJsonDocument testDoc(testData);
                QByteArray testConverted = testDoc.toJson();

                QNetworkRequest withdrawRequest(Fluxo::Url::withdraw);  // URL for withdrawal
                withdrawRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

                QNetworkReply* withdrawReply = manager->post(withdrawRequest, testConverted);

                QObject::connect(withdrawReply, &QNetworkReply::finished, [withdrawReply, handler]() {
                    if (withdrawReply->error() == QNetworkReply::NoError) {
                        qDebug() << "Withdrawal request successful, reply:" << withdrawReply->readAll();
                        handler->setIsTransactionDone(true);
                    } else {
                        qDebug() << "Withdrawal request failed, error:" << withdrawReply->errorString();
                    }
                    withdrawReply->deleteLater();
                });
            } else {
                qWarning() << "Failed to retrieve email from /getInfo response.";
            }
        } else {
            qWarning() << "Request to /getInfo failed, error:" << getInfoReply->errorString();
        }

        getInfoReply->deleteLater();
    });

    Fluxo::MainOperations::deleteCache(true);
    handler->setIsTransactionDone(false);
}



void Fluxo::MainOperations::cacheAmount(const QString& amount, Fluxo::App* app) {


    QString dirPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data";
    qDebug() << "Attempting to cache in directory:" << dirPath;

    QDir dir(dirPath);
    if (!dir.exists() && !dir.mkpath(dirPath)) {
        qDebug() << "Failed to create data directory at:" << dirPath;
        return;
    }

    QJsonObject jsonObject;
    jsonObject["amount"] = amount;
    QJsonDocument jsonDoc(jsonObject);

    QString filePath = dirPath + "/cache.json";
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        qDebug() << "Could not open file for writing:" << file.errorString();
        return;
    }

    qint64 bytesWritten = file.write(jsonDoc.toJson());
    file.close();

    if (bytesWritten > 0) {
        qDebug() << "Amount cached successfully:" << amount;
    } else {
        qDebug() << "Failed to write amount to cache file.";
    }
}


float Fluxo::MainOperations::retrieveCache() {

    QString filePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data/cache.json";
    QFile file(filePath);
    float amount = 0.0f;

    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QByteArray data = file.readAll();
        file.close();

        QJsonDocument jsonData = QJsonDocument::fromJson(data);
        if (!jsonData.isNull() && jsonData.isObject()) {
            QJsonObject jsonObject = jsonData.object();
            if (jsonObject.contains("amount") && jsonObject["amount"].isString()) {
                amount = jsonObject["amount"].toString().toFloat();
            } else {
                qDebug() << "No valid amount found in JSON.";
            }
        } else {
            qDebug() << "Failed to parse JSON data.";
        }
    } else {
        qDebug() << "Failed to open file:" << file.errorString();
    }

    return amount;
}

void Fluxo::MainOperations::deleteCache(bool par) {

    QString filePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data/cache.json";
    QFile file(filePath);

    if (par) {
        if (file.exists()) {
            if (file.remove()) {
                qDebug() << "Cache file deleted successfully.";
            } else {
                qDebug() << "Failed to delete cache file:" << file.errorString();
            }
        } else {
            qDebug() << "Cache file does not exist.";
        }
    }
}

