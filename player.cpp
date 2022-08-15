#include "player.h"

Player::Player()
{

}



void Player::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString())
        mNome = json["name"].toString();

    if (json.contains("level") && json["level"].isDouble())
        mCognome = json["level"].toInt();

    if (json.contains("classType") && json["classType"].isDouble())
        mRuolo = json["classType"].toString();
}


void Player::write(QJsonObject &json) const
{
    json["name"] = mNome;
    json["level"] = mCognome;
    json["classType"] = mRuolo;
}
