
#include "stockenv.h"

StockEnv::StockEnv(int x, int y, int z, const QString& name)
    : m_dimX(x), m_dimY(y), m_dimZ(z), m_name(name),
    env3D(x, std::vector<std::vector<StockCell>>(y, std::vector<StockCell>(z))) {}

// void StockEnv::addProduct(int x, int y, int z, const Product& produit, int quantite) {
//     if (x >= 0 && x < m_dimX && y >= 0 && y < m_dimY && z >= 0 && z < m_dimZ) {
//         env3D[x][y][z] = StockCell(produit, quantite);
//     }
// }

// StockCell StockEnv::getCell(int x, int y, int z) const {
//     return env3D.at(x).at(y).at(z);
// }

// void StockEnv::flushCell(int x, int y, int z) {
//     env3D[x][y][z].quantity = 0;
// }
