#ifndef PRODUCT_H
#define PRODUCT_H

#include <QString>
#include <QImage>

class Product {
public:
    Product() = default;
    Product(const QString& name, long reference, const QImage& code);

    // Getters
    QString getName() const;
    long getReference() const;
    QImage getCode() const;

    // Setters
    void setName(const QString& name);
    void setReference(long reference);
    void setCode(const QImage& code);

private:
    QString name_;
    long reference_;
    QImage code_;
};

#endif // PRODUCT_H
