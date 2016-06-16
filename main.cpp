#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QDebug>

#include "sqlquerymodel.h"
#include "facilitymodel.h"

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

    FacilityModel facilities;
    //facilities.setQuery("SELECT * FROM facility ORDER BY facilityName");
    facilities.setTable("facility");
    facilities.setSort(1, Qt::AscendingOrder);
    facilities.select();
    qDebug() << "Facility Rows: " << facilities.rowCount();

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("accessList", &accessModel);
    engine.rootContext()->setContextProperty("patientList", &patientModel);
    engine.rootContext()->setContextProperty("facilityList", &facilities);
    engine.load(QUrl(QStringLiteral("qrc:/MainWindow3.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    window->showMaximized();


    return app.exec();
}
