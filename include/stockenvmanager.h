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

    Q_PROPERTY(QList<QObject*> environments READ getEnvironments NOTIFY environmentsChanged)


public:
    explicit StockEnvManager(QObject* parent = nullptr);

    Q_INVOKABLE int createEnvironment(int x, int y, int z, const QString& name);

    Q_INVOKABLE QList<QObject*> getEnvironments() const;

    Q_INVOKABLE bool loadFromFile();
    Q_INVOKABLE bool saveToFile();


signals:
    void environmentsChanged();

private:
    QVector<std::shared_ptr<StockEnv>> m_envs;
};

#endif // STOCKENVMANAGER_H
