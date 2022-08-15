#ifndef PLAYER_H
#define PLAYER_H

#include "QString"
#include "QJsonObject"


class Player
{
public:
    Player();

    // Operazioni JSON
    void read(const QJsonObject &json);
    void write(QJsonObject &json) const;


private:
    QString mNome;
    QString mCognome;
    QString mRuolo;
    int mCasacca;
};

#endif // PLAYER_H
