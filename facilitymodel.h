#ifndef FACILITYMODEL_H
#define FACILITYMODEL_H

#include "sqlquerymodel.h"
#include <QString>

class FacilityModel : public SqlQueryModel
{
    Q_OBJECT

public:
    FacilityModel();
    void setTable(const QString &tableName);
    void generateRoleNames();

public slots:
    bool updateRecord(const QString &msg);
    bool updateRecord(int recNumber, int facilityId, QString facilityName, QString address,
                      QString city, QString facilityState, QString zipcode);

};

#endif // FACILITYMODEL_H
