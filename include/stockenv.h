#ifndef STOCKENV_H
#define STOCKENV_H

#include <vector>
#include <product.h>

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

public:
    StockEnv() = default;
    StockEnv(int x, int y, int z);

    void addProduct(int x, int y, int z, const Product& product, int quantity);
    StockCell getCell(int x, int y, int z) const;
    void flushCell(int x, int y, int z);

    Q_INVOKABLE void debugPrint();
};

#endif // STOCKENV_H
