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
#include <QDateTime>
#include <QJsonArray>
#include <memory>




void Fluxo::MainOperations::deposit(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler) {

    float amount = Fluxo::MainOperations::retrieveCache();
    if (amount <= 0.0f) {
        qDebug() << "Invalid amount read from cache. Operation aborted.";
        return;
    }
    qDebug() << "Amount to deposit:" << amount;

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

    qDebug() << "Token and ID retrieved successfully:" << token << id;


    QNetworkAccessManager* manager = app->getNetworkManager();
    QNetworkRequest getInfoRequest(QUrl("https://fluxo-api.me/getInfo"));
    getInfoRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject getInfoRequestBody{{"token", token}, {"id", id}};
    qDebug() << "Sending request to /getInfo with body:" << QJsonDocument(getInfoRequestBody).toJson();
    QNetworkReply* getInfoReply = manager->post(getInfoRequest, QJsonDocument(getInfoRequestBody).toJson());


    QObject::connect(getInfoReply, &QNetworkReply::finished, this, [=]() mutable {
        if (getInfoReply->error() != QNetworkReply::NoError) {
            qWarning() << "Request to /getInfo failed, error:" << getInfoReply->errorString();
            getInfoReply->deleteLater();
            return;
        }

        QByteArray responseData = getInfoReply->readAll();
        getInfoReply->deleteLater();
        QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
        QJsonObject responseObj = responseDoc.object();

        QString email = responseObj["email"].toString();
        if (email.isEmpty()) {
            qWarning() << "Failed to retrieve email from /getInfo response.";
            return;
        }

        qDebug() << "Email retrieved from /getInfo response:" << email;


        if (responseObj.contains("transactions") && responseObj["transactions"].isArray()) {
            QJsonArray transactionsArray = responseObj["transactions"].toArray();

            for (const QJsonValue& transactionValue : transactionsArray) {
                QJsonObject transactionObject = transactionValue.toObject();


                auto* transaction = new Fluxo::Transaction();
                transaction->setTransactionAmount(QString::number(transactionObject["amount"].toDouble()));
                transaction->setTarget(transactionObject["target"].toString());
                transaction->setTimeProcessed(transactionObject["timeProcessed"].toString());

                handler->addTransaction(transaction);
            }
            qDebug() << "Processed" << transactionsArray.size() << "transactions.";
        }
        else {
            qWarning() << "No transactions found in response.";
        }

        QJsonObject testData{
            {"amount", amount},
            {"category", category},
            {"email", email},
            {"type", "DEPOSIT"},
            {"token", responseObj["token"].toString()},
            {"id", responseObj["id"].toString()},
            {"target", "test"}
        };

        qDebug() << "Preparing deposit request with data:" << QJsonDocument(testData).toJson();

        QNetworkRequest depositRequest(QUrl("https://fluxo-api.me/deposit"));
        depositRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

        QNetworkReply* depositReply = manager->post(depositRequest, QJsonDocument(testData).toJson());

        QObject::connect(depositReply, &QNetworkReply::finished, this, [=]() mutable {
            if (depositReply->error() == QNetworkReply::NoError) {
                qDebug() << "Deposit request successful, reply:" << depositReply->readAll();
                handler->setIsTransactionDone(true);
                emit handler->transactionsChanged();
            } else {
                qWarning() << "Deposit request failed, error:" << depositReply->errorString();
            }
            depositReply->deleteLater();
        });
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
    qDebug() << "Amount to deposit:" << amount;

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

    qDebug() << "Token and ID retrieved successfully:" << token << id;


    QNetworkAccessManager* manager = app->getNetworkManager();
    QNetworkRequest getInfoRequest(QUrl("https://fluxo-api.me/getInfo"));
    getInfoRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QJsonObject getInfoRequestBody{{"token", token}, {"id", id}};
    qDebug() << "Sending request to /getInfo with body:" << QJsonDocument(getInfoRequestBody).toJson();
    QNetworkReply* getInfoReply = manager->post(getInfoRequest, QJsonDocument(getInfoRequestBody).toJson());


    QObject::connect(getInfoReply, &QNetworkReply::finished, this, [=]() mutable {
        if (getInfoReply->error() != QNetworkReply::NoError) {
            qWarning() << "Request to /getInfo failed, error:" << getInfoReply->errorString();
            getInfoReply->deleteLater();
            return;
        }

        QByteArray responseData = getInfoReply->readAll();
        getInfoReply->deleteLater();
        QJsonDocument responseDoc = QJsonDocument::fromJson(responseData);
        QJsonObject responseObj = responseDoc.object();

        QString email = responseObj["email"].toString();
        if (email.isEmpty()) {
            qWarning() << "Failed to retrieve email from /getInfo response.";
            return;
        }

        qDebug() << "Email retrieved from /getInfo response:" << email;


        if (responseObj.contains("transactions") && responseObj["transactions"].isArray()) {
            QJsonArray transactionsArray = responseObj["transactions"].toArray();

            for (const QJsonValue& transactionValue : transactionsArray) {
                QJsonObject transactionObject = transactionValue.toObject();


                auto* transaction = new Fluxo::Transaction();
                transaction->setTransactionAmount(QString::number(transactionObject["amount"].toDouble()));
                transaction->setTarget(transactionObject["target"].toString());
                transaction->setTimeProcessed(transactionObject["timeProcessed"].toString());

                handler->addTransaction(transaction);
            }
            qDebug() << "Processed" << transactionsArray.size() << "transactions.";
        }
        else {
            qWarning() << "No transactions found in response.";
        }

        QJsonObject testData{
            {"amount", amount},
            {"category", category},
            {"email", email},
            {"type", "WITHDRAW"},
            {"token", responseObj["token"].toString()},
            {"id", responseObj["id"].toString()},
            {"target", "test"}
        };

        qDebug() << "Preparing deposit request with data:" << QJsonDocument(testData).toJson();

        QNetworkRequest depositRequest(QUrl("https://fluxo-api.me/withdraw"));
        depositRequest.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

        QNetworkReply* depositReply = manager->post(depositRequest, QJsonDocument(testData).toJson());

        QObject::connect(depositReply, &QNetworkReply::finished, this, [=]() mutable {
            if (depositReply->error() == QNetworkReply::NoError) {
                qDebug() << "Deposit request successful, reply:" << depositReply->readAll();
                handler->setIsTransactionDone(true);
                emit handler->transactionsChanged();
            } else {
                qWarning() << "Deposit request failed, error:" << depositReply->errorString();
            }
            depositReply->deleteLater();
        });
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

