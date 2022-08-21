#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "team.h"



int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    // Vedere https://makina-corpus.com/blog/metier/archives/access-json-webservice-qt-c
    // Vedere http://melannj.blogspot.com/2015/10/consuming-restful-web-service-with-c.html

    // Tipi pubblicati - problemi con 5.7.1 per simbolo QML_ELEMENT
    //qmlRegisterType<Team>("com.stemmo.baseball", 1, 0, "Team");
    //qmlRegisterType<Player>("com.stemmo.baseball", 1, 0, "Player");

    Team teamVisitor;
    Team teamHome;

    engine.rootContext()->setContextProperty( "teamVisitor", &teamVisitor);
    engine.rootContext()->setContextProperty( "teamHome", &teamHome);

    return app.exec();
}
