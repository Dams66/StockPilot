
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

#include "stockenvmanager.h"

StockEnvManager::StockEnvManager(QObject* parent): QObject(parent) {
    loadFromFile();
}


int StockEnvManager::createEnvironment(int x, int y, int z, const QString& name) {
    m_envs.append(std::make_shared<StockEnv>(x, y, z, name));
    saveToFile();
    emit environmentsChanged();
    return m_envs.size() - 1;
}

QList<QObject*> StockEnvManager::getEnvironments() const {
    QList<QObject*> list;
    for (const auto &env : m_envs) {
        list.append(env.get());
    }
    return list;
}

bool StockEnvManager::saveToFile() {
    QString basePath = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation);
    QString dirPath = basePath + "/StockPilot";
    QString filePath = dirPath + "/environments.json";

    QDir().mkpath(dirPath); // Create folder if not already

    QJsonArray envArray;
    for (const auto& env : m_envs) {
        QJsonObject envObj;
        envObj["name"] = env->name();
        envObj["dimX"] = env->dimX();
        envObj["dimY"] = env->dimY();
        envObj["dimZ"] = env->dimZ();
        envArray.append(envObj);
    }

    QJsonDocument doc(envArray);
    QFile file(filePath);
    if (!file.open(QIODevice::WriteOnly)) {
        qWarning() << "Unable to open save file for writing : " << filePath;
        return false;
    }

    file.write(doc.toJson());
    file.close();
    return true;
}


bool StockEnvManager::loadFromFile() {
    QString filePath = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation) + "/StockPilot/environments.json";

    QFile file(filePath);
    if (!file.exists()) {
        qWarning() << "Save file not found : " << filePath;
        return false;
    }

    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Unable to open backup file for reading : " << filePath;
        return false;
    }

    QByteArray data = file.readAll();
    file.close();

    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (!doc.isArray()) {
        qWarning() << "JSON file is not an array.";
        return false;
    }

    QJsonArray envArray = doc.array();
    m_envs.clear(); // clears old environments
    for (const QJsonValue& val : envArray) {
        if (!val.isObject()) continue;

        QJsonObject obj = val.toObject();
        QString name = obj["name"].toString();
        int dimX = obj["dimX"].toInt();
        int dimY = obj["dimY"].toInt();
        int dimZ = obj["dimZ"].toInt();

        m_envs.append(std::make_shared<StockEnv>(dimX, dimY, dimZ, name));
    }

    emit environmentsChanged();
    return true;
}

