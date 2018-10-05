% Calculation of regulations

measure = struct();

measure = StructMeasureLenses(measure);


transmitIlluminantSD65 = RegulationTransmittanceD65(measure);
transmitIlluminantC = RegulationTransmitC(measure);
transmittBlue = RegulationTransmittBlueLight(measure);
[TransmittUV, TransmittUVA, TransmittUVB] = RegulationTransmitUV(measure);
[QRed, QYellow, QGreen, QBlue] = RegulationQrgby(measure);

MCI_SD65 = MelanopsisCircadianIndexSD65(measure);
RI_SD65 = RetinalIndexSD65(measure);
RI_LCD = RetinalIndexLCD(measure);
MCI_LCD = MelanopsisCircadianIndexLCD(measure);

ScotopicEfficiency = calcoloEffScotopica(measure);
