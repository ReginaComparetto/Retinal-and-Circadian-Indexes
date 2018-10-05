% Calculation of the Melanopsis Circadian Index with illuminant SD65

function MCI = CircadianIndexSD65(measure)

    load WorkspaceCircadianRetinalData.mat % dove ho B e M di lambda

    % MCI sempre da 380 a 780. Tutte le lenti sono a passi di 5
   
    MlambdaVoluti = selezionaSottoSpettro(mlambdainterpolato, 380, 780, 1);
    illuminanteD65Voluti = selezionaSottoSpettro(illuminanteD65, 380, 780, 5);

    MlambdaVoluti = MlambdaVoluti(:,2);
    illuminanteD65Voluti = illuminanteD65Voluti(:,2);

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2);

        MCI.(nomeLente) = (sum(tauVoluti .* illuminanteD65Voluti .* MlambdaVoluti) ./ sum(illuminanteD65Voluti .* MlambdaVoluti))/100;
    end
end
