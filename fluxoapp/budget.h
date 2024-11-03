#ifndef BUDGET_H
#define BUDGET_H


#include <QObject>
#include <QString>


namespace Fluxo {

class Budget : public QObject {
    Q_OBJECT

    Q_PROPERTY(QString budgetId READ getBudgetId WRITE setBudgetId NOTIFY budgetIdChanged)
    Q_PROPERTY(QString budgetTitle READ getBudgetTitle WRITE setBudgetTitle NOTIFY budgetTitleChanged)
    Q_PROPERTY(QString budgetAmountInserted READ getBudgetAmountInserted WRITE setBudgetAmountInserted NOTIFY budgetAmountInsertedChanged)
    Q_PROPERTY(QString budgetGoal READ getBudgetGoal WRITE setBudgetGoal NOTIFY budgetGoalChanged)
    Q_PROPERTY(QString budgetDeadline READ getBudgetDeadline WRITE setBudgetDeadline NOTIFY budgetDeadlineChanged)
    Q_PROPERTY(QString budgetCategory READ getBudgetCategory WRITE setBudgetCategory NOTIFY budgetCategoryChanged)


public:
    QString getBudgetId() const { return budgetId; }
    QString getBudgetTitle() const { return budgetTitle; }
    QString getBudgetAmountInserted() const { return budgetAmountInserted; }
    QString getBudgetGoal() const { return budgetGoal; }
    QString getBudgetDeadline() const { return budgetDeadline; }
    QString getBudgetCategory() const { return budgetCategory; }


    void setBudgetId(const QString &id){
        if (budgetId != id){
            budgetId = id;
            emit budgetIdChanged();
        }
    }


    void setBudgetTitle(const QString &title){
        if (budgetTitle != title){
            budgetTitle = title;
            emit budgetTitleChanged();
        }
    }

    void setBudgetAmountInserted(const QString &amountInserted){
        if (budgetAmountInserted != amountInserted){
            budgetAmountInserted = amountInserted;
            emit budgetAmountInsertedChanged();
        }
    }

    void setBudgetGoal(const QString &goal){
        if (budgetGoal != goal){
            budgetGoal = goal;
            emit budgetGoalChanged();
        }
    }

    void setBudgetDeadline(const QString &deadline){
        if (budgetDeadline != deadline){
            budgetDeadline = deadline;
            emit budgetDeadlineChanged();
        }
    }

    void setBudgetCategory(const QString &category){
        if (budgetCategory != category){
            budgetCategory = category;
            emit budgetCategoryChanged();
        }
    }

signals:
    void budgetIdChanged();
    void budgetTitleChanged();
    void budgetAmountInsertedChanged();
    void budgetGoalChanged();
    void budgetDeadlineChanged();
    void budgetCategoryChanged();

public:
    QString budgetId;
    QString budgetTitle;
    QString budgetAmountInserted;
    QString budgetGoal;
    QString budgetDeadline;
    QString budgetCategory;
};

}

#endif // BUDGET_H
