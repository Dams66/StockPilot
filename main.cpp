#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>
#include <QQuickStyle>
#include <QQmlContext>

#include "stockenvmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQuickStyle::setStyle("Fusion");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    static StockEnvManager envManager;

    app.setWindowIcon(QIcon(":/assets/LogoWithoutText.png"));

    qmlRegisterSingletonInstance<StockEnvManager>("StockPilot", 1, 0, "EnvManager", &envManager);

    qmlRegisterType<StockEnv>("StockPilot", 1, 0, "StockEnv");

    engine.load(QUrl(QStringLiteral("qrc:/qml/Main.qml")));

    if (!engine.rootObjects().isEmpty()) {
        QObject* topLevel = engine.rootObjects().first();
        QWindow* window = qobject_cast<QWindow*>(topLevel);
        if (window) {
            window->showMaximized();
        }
    }

    return app.exec();
}
