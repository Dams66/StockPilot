#ifndef STOCKENVMANAGER_H
#define STOCKENVMANAGER_H

#include <QObject>
#include <QVector>
#include <QQmlEngine>
#include <memory>
#include "stockenv.h"

class StockEnvManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

    Q_PROPERTY(QVariantList environments READ getEnvironments NOTIFY environmentsChanged)

public:
    explicit StockEnvManager(QObject* parent = nullptr);

    Q_INVOKABLE int createEnvironment(int x, int y, int z, const QString& name);
    //Q_INVOKABLE void deleteEnvironment(int index);
    //Q_INVOKABLE bool exists(int index) const;

    Q_INVOKABLE QVariantList getEnvironments() const;

signals:
    void environmentsChanged();

private:
    QVector<std::shared_ptr<StockEnv>> m_envs;
};

#endif // STOCKENVMANAGER_H
