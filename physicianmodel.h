#ifndef PHYSICIANMODEL_H
#define PHYSICIANMODEL_H

#include "sqlquerymodel.h"
#include <QString>

class PhysicianModel : public SqlQueryModel
{
    Q_OBJECT

public:
    PhysicianModel();
    void setTable(const QString &tableName);
    void generateRoleNames();

public slots:

    void setQFilter(QString filterString);

    bool updateRecord(int recNumber, QString firstName, QString lastName,
                      QString portraitFile, int isNephrologist, int isVascular,
                      int isInterventionalist, int isActive);

    bool newRecord(QString firstName, QString lastName,
                   QString portraitFile, int isNephrologist, int isVascular,
                   int isInterventionalist, int isActive);

};

#endif // PHYSICIANMODEL_H
