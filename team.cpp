#include "team.h"

Team::Team()
{

}


int Team::Load(QString filename)
{

}


void Team::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString())
        mNome = json["name"].toString();

    if (json.contains("level") && json["level"].isDouble())
        mNomeShort = json["level"].toString();

    if (json.contains("classType") && json["classType"].isDouble())
        mLogo = json["logo"].toString();
}


void Team::write(QJsonObject &json) const
{
    json["name"] = mNome;
    json["level"] = mNomeShort;
    json["classType"] = mLogo;
}
