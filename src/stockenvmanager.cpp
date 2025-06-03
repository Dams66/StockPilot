
#include "stockenvmanager.h"

StockEnvManager::StockEnvManager(QObject* parent)
    : QObject(parent) {}

int StockEnvManager::createEnvironment() {
    m_envs.append(std::make_shared<StockEnv>());
    emit countChanged();
    return m_envs.size() - 1;
}

void StockEnvManager::deleteEnvironment(int index) {
    if (index >= 0 && index < m_envs.size()) {
        m_envs.remove(index);
        emit countChanged();
    }
}

bool StockEnvManager::exists(int index) const {
    return index >= 0 && index < m_envs.size();
}

int StockEnvManager::count() const {
    return m_envs.size();
}
