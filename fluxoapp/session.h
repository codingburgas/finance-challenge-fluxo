#ifndef SESSION_H
#define SESSION_H
#endif // SESSION_H

#include <QQmlContext>
#include <QDebug>
#include <QObject>
#include <fstream>

class SessionHandler : public QObject {
    Q_OBJECT
public slots:

    QString getUsername();

    QString getPassword();

    void setUsername(const QString &val);

    void setPassword(const QString &val);

    void writeToFile(const QString& val);

private:
    QString username, password;
};
