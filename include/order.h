#ifndef ORDER_H
#define ORDER_H

#include <QString>
#include <QList>
#include "product.h"

class Order
{
public:
    enum class PalletType {
        Perdue,
        Europe
    };

    struct ProductQuantity {
        Product product;
        int quantity;
    };

    Order(int weight = 0, int length = 0, int width = 0, PalletType palletType = PalletType::Europe)
        : m_weight(weight), m_length(length), m_width(width), m_palletType(palletType) {}

    void addProduct(const Product& product, int quantity);

    // Getters
    QString getOrderNumber() const { return m_orderNumber; }
    QList<ProductQuantity> getProductList() const { return productList_; }
    int getWeight() const { return m_weight; }
    int getLength() const { return m_length; }
    int getWidth() const { return m_width; }
    PalletType getPalletType() const { return m_palletType; }
    QString getAddress() const { return m_adress; }

    // Setters
    void setOrderNumber(const QString& orderNumber) { m_orderNumber = orderNumber; }
    void setWeight(int weight) { m_weight = weight; }
    void setLength(int length) { m_length = length; }
    void setWidth(int width) { m_width = width; }
    void setPalletType(PalletType type) { m_palletType = type; }
    void setAddress(const QString& address) { m_adress = address; }

private:
    QList<ProductQuantity> productList_;

    int m_weight = 0;
    int m_length = 0;
    int m_width = 0;

    PalletType m_palletType = PalletType::Europe;

    QString m_adress;
    QString m_orderNumber;
};

#endif // ORDER_H
