#ifndef FLUXO_H
#define FLUXO_H

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QNetworkAccessManager>
#include <QDebug>
#include "session.h"

namespace Fluxo {

class App {
public:
    App(int argc, char** argv); // Constructor
    ~App(); // Destructor

    void initialize();
    int run();
    QNetworkAccessManager* getNetworkManager(); // Get the network manager
    SessionHandler* getSessionHandler(); // Return session handler

private:
    QGuiApplication* app;
    QQmlApplicationEngine engine; // QML engine
    QNetworkAccessManager* manager; // Network manager
    SessionHandler handler; // Session handler

    bool isInitialized() const;
};

} //end of namespace Fluxo

#endif // FLUXO_H
