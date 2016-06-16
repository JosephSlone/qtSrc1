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



bool FacilityModel::updateRecord(const QString &msg)
{
    qDebug() << "Called the C++ UpDateRecord() with " << msg ;
    return true;
}

bool FacilityModel::updateRecord(int recNumber, int facilityId, QString facilityName, QString address,
                  QString city, QString facilityState, QString zipcode) {

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
