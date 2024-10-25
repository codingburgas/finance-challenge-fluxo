#ifndef URLS_H
#define URLS_H

#include <QUrl>

#define URL QUrl
#define ROOT "https://fluxo-api.me"
#define DEPOSIT "https://fluxo-api.me/deposit"
#define WITHDRAW "https://fluxo-api.me/withdraw"
#define AUTH "https://fluxo-api.me/auth"

namespace Fluxo{
    namespace Url{
    URL root(ROOT);
    URL deposit(DEPOSIT);
    URL withdraw(WITHDRAW);
    URL auth(AUTH);
    }
}

#endif // URLS_H
