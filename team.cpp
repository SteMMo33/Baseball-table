
#include <QDebug>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>
#include <QFileDialog>

#include "team.h"


Team::Team()
{
    qDebug() << "[Team][c'tor]";

    Player* p1 = new Player( "Stefano", "Mora", 21);
    mRoster.append(p1);

    p1 = new Player( "Roberto", "Mora", 66);
    mRoster.append(p1);
}


int Team::load()
{
    qDebug() << "[Team][load]";

    // Scelta del nome del file
    QString fname = QFileDialog::getOpenFileName(nullptr, "Scegli il file della squadra", ".", "JSON file (*.json)" );
    qDebug() << "[load] filename is:" << fname;
    if (fname.isEmpty())
        return 0;

    // Lettura file json
    QFile file(fname);
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    QByteArray bytes = file.read(20000);
    file.close();

    QJsonDocument document = QJsonDocument::fromJson(bytes);
    QJsonObject object = document.object();
    read(object);

    return 1;
}



int Team::save()
{
    qDebug() << "[Team][save]";

    // Scelta del nome del file
    QString fname = QFileDialog::getSaveFileName(nullptr, "Scegli il nome del file", ".", "JSON file (*.json)" );
    qDebug() << "[save] filename is:" << fname;
    if (fname.isEmpty())
        return 0;

    QJsonObject json;
    toJson(json);

    QFile file("newTeam.json");
    file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Truncate);

    QJsonDocument document;
    document.setObject( json );
    QByteArray bytes = document.toJson( QJsonDocument::Indented );
    file.write(bytes);
    file.close();
    return 1;
}



/// JSON
/// \brief Team::read
/// \param json
///
void Team::read(const QJsonObject &json)
{
    if (json.contains("name") && json["name"].isString())
        mNome = json["name"].toString();

    if (json.contains("lastname") && json["lastname"].isString())
        mNomeShort = json["lastname"].toString();

    if (json.contains("logo") && json["logo"].isString())
        mLogo = json["logo"].toString();

    // Gestione roster
    mRoster.clear();

    if (json.contains("roster") && json["roster"].isArray()){
        QJsonArray array = json["roster"].toArray();
        foreach (const QJsonValue & v, array){
            qDebug() << v.toObject().value("name").toString();
            QJsonObject obj = v.toObject();
            Player* p= new Player(obj);
            mRoster.append(p);
        }
    }
    qDebug() << "[Team][read] Nome:" << mNome << "- Roster" << mRoster.length() << "elementi";
}


/**
 * JSON
 * @brief Team::write
 * @param json
 */
void Team::toJson(QJsonObject &json) const
{
    qDebug() << "[Team][toJson]";
    json["name"] = "NOME"; // mNome;
    json["shortname"] = "NOM"; // mNomeShort;
    json["logo"] = "LOGO"; // mLogo;

    QJsonArray jsonRoster;
    for ( Player* p : mRoster ){
        QJsonObject v;
        p->toJson(v);
        jsonRoster.append(v);
    }
    json.insert("roster", jsonRoster);
}
