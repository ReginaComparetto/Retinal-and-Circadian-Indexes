% Calculation of the Retinal Index with illuminant SD65

function RI = RetinalIndexSD65(measure)

    load WorkspaceCircadianRetinalData.mat % dove ho B e M di lambda

    % RI calcolato sempre da 380 a 780. Tutte le lenti sono a passi di 5

    BlueLightHazardVoluti = selezionaSottoSpettro(blueLightHazard, 380, 780, 1);
    illuminanteD65Voluti = selezionaSottoSpettro(illuminanteD65, 380, 780, 5);

    BlueLightHazardVoluti = BlueLightHazardVoluti(:,2);
    illuminanteD65Voluti = illuminanteD65Voluti(:,2);

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tau_voluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tau_voluti = tau_voluti(:,2);

        RI.(nomeLente) = (sum(tau_voluti .* illuminanteD65Voluti .* BlueLightHazardVoluti) ./ sum(illuminanteD65Voluti .* BlueLightHazardVoluti))/100;
    end
end