#include "order.h"

void Order::addProduct(const Product& product, int quantity) {
    productList_.append({ product, quantity });
}
