% Transmittance with Illuminant C
% lambda from 380 to 780 nm

function trasmitIlluminantC = RegulationTransmitC(measure)

    load workspaceNormativaLentiBluBlock.mat;

    V_voluti = V_lambda(21:5:421); %restringo V alle lambda che voglio usando gli indici perchè è già al passo giusto
    illuminantCInterp = interp1(lambdaIlluminantC,IlluminantC,[(340:5:830)']); %interpolo C al passo 1
    illuminantCInterp = [[(340:5:830)'] illuminantCInterp]; %associo ai valori associati le sue lambda per poter usare lo script "selezionaSottoSpettro"
    illuminanteC_voluti = selezionaSottoSpettro(illuminantCInterp,380,780,1);
    illuminanteC_voluti = illuminanteC_voluti(:,2); %dallo spettro selezionato seleziono solo la seconda colonna dei valori di C

    nomiLenti = fieldnames(measure);
    
    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tau_voluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tau_voluti = tau_voluti(:,2);

        trasmitIlluminantC.(nomeLente) = sum(tau_voluti .* illuminanteC_voluti .* V_voluti) ./ sum(illuminanteC_voluti .* V_voluti);
    end
    
end