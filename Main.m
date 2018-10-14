% Calculation of regulations

measure = struct();

measure = StructMeasureLenses(measure);


transmitIlluminantSD65 = RegulationTransmittanceD65(measure);
transmitIlluminantC = RegulationTransmitC(measure);
transmittBlue = RegulationTransmittBlueLight(measure);
[TransmittUV, TransmittUVA, TransmittUVB] = RegulationTransmitUV(measure);
[QRed, QYellow, QGreen, QBlue] = RegulationQrgby(measure);

[RI_LCD RI_D65] = RetinalIndex(measure);
[NLCI_ipad NLCI_D65] = NonLinearCircadianIndex(misure);
[CII_ipad CII_D65] = CircadianImpactIndex(misure);

ScotopicEfficiency = calcoloEffScotopica(measure);
