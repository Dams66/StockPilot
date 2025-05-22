#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QWindow>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    app.setWindowIcon(QIcon(":/assets/LogoWithoutText.png"));

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
