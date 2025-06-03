#ifndef STOCKENVMANAGER_H
#define STOCKENVMANAGER_H

#include <QObject>
#include <QVector>
#include <memory>
#include "stockenv.h"

class StockEnvManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(int count READ count NOTIFY countChanged)

public:
    explicit StockEnvManager(QObject* parent = nullptr);

    Q_INVOKABLE int createEnvironment();
    Q_INVOKABLE void deleteEnvironment(int index);
    Q_INVOKABLE bool exists(int index) const;

    int count() const;

signals:
    void countChanged();

private:
    QVector<std::shared_ptr<StockEnv>> m_envs;
};

#endif // STOCKENVMANAGER_H
