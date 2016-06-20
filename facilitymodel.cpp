#include "facilitymodel.h"

#include <QDebug>
#include <QSqlRecord>
#include <QSqlError>
#include <QSqlIndex>

FacilityModel::FacilityModel()
{

}

void FacilityModel::setTable(const QString &tableName){
    SqlQueryModel::setTable(tableName);
    SqlQueryModel::generateRoleNames();
}


bool FacilityModel::updateRecord(int recNumber, int facilityId, QString facilityName, QString address,
                  QString city, QString facilityState, QString zipcode, int isActive) {

//    qDebug() << "Calling UpDateRecord()";
//    qDebug() << "  Record Number: " << recNumber;
//    qDebug() << "  ID:            " << facilityId;
//    qDebug() << "  FacilityName:  " << facilityName;
//    qDebug() << "  Address:       " << address;
//    qDebug() << "  City:          " << city;
//    qDebug() << "  State:         " << facilityState;
//    qDebug() << "  Zip Code:      " << zipcode;
//    qDebug() << "======================";

    QSqlRecord myRecord = record(recNumber);

//    qDebug() << "Contains 'id'? " << myRecord.contains("id");
//    qDebug() << "ID Field Value: " << myRecord.value("id");
//    qDebug() << "Primary Key: " << primaryKey().name();
//    qDebug() << "myRecord: " << myRecord;
//    QSqlIndex pkey = primaryKey();


    myRecord.setValue("facilityName", facilityName);
    myRecord.setValue("address", address);
    myRecord.setValue("city", city);
    myRecord.setValue("facilityState", facilityState);
    myRecord.setValue("zipcode", zipcode);
    myRecord.setValue("isActive", isActive);

//    qDebug() << "myRecord: " << myRecord;
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

bool FacilityModel::newRecord(QString facilityName, QString address,
                  QString city, QString facilityState, QString zipcode, int isActive) {

    qDebug() << "Calling UpDateRecord()";
    qDebug() << "  FacilityName:  " << facilityName;
    qDebug() << "  Address:       " << address;
    qDebug() << "  City:          " << city;
    qDebug() << "  State:         " << facilityState;
    qDebug() << "  Zip Code:      " << zipcode;
    qDebug() << "======================";

    QSqlRecord myRecord = record();

//    qDebug() << "Contains 'id'? " << myRecord.contains("id");
//    qDebug() << "ID Field Value: " << myRecord.value("id");
//    qDebug() << "Primary Key: " << primaryKey().name();
//    qDebug() << "myRecord: " << myRecord;
//    QSqlIndex pkey = primaryKey();


    myRecord.setValue("facilityName", facilityName);
    myRecord.setValue("address", address);
    myRecord.setValue("city", city);
    myRecord.setValue("facilityState", facilityState);
    myRecord.setValue("zipcode", zipcode);
    myRecord.setValue("isActive", isActive);

//    qDebug() << "myRecord: " << myRecord;
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

