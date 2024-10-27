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

#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QDir>
#include <QStandardPaths>

void Fluxo::MainOperations::deposit(const QString& category, Fluxo::App* app) {

    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f)
        return;

    QJsonObject testData;
    testData["amount"] = amount;
    testData["category"] = category;
    testData["email"] = "kvatev1@gmail.com";
    testData["target"] = "kvatev";

    QJsonDocument testDoc(testData);
    QByteArray testConverted = testDoc.toJson();

    QNetworkAccessManager* manager = app->getNetworkManager();
    QNetworkRequest request(Fluxo::Url::deposit);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* reply = manager->post(request, testConverted);

    QObject::connect(reply, &QNetworkReply::finished, [reply]() {
        if (reply->error() == QNetworkReply::NoError) {
            qDebug() << "Request successful, reply:" << reply->readAll();
        } 
        else {
            qDebug() << "Request failed, error:" << reply->errorString();
        }
        reply->deleteLater();
    });

    Fluxo::MainOperations::deleteCache(true);
}



void Fluxo::MainOperations::withdraw(const QString& category, Fluxo::App* app) {

    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f)
        return;

    QJsonObject testData;
    testData["amount"] = amount;
    testData["category"] = category;
    testData["email"] = "kvatev1@gmail.com";
    testData["target"] = "kvatev";

    QJsonDocument testDoc(testData);
    QByteArray testConverted = testDoc.toJson();

    QNetworkAccessManager* manager = app->getNetworkManager();
    QNetworkRequest request(Fluxo::Url::withdraw);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply* reply = manager->post(request, testConverted);

    QObject::connect(reply, &QNetworkReply::finished, [reply]() {

        if (reply->error() == QNetworkReply::NoError)
            qDebug() << "Request successful, reply:" << reply->readAll();

        else
            qDebug() << "Request failed, error:" << reply->errorString();
        
        reply->deleteLater();
    });

    Fluxo::MainOperations::deleteCache(true);
}


void Fluxo::MainOperations::cacheAmount(const QString& amount, Fluxo::App* app) {

    QString dirPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/data";

    QDir dir(dirPath);
    if (!dir.exists() && !dir.mkpath(dirPath)) {
        return;
    }

    QJsonObject jsonObject;
    jsonObject["amount"] = amount;
    QJsonDocument jsonDoc(jsonObject);

    QString filePath = dirPath + "/cache.json";
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        return;
    }

    qint64 bytesWritten = file.write(jsonDoc.toJson());
    file.close();

    if (bytesWritten > 0) {
        qDebug() << "Caching was successful" << amount;
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
            }
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
            }
        }
         else
            return;
    }
}

