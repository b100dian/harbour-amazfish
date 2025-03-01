#include "gtr2device.h"
#include "gtr2firmwareinfo.h"

Gtr2Device::Gtr2Device(const QString &pairedName, QObject *parent) : Gts2Device(pairedName,parent)
{
    qDebug() << "Creating GTR 3 Pro Device";
}

QString Gtr2Device::deviceType() const
{
    return "amazfitgtr3";
}

AbstractFirmwareInfo *Gtr2Device::firmwareInfo(const QByteArray &bytes)
{
    return new Gtr2FirmwareInfo(bytes);
}
