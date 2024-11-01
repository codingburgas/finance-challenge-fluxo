#ifndef MAINOPERATIONS_H
#define MAINOPERATIONS_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QString>
#include <QObject>

namespace Fluxo {
class App;
}

namespace Fluxo{

class MainOperations : public QObject{
    Q_OBJECT
public:
    Q_INVOKABLE void deposit(const QString& category, Fluxo::App* app);
    Q_INVOKABLE void withdraw(const QString& category, Fluxo::App* app);
    Q_INVOKABLE void cacheAmount(const QString& amount);
    void deleteCache(bool par);
    float retrieveCache();

}; // end of namespace mainoperations
} // end of namespace fluxo
#endif // MAINOPERATIONS_H
