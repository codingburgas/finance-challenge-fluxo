#include <QGuiApplication>
#include "fluxo.h"

int main(int argc, char *argv[]) {
    Fluxo::App app(argc, argv);
    app.initialize();
    return app.run();
}
