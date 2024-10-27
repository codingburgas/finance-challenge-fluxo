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

void Fluxo::MainOperations::deposit(const QString& amount, Fluxo::App* app) {

    qDebug() << QSslSocket::sslLibraryBuildVersionString();
    qDebug() << QSslSocket::supportsSsl();
    qDebug() << QSslSocket::sslLibraryVersionString();

    if (amount.isEmpty() || !amount.toDouble()) {
        // qDebug() << "Invalid amount provided.";
        return;
    }

    QJsonObject testData;
    testData["amount"] = amount;
    testData["category"] = "Food";
    testData["email"] = "kvatev1@gmail.com";
    testData["target"] = "kvatev";

    QJsonDocument testDoc(testData);
    QByteArray testConverted = testDoc.toJson();

    QString dir = QDir::currentPath() + "/data.json";
    QFile file(dir);

    // if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
    //     QByteArray data = file.readAll();
    //     file.close();

    //     QJsonDocument jsonData = QJsonDocument::fromJson(data);
    //     if (!jsonData.isNull() && jsonData.isObject()) {
    //         QJsonObject jsonReadable = jsonData.object();
    //         if (jsonReadable.contains("session") && jsonReadable["session"].isObject()) {
    //             QJsonObject session = jsonReadable["session"].toObject();
    //         } else {
    //             qDebug() << "No valid session found in JSON.";
    //         }
    //     } else {
    //         qDebug() << "Failed to parse JSON data.";
    //         return;
    //     }
    // } else {
    //     qDebug() << "Failed to open file:" << file.errorString();
    //     return;
    // }

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
}


void Fluxo::MainOperations::withdraw(const QString& amount, Fluxo::App* app) {

    // qDebug() << QSslSocket::sslLibraryBuildVersionString();
    // qDebug() << QSslSocket::supportsSsl();
    // qDebug() << QSslSocket::sslLibraryVersionString();

    if (amount.isEmpty() || !amount.toDouble()) {
        // qDebug() << "Invalid amount provided.";
        return;
    }

    QJsonObject testData;
    testData["amount"] = amount;
    testData["category"] = "Food";
    testData["email"] = "kvatev1@gmail.com";
    testData["target"] = "kvatev";

    QJsonDocument testDoc(testData);
    QByteArray testConverted = testDoc.toJson();

    QString dir = QDir::currentPath() + "/data.json";
    QFile file(dir);

    // if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
    //     QByteArray data = file.readAll();
    //     file.close();

    //     QJsonDocument jsonData = QJsonDocument::fromJson(data);
    //     if (!jsonData.isNull() && jsonData.isObject()) {
    //         QJsonObject jsonReadable = jsonData.object();
    //         if (jsonReadable.contains("session") && jsonReadable["session"].isObject()) {
    //             QJsonObject session = jsonReadable["session"].toObject();
    //         } else {
    //             qDebug() << "No valid session found in JSON.";
    //         }
    //     } else {
    //         qDebug() << "Failed to parse JSON data.";
    //         return;
    //     }
    // } else {
    //     qDebug() << "Failed to open file:" << file.errorString();
    //     return;
    // }

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
}



