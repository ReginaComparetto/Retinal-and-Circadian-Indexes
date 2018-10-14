# Mitigating retinal damage and circadian rhythm modification by blue-blocking spectacles lenses: evaluation parameters

This repository contains the MATLAB code to reproduce the numerical results of the paper "Mitigating retinal damage and circadian rhythm modification by blue-blocking spectacles lenses: evaluation parameters".
In particular, the following numerical indexes are computed:
- Retinal Index (RI) , Circadian Impact Index (CII) and Non Linear Circadian Index (NLCI) for _Standard D65_ illuminant and for _LCD Screen_ illuminant;
- Solar UV, UVA, UVA Spectral Transmittance Factor (`TransmittUV`, `TransmittUVA`, `TransmittUVB`)
- Recognition of Signal Light and Colour factor (`QRed`, `QYellow`, `QGreen`, `QBlue`)
- Solar Blue Light Transmittance Factor (`transmittBlue`)
- Transmittance Factor for Standard D65 Illuminant (`transmitIlluminantSD65`)
- Transmittance Factor for Standard C Illuminant (`transmitIlluminantC`)
- Scotopic Efficiency (`ScotopicEfficiency`)

Average spectral transmittance (`meanLensX`) and its standard deviation (`stdLensX`) of the analyzed lenses are stored in `workspaceDATA_LENSES.mat`.

To compute all the above listed parameters, run `Main.m` script.

To compute the parameters on other data, please prepare it following the format used in `StructMeasureLenses.m` and run again the `Main.m` script.
