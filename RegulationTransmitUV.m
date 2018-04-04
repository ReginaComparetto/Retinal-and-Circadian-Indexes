% Transmittance factor for UV,UVA,UVB

function [TransmittUV, TransmittUVA, TransmittUVB] = RegulationTransmitUV(measure)

    % script_structmisureLentiTrasparenti; %richiamo la struttura che voglio usare

    load workspaceNormativaLentiBluBlock.mat % script dove ho i parametri che mi servono per il calcolo

    %LambdaW e W sono da 280 a 380 a passi di 5
    % UV, 280-380
    % UVA, 315-380
    % UVB, 280-315

    TransmittUV = struct();
    TransmittUVA = struct();
    TransmittUVB = struct();

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau

        tauUV = selezionaSottoSpettro(tau, 280, 380, 1);
        tauUV = tauUV(:,2);

        tauUVA = selezionaSottoSpettro(tau, 315, 380, 1);
        tauUVA = tauUVA(:,2);
        W_UVA = W(8:21,:);

        tauUVB = selezionaSottoSpettro(tau, 280, 315, 1);
        tauUVB = tauUVB(:,2);
        W_UVB = W(1:8,:);

        TransmittUV.(nomeLente) = sum(tauUV .* W) ./ sum(W);
        TransmittUVA.(nomeLente) = sum(tauUVA .* W_UVA) ./ sum(W_UVA);
        TransmittUVB.(nomeLente) = sum(tauUVB .* W_UVB) ./ sum(W_UVB);
    end

    %clear lambdaUV tauUV tauUVA tauUVB W_UVA W_UVB
    %clear IlluminantC lambdaIlluminantC lambdaSD65 lambdaV lambdaW lambdaWB SA_V_tauS SD65 V_lambda WB W
    %clear i lambda lambdaLenti nomiLentiTrasparenti tauVoluti nomeLente tau 
end