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
