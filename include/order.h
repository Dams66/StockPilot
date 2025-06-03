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

    Order();

    // Getters / Setters
    QString getOrderNumber() const;
    void setOrderNumber(const QString& orderNumber);

    QList<ProductQuantity> getProductList() const;
    void addProduct(const Product& product, int quantity);

    int getWeight() const;
    void setWeight(int weight);

    int getLength() const;
    void setLength(int length);

    int getWidth() const;
    void setWidth(int width);

    PalletType getPalletType() const;
    void setPalletType(PalletType type);

    QString getAddress() const;
    void setAddress(const QString& address);

    //Personnel* getPreparer() const;
    //void setPreparer(Personnel* preparer);

    //Personnel* getPointer() const;
    //void setPointer(Personnel* pointer);

private:
    QList<ProductQuantity> productList_;
    //Personnel* preparer_ = nullptr;
    //Personnel* pointer_ = nullptr;

    int weight_ = 0;
    int length_ = 0;
    int width_ = 0;

    PalletType palletType_ = PalletType::Europe;

    QString address_;
    QString orderNumber_;
};

#endif // ORDER_H
