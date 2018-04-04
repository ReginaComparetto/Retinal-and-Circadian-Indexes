% Scotopic Efficiency

function EfficienzaScotopica = ScotopicEfficiency(measure)

    load workspaceNormativaLentiBluBlock.mat;
    
    lambda = ([380:5:780])';
    
    Vscotopica_Voluta = interp1(Vscotopica(:,1),Vscotopica(:,2),lambda);
    
    nomiLenti = fieldnames(measure);
    
    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tau_voluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tau_voluti = tau_voluti(:,2);

        EfficienzaScotopica.(nomeLente) = sum(tau_voluti .* Vscotopica_Voluta ) ./ sum(Vscotopica_Voluta);
        
    end

end