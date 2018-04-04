% Blue light factor transmittance

function TrasmittBlu = RegulationTransmittBlueLight(measure)

    load workspaceNormativaLentiBluBlock.mat;

    %LambdaWB e WB sono da 380 a 500 a passi di 5
    lambdaBlu = [(380:5:500)']; %380-500 è il range indicato dalla normativa, il passo è quello con cui ho tutte le misure

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 500, 1);
        tauVoluti = tauVoluti(:,2);

        TrasmittBlu.(nomeLente) = sum(tauVoluti .* WB) ./ sum(WB);
    end
end