% Script per il calcolo del Circadian Index con curva di Gall C lambda

function CI = calcoloCircadianIndex_Gall(misure)

    load workspaceINDICICIRCADIANI.mat;
    load WorkspaceCircadianRetinalData.mat;

    % CI calcolato sempre da 380 a 780. Tutte le lenti sono a passi di 5
   
    ClambdaVoluti = selezionaSottoSpettro(C, 380, 780, 1);
    ClambdaVoluti = ClambdaVoluti(:,2);
    
    %% ILLUMINANTE IPAD
%     iPadVoluti = selezionaSottoSpettro(ipad, 380, 780, 5);    
%     SpettroVoluto = iPadVoluti(:,2);
    
    %% ILLUMINANT D65 USATO IN TESI
    illuminanteD65Voluti = selezionaSottoSpettro(illuminanteD65, 380, 780, 5);
    SpettroVoluto = illuminanteD65Voluti(:,2);

    nomiLenti = fieldnames(misure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = misure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2);

        CI.(nomeLente) = (sum(tauVoluti .* SpettroVoluto .* ClambdaVoluti) ./ sum(SpettroVoluto .* ClambdaVoluti))/100;
    end
end