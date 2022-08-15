#ifndef TEAM_H
#define TEAM_H

#include "QString"
#include "QList"
#include "player.h"


class Team
{
public:
    Team();

    QString nome() const;
    void setNome(const QString &nome);

    QString nomeCorto() const;
    void setNomeCorto(const QString &nomecorto);

    // Operazioni JSON
    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;


    int Load(QString filename);
    int Save();

private:
    QString mNome;
    QString mNomeShort;
    QList<Player> mRoster;
    QString mLogo;
    QString mFilename;
};

#endif // TEAM_H
