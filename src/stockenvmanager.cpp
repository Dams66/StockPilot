
#include "stockenvmanager.h"
#include <QDebug>

StockEnvManager::StockEnvManager(QObject* parent)
    : QObject(parent) {}


int StockEnvManager::createEnvironment(int x, int y, int z, const QString& name) {
    m_envs.append(std::make_shared<StockEnv>(x, y, z, name));
    emit environmentsChanged();
    return m_envs.size() - 1;
}

// void StockEnvManager::deleteEnvironment(int index) {
//     if (index >= 0 && index < m_envs.size()) {
//         m_envs.remove(index);
//         emit environmentsChanged();
//     }
// }

// bool StockEnvManager::exists(int index) const {
//     return index >= 0 && index < m_envs.size();
// }

QVariantList StockEnvManager::getEnvironments() const {
    QVariantList list;
    for (const auto &env : m_envs) {
        QVariantMap map;
        map["name"] = env->name();
        list.append(map);
        qDebug() << map;
    }
    return list;
}
