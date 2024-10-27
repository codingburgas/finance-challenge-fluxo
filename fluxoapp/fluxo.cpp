#include "fluxo.h"
#include <qqmlcontext.h>

Fluxo::App::App(int argc, char** argv)
    : app(new QGuiApplication(argc, argv)),
      manager(new QNetworkAccessManager()) {
    if (!app) {
        qFatal("Failed to create QGuiApplication.");
    }
    if (!manager) {
        qFatal("Failed to create QNetworkAccessManager.");
    }
    app->setApplicationName("Fluxo");
    app->setApplicationDisplayName("Fluxo");
    app->setOrganizationName("Fluxo");
}

Fluxo::App::~App() {
    delete manager;
    delete app;
}

void Fluxo::App::initialize() {
    if (!isInitialized()) {
        qFatal("App not initialized properly.");
    }

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("SessionHandler", &handler);
    engine.rootContext()->setContextProperty("fluxo", this);
    engine.rootContext()->setContextProperty("CoreOperations", &core);

    try {
        engine.loadFromModule("fluxoapp", "GetStartedPage");
        if (engine.rootObjects().isEmpty()) {
            qFatal("Failed to load QML module.");
        }
    } catch (...) {
        qFatal("An exception occurred while loading the QML module.");
    }
}

int Fluxo::App::run() {
    if (!isInitialized()) {
        qFatal("App not initialized properly.");
    }
    return app->exec();
}

QNetworkAccessManager* Fluxo::App::getNetworkManager() {
    if (!manager) {
        qFatal("Network manager not initialized.");
    }
    return manager;
}

bool Fluxo::App::isInitialized() const {
    return (app != nullptr && manager != nullptr);
}

Fluxo::SessionHandler* Fluxo::App::getSessionHandler() {
    return &handler;
}
