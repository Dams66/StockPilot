#ifndef STOCKENVCONTROLLER_H
#define STOCKENVCONTROLLER_H

#include "stockenv.h"

#include <QObject>

class StockEnvController : public QObject
{
    Q_OBJECT
public:
    explicit StockEnvController(QObject *parent = nullptr);

    Q_INVOKABLE void createEnv(int x, int y, int z);

private:
    StockEnv m_stockEnv;
};

#endif // STOCKENVCONTROLLER_H
