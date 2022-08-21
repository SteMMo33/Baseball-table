#ifndef TEAM_H
#define TEAM_H

#include <QObject>
#include <QString>
#include <QList>
#include <QtQml/qqml.h>

#include "player.h"



class Team : public QObject
{
    Q_OBJECT



public:
    Team();

    QString nome() const;
    void setNome(const QString &nome);

    QString nomeCorto() const;
    void setNomeCorto(const QString &nomecorto);

    // Operazioni JSON
    void read(const QJsonObject &json);
    void toJson(QJsonObject &json) const;


    Q_INVOKABLE int load();
    Q_INVOKABLE int save();

private:
    QString mNome;
    QString mNomeShort;
    QList<Player*> mRoster;
    QString mLogo;
    QString mFilename;
};

#endif // TEAM_H
