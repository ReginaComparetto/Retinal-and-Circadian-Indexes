function measure = StructMeasureLenses(measure)

    lenses = load('workspaceDATA_LENSES.mat');

    lambda = lenses.lambdaLENSES;
    
    measure.Lens1 = [ lambda, lenses.meanLens1 lenses.stdLens1 ];
    measure.Lens2 = [ lambda, lenses.meanLens2 lenses.stdLens2 ];
    measure.Lens3 = [ lambda, lenses.meanLens3 lenses.stdLens3 ];
    measure.Lens4 = [ lambda, lenses.meanLens4 lenses.stdLens4 ];
    measure.Lens5 = [ lambda, lenses.meanLens5 lenses.stdLens5 ];
    measure.Lens6 = [ lambda, lenses.meanLens6 lenses.stdLens6 ];
    measure.Lens7 = [ lambda, lenses.meanLens7 lenses.stdLens7 ];
    measure.Lens8 = [ lambda, lenses.meanLens8 lenses.stdLens8 ];
    measure.Lens9 = [ lambda, lenses.meanLens9 lenses.stdLens9 ];
    measure.Lens10 = [ lambda, lenses.meanLens10 lenses.stdLens10 ];
    measure.Lens11 = [ lambda, lenses.meanLens11 lenses.stdLens11 ];
    measure.Lens12 = [ lambda, lenses.meanLens12 lenses.stdLens12 ];
    measure.Lens13 = [ lambda, lenses.meanLens13 lenses.stdLens13 ];
    measure.Lens14 = [ lambda, lenses.meanLens14 lenses.stdLens14 ];
    measure.Lens15 = [ lambda, lenses.meanLens15 lenses.stdLens15 ];
    measure.Lens16 = [ lambda, lenses.meanLens16 lenses.stdLens16 ];
    measure.Lens17 = [ lambda, lenses.meanLens17 lenses.stdLens17 ];
    measure.Lens18 = [ lambda, lenses.meanLens18 lenses.stdLens18 ];
    measure.Lens19 = [ lambda, lenses.meanLens19 lenses.stdLens19 ];
    measure.Lens20 = [ lambda, lenses.meanLens20 lenses.stdLens20 ];
    measure.Lens21 = [ lambda, lenses.meanLens21 lenses.stdLens21 ];
    
end