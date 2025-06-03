#include "product.h"

Product::Product(const QString& name, long reference, const QImage& code)
    : name_(name), reference_(reference), code_(code)
{}

QString Product::getName() const {
    return name_;
}

long Product::getReference() const {
    return reference_;
}

QImage Product::getCode() const {
    return code_;
}

void Product::setName(const QString& name) {
    name_ = name;
}

void Product::setReference(long reference) {
    reference_ = reference;
}

void Product::setCode(const QImage& code) {
    code_ = code;
}
