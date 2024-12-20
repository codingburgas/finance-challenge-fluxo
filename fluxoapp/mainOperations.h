#ifndef MAINOPERATIONS_H
#define MAINOPERATIONS_H


#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QJsonObject>
#include <QString>
#include <QObject>
#include "transaction.h"

namespace Fluxo{

class App;
class SessionHandler;
class Transaction;

class MainOperations : public QObject{

    Q_OBJECT
public:

    Q_INVOKABLE void deposit(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void withdraw(const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void depositBudget(const QString& budgetId, const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void withdrawBudget(const QString& budgetId, const QString& category, Fluxo::App* app, Fluxo::SessionHandler* handler);

    Q_INVOKABLE void cacheAmount(const QString& amount, Fluxo::App* app);
    Q_INVOKABLE void deleteCache(bool par);
    Q_INVOKABLE float retrieveCache();
    Q_INVOKABLE void cacheBudgetInfo(const QString &title, const QString &category, const QString &deadline, Fluxo::App* app);
    Q_INVOKABLE QJsonObject retrieveBudgetInfoCache();
    Q_INVOKABLE void createBudget(const QString& amount, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void sendMoney(const QString& amount, const QString& username, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void editBudget(const QString& budgetId, const QString& budgetGoal, const QString& budgetCategory, const QString& budgetDeadline, Fluxo::App* app, Fluxo::SessionHandler* handler);
    Q_INVOKABLE void deleteBudget(const QString& budgetId, Fluxo::App* app, Fluxo::SessionHandler* handler);

};

}
#endif // MAINOPERATIONS_H
