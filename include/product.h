#ifndef PRODUCT_H
#define PRODUCT_H

#include <QString>
#include <QImage>

class Product {

public:
    Product() = default;
    Product(const QString& name, long reference, const QImage& code)
        : m_name(name), m_reference(reference), m_code(code) {}

    // Getters
    QString getName() const { return m_name; }
    long getReference() const { return m_reference; }
    QImage getCode() const { return m_code; }

    // Setters
    void setName(const QString& name) { m_name = name; }
    void setReference(long reference) { m_reference = reference; }
    void setCode(const QImage& code) { m_code = code; }

private:
    QString m_name;
    long m_reference = 0;
    QImage m_code;
};

#endif // PRODUCT_H
