#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QDebug>

#include "sqlquerymodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName( "c:\\databases\\access_data.db");
    //db.setDatabaseName( "release\\access_data.db");
    db.open();

    SqlQueryModel patientModel;
    patientModel.setQuery("SELECT * FROM patients ORDER BY lastname, firstname");
    qDebug() << "Patient Rows: " << patientModel.rowCount();

    SqlQueryModel accessModel;
    accessModel.setQuery("SELECT * FROM accesses");
    qDebug() << "Access Rows: " << accessModel.rowCount();

    SqlQueryModel facilityModel;
    facilityModel.setQuery("SELECT * FROM facility ORDER BY facilityName");
    qDebug() << "Facility Rows: " << facilityModel.rowCount();


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("accessList", &accessModel);
    engine.rootContext()->setContextProperty("patientList", &patientModel);
    engine.rootContext()->setContextProperty("facilityList", &facilityModel);
    engine.load(QUrl(QStringLiteral("qrc:/MainWindow3.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    window->showMaximized();


    return app.exec();
}
