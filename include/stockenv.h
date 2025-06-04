#ifndef STOCKENV_H
#define STOCKENV_H

#include <vector>
#include <QString>
#include "product.h"

struct StockCell {
    Product product;
    int quantity = 0;

    StockCell() = default;
    StockCell(const Product& p, int q) : product(p), quantity(q) {}
};

class StockEnv {
private:
    std::vector<std::vector<std::vector<StockCell>>> env3D;
    int dimX, dimY, dimZ;
    QString m_name;  // ajout du nom

public:
    StockEnv() = default;
    StockEnv(int x, int y, int z, const QString &name = QString());

    void addProduct(int x, int y, int z, const Product& product, int quantity);
    StockCell getCell(int x, int y, int z) const;
    void flushCell(int x, int y, int z);

    QString name() const { return m_name; }
    void setName(const QString &name) { m_name = name; }

    Q_INVOKABLE void debugPrint();
};

#endif // STOCKENV_H
