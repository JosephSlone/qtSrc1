#ifndef SQLQUERYMODEL_H
#define SQLQUERYMODEL_H
// #include <QSqlQueryModel>
#include <QSqlTableModel>

class SqlQueryModel : public QSqlTableModel
{
    Q_OBJECT

public:
    explicit SqlQueryModel(QObject *parent = 0);

    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}
    void generateRoleNames();

private:

    QHash<int, QByteArray> m_roleNames;

public slots:

};

#endif // SQLQUERYMODEL_H
