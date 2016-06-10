TEMPLATE = app

QT += qml quick widgets sql

CONFIG += c++11

SOURCES += main.cpp \
    sqlquerymodel.cpp \
    sqlrelationatablemodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    sqlquerymodel.h \
    sqlrelationatablemodel.h

DISTFILES += \
    Patients.qml \
    ContactModel.qml \
    AccessGrid.qml \
    FacilitiesGrid.qml \
    EditFacility.qml
