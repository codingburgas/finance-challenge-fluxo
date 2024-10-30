#ifndef TRANSACTION_H
#define TRANSACTION_H

#include <QObject>
#include <QString>


namespace Fluxo {

    class Transaction : public QObject {
        Q_OBJECT

        Q_PROPERTY(QString transactionAmount READ getTransactionAmount WRITE setTransactionAmount NOTIFY transactionAmountChanged)
        Q_PROPERTY(QString target READ getTarget WRITE setTarget NOTIFY targetChanged)
        Q_PROPERTY(QString timeProcessed READ getTimeProcessed WRITE setTimeProcessed NOTIFY timeProcessedChanged)

    public:
        QString getTransactionAmount() const { return transactionAmount; }
        QString getTarget() const { return target; }
        QString getTimeProcessed() const { return timeProcessed; }

        void setTransactionAmount(const QString &amount) {
            if (transactionAmount != amount) {
                transactionAmount = amount;
                emit transactionAmountChanged();
            }
        }

        void setTarget(const QString &targetI) {
            if (target != targetI) {
                target = targetI;
                emit targetChanged();
            }
        }

        void setTimeProcessed(const QString &time) {
            if (timeProcessed != time) {
                timeProcessed = time;
                emit timeProcessedChanged();
            }
        }

    signals:
        void transactionAmountChanged();
        void targetChanged();
        void timeProcessedChanged();

    public:
        QString transactionAmount;
        QString target;
        QString timeProcessed;
        QString type;
    };

}

#endif // TRANSACTION_H
