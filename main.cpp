#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QSortFilterProxyModel>
#include <QDebug>

#include "sqlquerymodel.h"
#include "facilitymodel.h"
#include "physicianmodel.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName( "c:\\databases\\access_data.db");
    //db.setDatabaseName( "release\\access_data.db");
    db.open();

    SqlQueryModel patientModel;
    patientModel.setQuery("SELECT * FROM patients ORDER BY lastname, firstname");

    SqlQueryModel accessModel;
    accessModel.setQuery("SELECT * FROM accesses");

    FacilityModel facilities;
    facilities.setTable("facility");
    facilities.setSort(1, Qt::AscendingOrder);
    facilities.select();
    facilities.setFilter("isActive = 1");

    PhysicianModel physicians;
    physicians.setTable("physician");
    physicians.select();
    physicians.setFilter("isActive = 1");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("accessList", &accessModel);
    engine.rootContext()->setContextProperty("patientList", &patientModel);
    engine.rootContext()->setContextProperty("facilityList", &facilities);
    engine.rootContext()->setContextProperty("physicianList", &physicians);

    engine.load(QUrl(QStringLiteral("qrc:/MainWindow3.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    window->showMaximized();


    return app.exec();
}
