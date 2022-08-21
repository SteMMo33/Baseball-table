#include <QDebug>

#include "player.h"



void Player::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString())
        mNome = json["name"].toString();

    if (json.contains("lastname") && json["lastname"].isString())
        mCognome = json["lastname"].toInt();

    if (json.contains("uniform") && json["uniform"].isString())
        mCasacca = json["uniform"].toInt();
}


void Player::toJson(QJsonObject &json) const
{
    qDebug() << "[Player][toJson] " << mNome;
    json["name"] = mNome;
    json["lastname"] = mCognome;
    json["ruolo"] = mRuolo;
    json.insert("uniform", mCasacca);
}
