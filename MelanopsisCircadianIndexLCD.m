% Calculation of Melanopsis Circadian Index with LCD (iPad)

function MCI_LCD = MelanopsisCircadianIndexLCD(measure)

    load WorkspaceCircadianRetinalData.mat % dove ho B e M di lambda

    % MCI calcolato da 380 a 780. Tutte le lenti sono a passi di 5
   
    MlambdaVoluti = selezionaSottoSpettro(mlambdainterpolato, 380, 780, 1);
    iPadVoluti = selezionaSottoSpettro(ipad, 380, 780, 5);

    MlambdaVoluti = MlambdaVoluti(:,2);
    iPadVoluti = iPadVoluti(:,2);

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2);

        MCI_LCD.(nomeLente) = (sum(tauVoluti .* iPadVoluti .* MlambdaVoluti) ./ sum(iPadVoluti .* MlambdaVoluti))/100;
    end
end
