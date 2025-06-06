#include "stockenv.h"
#include <QDebug>

StockEnv::StockEnv(QObject* parent)
    : QObject(parent) {}

StockEnv::StockEnv(int x, int y, int z, const QString& name, QObject* parent)
    : QObject(parent), m_dimX(x), m_dimY(y), m_dimZ(z), m_name(name),
    env3D(x, std::vector<std::vector<StockCell>>(y, std::vector<StockCell>(z))) {}

void StockEnv::setName(const QString& name) {
    if (m_name != name) {
        m_name = name;
        emit nameChanged();
    }
}
