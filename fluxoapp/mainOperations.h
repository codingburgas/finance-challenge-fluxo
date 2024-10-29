#ifndef MAINOPERATIONS_H
#define MAINOPERATIONS_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QString>
#include <QObject>

namespace Fluxo{

class App;
class SessionHandler;

class MainOperations : public QObject{

    Q_OBJECT
public:

        Q_INVOKABLE void deposit(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler);
        Q_INVOKABLE void withdraw(const QString& category, Fluxo::App* app);
        Q_INVOKABLE void cacheAmount(const QString& amount, Fluxo::App* app);
        Q_INVOKABLE void deleteCache(bool par);
        Q_INVOKABLE float retrieveCache();

    };
}
#endif // MAINOPERATIONS_H
