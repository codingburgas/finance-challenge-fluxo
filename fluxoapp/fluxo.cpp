#include "fluxo.h"
#include <qqmlcontext.h>

namespace Fluxo {

// Constructor
App::App(int argc, char** argv)
    : app(new QGuiApplication(argc, argv)),
    manager(new QNetworkAccessManager()) {
    if (!app) {
        qFatal("Failed to create QGuiApplication.");
    }
    if (!manager) {
        qFatal("Failed to create QNetworkAccessManager.");
    }
}

// Destructor
App::~App() {
    delete manager;
    delete app;
}

// Initialize the application
void App::initialize() {
    if (!isInitialized()) {
        qFatal("App not initialized properly.");
    }

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("SessionHandler", &handler);

    // Check if loading the QML module is successful
    try {
        engine.loadFromModule("fluxoapp", "Main");
        if (engine.rootObjects().isEmpty()) {
            qFatal("Failed to load QML module.");
        }
    } catch (...) {
        qFatal("An exception occurred while loading the QML module.");
    }
}

// Start the application
int App::run() {
    if (!isInitialized()) {
        qFatal("App not initialized properly.");
    }
    return app->exec();
}

QNetworkAccessManager* App::getNetworkManager() {
    if (!manager) {
        qFatal("Network manager not initialized.");
    }
    return manager;
}

// Check if the app is initialized
bool App::isInitialized() const {
    return (app != nullptr && manager != nullptr);
}

// Get the session handler
SessionHandler* App::getSessionHandler() {
    return &handler;
}

} //end of namespace Fluxo
