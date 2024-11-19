#ifndef FLUXO_H
#define FLUXO_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QNetworkAccessManager>
#include "session.h"
#include "mainOperations.h"

namespace Fluxo {

class App : public QObject {
    Q_OBJECT

public:
    App(int argc, char** argv);
    ~App();

    void initialize();

    Q_REQUIRED_RESULT
        int run();

    Q_REQUIRED_RESULT
        Q_INVOKABLE QNetworkAccessManager* getNetworkManager();

    Q_REQUIRED_RESULT
        Q_INVOKABLE SessionHandler* getSessionHandler();

private:

    QGuiApplication* app;
    QQmlApplicationEngine engine;
    QNetworkAccessManager* manager;
    SessionHandler handler;
    MainOperations core;

    bool isInitialized() const;
};

} // namespace Fluxo

#endif // FLUXO_H
