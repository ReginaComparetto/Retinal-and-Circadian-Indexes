% Transmittance with Illuminant D65
% lambda from 380 to 780 nm

function trasmitIlluminantSD65 = RegulationTransmittanceD65(measure)

     load workspaceNormativaLentiBluBlock.mat;

    V_voluti = V_lambda(21:5:421); %restringo V alle lambda che voglio usando gli indici perchè è già al passo giusto
    illuminanteSD65_voluti = SD65(81:5:481); %faccio lo stesso per l'illuminante

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tau_voluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tau_voluti = tau_voluti(:,2);

        trasmitIlluminantSD65.(nomeLente) = sum(tau_voluti .* illuminanteSD65_voluti .* V_voluti) ./ sum(illuminanteSD65_voluti .* V_voluti);
    end
    
end