
#include "stockenvmanager.h"
#include <QDebug>

StockEnvManager::StockEnvManager(QObject* parent)
    : QObject(parent) {}


int StockEnvManager::createEnvironment(int x, int y, int z, const QString& name) {
    m_envs.append(std::make_shared<StockEnv>(x, y, z, name));
    emit environmentsChanged();
    return m_envs.size() - 1;
}

QList<QObject*> StockEnvManager::getEnvironments() const {
    QList<QObject*> list;
    for (const auto &env : m_envs) {
        list.append(env.get());
    }
    return list;
}
