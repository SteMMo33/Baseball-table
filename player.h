#ifndef PLAYER_H
#define PLAYER_H

#include <QObject>
#include <QDebug>
#include "QString"
#include "QJsonObject"


class Player : public QObject
{
    Q_OBJECT

public:
    Player(QString nome, QString cognome, int casacca) : mNome(nome), mCognome(cognome), mCasacca(casacca) {
        qDebug() << "[Player][c'tor]";
    };

    Player(QJsonObject &obj) {
        qDebug() << "[Player][c'tor]";
        read(obj);
    };

    // Operazioni JSON
    void read(const QJsonObject &json);
    void toJson(QJsonObject &json) const;


private:
    QString mNome;
    QString mCognome;
    QString mRuolo;
    int mCasacca;
};

#endif // PLAYER_H
