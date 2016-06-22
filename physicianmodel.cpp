#include "physicianmodel.h"

#include <QDebug>
#include <QSqlRecord>
#include <QSqlError>
#include <QSqlIndex>

PhysicianModel::PhysicianModel()
{

}

void PhysicianModel::setTable(const QString &tableName) {
    SqlQueryModel::setTable(tableName);
    SqlQueryModel::generateRoleNames();
}

void PhysicianModel::setQFilter(QString filterString)
{
    SqlQueryModel::setFilter(filterString);
}

bool PhysicianModel::updateRecord(int recNumber, QString firstName, QString lastName,  QString portraitFile,
                  int isNephrologist, int isVascular,
                  int isInterventionalist, int isActive) {

    QSqlRecord myRecord = record(recNumber);

    myRecord.setValue("firstname", firstName);
    myRecord.setValue("lastname", lastName);
    myRecord.setValue("portrait_source", portraitFile);
    myRecord.setValue("isNephrologist", isNephrologist);
    myRecord.setValue("isVascular", isVascular);
    myRecord.setValue("isInterventionalist", isInterventionalist);
    myRecord.setValue("isActive", isActive);

    setRecord(recNumber, myRecord);
    bool ok = submitAll();

    if (!ok) {
        qDebug() << "Error: Update Failed";
        QSqlError myError = lastError();
        qDebug() << myError.databaseText() ;
        qDebug() << myError.driverText();
        qDebug() << myError.nativeErrorCode();
    }

    select();  // To update the model after my changes were made

    return true;
}

bool PhysicianModel::newRecord(QString firstName, QString lastName, QString portraitFile,
               int isNephrologist, int isVascular,
               int isInterventionalist, int isActive) {

    QSqlRecord myRecord = record();

    myRecord.setValue("firstname", firstName);
    myRecord.setValue("lastname", lastName);
    myRecord.setValue("portrait_source", portraitFile);
    myRecord.setValue("isNephrologist", isNephrologist);
    myRecord.setValue("isVascular", isVascular);
    myRecord.setValue("isInterventionalist", isInterventionalist);
    myRecord.setValue("isActive", isActive);

    insertRecord(-1, myRecord);
    bool ok = submitAll();

    if (!ok) {
        qDebug() << "Error: Update Failed";
        QSqlError myError = lastError();
        qDebug() << myError.databaseText() ;
        qDebug() << myError.driverText();
        qDebug() << myError.nativeErrorCode();
    }

    select();  // To update the model after my changes were made

    return true;
}
