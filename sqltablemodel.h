#ifndef SQLTABLEMODEL_H
#define SQLTABLEMODEL_H

#include <QSqlTableModel>

class SqlTableModel : public QSqlTableModel
{
    Q_OBJECT

public:
    explicit SqlTableModel(QObject *parent = 0);

    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const {	return m_roleNames;	}
    void generateRoleNames();

private:

    QHash<int, QByteArray> m_roleNames;

public slots:
};

#endif // SQLTABLEMODEL_H
