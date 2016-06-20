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

};

#endif // PHYSICIANMODEL_H
