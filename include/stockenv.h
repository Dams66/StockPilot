#ifndef STOCKENV_H
#define STOCKENV_H

#include <vector>
#include <QString>
#include <QObject>
#include "product.h"

struct StockCell {
    Product product;
    int quantity = 0;

    StockCell() = default;
    StockCell(const Product& p, int q) : product(p), quantity(q) {}
};

class StockEnv : public QObject {
    Q_OBJECT
    Q_PROPERTY(int dimX READ dimX NOTIFY dimensionsChanged)
    Q_PROPERTY(int dimY READ dimY NOTIFY dimensionsChanged)
    Q_PROPERTY(int dimZ READ dimZ NOTIFY dimensionsChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)

public:
    explicit StockEnv(QObject* parent = nullptr);
    StockEnv(int x, int y, int z, const QString& name, QObject* parent = nullptr);

    int dimX() const { return m_dimX; }
    int dimY() const { return m_dimY; }
    int dimZ() const { return m_dimZ; }

    QString name() const { return m_name; }
    void setName(const QString& name);

signals:
    void nameChanged();
    void dimensionsChanged();

private:
    std::vector<std::vector<std::vector<StockCell>>> env3D;
    int m_dimX = 0, m_dimY = 0, m_dimZ = 0;
    QString m_name;
};

#endif // STOCKENV_H
