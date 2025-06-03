#include "order.h"

Order::Order()
    : //preparer_(nullptr),
    //pointer_(nullptr),
    weight_(0),
    length_(0),
    width_(0),
    palletType_(PalletType::Europe)
{}

// Exemple de getter/setter pour orderNumber
QString Order::getOrderNumber() const {
    return orderNumber_;
}

void Order::setOrderNumber(const QString& orderNumber) {
    orderNumber_ = orderNumber;
}

// Exemple pour ajouter un produit avec quantité
void Order::addProduct(const Product& product, int quantity) {
    for (auto& pq : productList_) {
        if (pq.product.getReference() == product.getReference()) {
            pq.quantity += quantity;
            return;
        }
    }
    ProductQuantity newPQ{product, quantity};
    productList_.append(newPQ);
}

// Exemple pour récupérer la liste de produits
QList<Order::ProductQuantity> Order::getProductList() const {
    return productList_;
}

// Getters/setters pour poids, dimensions
int Order::getWeight() const {
    return weight_;
}

void Order::setWeight(int weight) {
    weight_ = weight;
}

int Order::getLength() const {
    return length_;
}

void Order::setLength(int length) {
    length_ = length;
}

int Order::getWidth() const {
    return width_;
}

void Order::setWidth(int width) {
    width_ = width;
}

// Getter/setter pour palletType
Order::PalletType Order::getPalletType() const {
    return palletType_;
}

void Order::setPalletType(PalletType type) {
    palletType_ = type;
}

// Getter/setter pour adresse
QString Order::getAddress() const {
    return address_;
}

void Order::setAddress(const QString& address) {
    address_ = address;
}

// Getter/setter pour preparer et pointer (Personnel*)
// Personnel* Order::getPreparer() const {
//     return preparer_;
// }

// void Order::setPreparer(Personnel* preparer) {
//     preparer_ = preparer;
// }

// Personnel* Order::getPointer() const {
//     return pointer_;
// }

// void Order::setPointer(Personnel* pointer) {
//     pointer_ = pointer;
// }
