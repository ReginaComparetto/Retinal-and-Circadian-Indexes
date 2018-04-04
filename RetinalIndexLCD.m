% Calculation Retinal Index iPad con le lenti blue block

function RI_LCD = RetinalIndexLCD(measure)

    load WorkspaceCircadianRetinalData.mat % dove ho B e M di lambda

    % RI calcolato sempre da 380 a 780. Tutte le lenti sono a passi di 5

    BlueLightHazardVoluti = selezionaSottoSpettro(blueLightHazard, 380, 780, 1);
    iPadVoluti = selezionaSottoSpettro(ipad, 380, 780, 5);

    BlueLightHazardVoluti = BlueLightHazardVoluti(:,2);
    iPadVoluti = iPadVoluti(:,2);

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tau_voluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tau_voluti = tau_voluti(:,2);

        RI_LCD.(nomeLente) = (sum(tau_voluti .* iPadVoluti .* BlueLightHazardVoluti) ./ sum(iPadVoluti .* BlueLightHazardVoluti))/100;
    end
end