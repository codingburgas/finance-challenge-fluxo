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

void Fluxo::MainOperations::deposit(const QString& category, Fluxo::App* app) {

    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f) {
        qDebug() << "Invalid amount read from cache. Operation aborted.";
        return;
    }

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
        } else {
            qDebug() << "Request failed, error:" << reply->errorString();
        }
        reply->deleteLater();
    });

    Fluxo::MainOperations::deleteCache(true);
}



void Fluxo::MainOperations::withdraw(const QString& category, Fluxo::App* app) {

    float amount = Fluxo::MainOperations::retrieveCache();

    if (amount <= 0.0f) {
        qDebug() << "Invalid amount read from cache. Operation aborted.";
        return;
    }

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
        if (reply->error() == QNetworkReply::NoError) {
            qDebug() << "Request successful, reply:" << reply->readAll();
        } else {
            qDebug() << "Request failed, error:" << reply->errorString();
        }
        reply->deleteLater();
    });

    Fluxo::MainOperations::deleteCache(true);
}


void Fluxo::MainOperations::cacheAmount(const QString& amount, Fluxo::App* app) {
    qDebug() << "cacheAmount called with amount:" << amount;

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

