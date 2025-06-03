#include "stockenvcontroller.h"
#include <QDebug>

StockEnvController::StockEnvController(QObject* parent)
    : QObject(parent), m_stockEnv()
{
}


void StockEnvController::createEnv(int x, int y, int z){
    m_stockEnv = StockEnv(x, y, z);
    qDebug() << "Stock environment created.";
}
