#ifndef WEATHERINFO_H
#define WEATHERINFO_H

#include <QObject>

#include <QDebug>

/*#include <QMenuBar>
#include <QToolBar>
#include <QAction>*/

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QUrlQuery>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include <QSortFilterProxyModel>

#include <QList>
#include <QFile>

class WeatherInfo : public QObject
{
public:
    WeatherInfo(QObject *parent = 0);
    void getWeatherData();

private:
    //QMenu *fileMenu;
    QNetworkAccessManager *addressRequest;
    QNetworkReply *m_reply;

};

#endif // WEATHERINFO_H
