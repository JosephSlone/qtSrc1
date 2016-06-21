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

    bool updateRecord(int recNumber, int facilityId, QString facilityName, QString address,
                      QString city, QString facilityState, QString zipcode, int isActive);

    bool newRecord(QString facilityName, QString address,
                   QString city, QString facilityState, QString zipcode, int isActive);

    void setQFilter(QString filterString);


};

#endif // FACILITYMODEL_H
