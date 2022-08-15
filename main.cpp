#include <QApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Vedere https://makina-corpus.com/blog/metier/archives/access-json-webservice-qt-c
    // Vedere http://melannj.blogspot.com/2015/10/consuming-restful-web-service-with-c.html


    return app.exec();
}
