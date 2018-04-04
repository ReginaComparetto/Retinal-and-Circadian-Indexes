% Calculation of regulations

measure = struct();

measure = StructMeasureLenses(measure);


transmitIlluminantSD65 = RegulationTransmittanceD65(measure);
transmitIlluminantC = RegulationTransmitC(measure);
transmittBlue = RegulationTransmittBlueLight(measure);
[TransmittUV, TransmittUVA, TransmittUVB] = RegulationTransmitUV(measure);
[QRed, QYellow, QGreen, QBlue] = RegulationQrgby(measure);

CI_SD65 = CircadianIndexSD65(measure);
RI_SD65 = RetinalIndexSD65(measure);
RI_LCD = RetinalIndexLCD(measure);
CI_LCD = CircadianIndexLCD(measure);

ScotopicEfficiency = calcoloEffScotopica(measure);