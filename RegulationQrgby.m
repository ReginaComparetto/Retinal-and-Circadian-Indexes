% Recognition of signal light and colour Q

function [QRed, QYellow, QGreen, QBlue] = RegulationQrgby(measure)

    load workspaceNormativaLentiBluBlock.mat

    %SA_V_tauS contiene il prodotto di illuminante S A*V di lambda*tau s per i
    %colori verde giallo rosso blu. sono da 780 a 380 a passo di 10 (non
    %ordinati da 380 a 780!)

    lambda_prodotto = [(380:10:780)'];
    prodottoRosso = table2array(flip(SA_V_tauS(:,2))); %SA_V_tauS=prodotto
    prodottoGiallo = table2array(flip(SA_V_tauS(:,3))); %SA_V_tauS=prodotto
    prodottoVerde = table2array(flip(SA_V_tauS(:,4))); %SA_V_tauS=prodotto
    prodottoBlu = table2array(flip(SA_V_tauS(:,5))); %SA_V_tauS=prodotto

    %interpolo tutte le grandezze al passo 5 delle lambda delle lenti BB,
    %nell'intervallo 380-780 di Q

    %lambdaLenteQ = [(380:5:780)'];
    %tauLenteInterp = interp1(lambdaLente,tauLente,lambdaLente);
    lambda_prodottoInterp = [(380:5:780)'];
    prodottoRossoInterp = interp1(lambda_prodotto,prodottoRosso,lambda_prodottoInterp);
    prodottoGialloInterp = interp1(lambda_prodotto,prodottoGiallo,lambda_prodottoInterp);
    prodottoVerdeInterp = interp1(lambda_prodotto,prodottoVerde,lambda_prodottoInterp);
    prodottoBluInterp = interp1(lambda_prodotto,prodottoBlu,lambda_prodottoInterp);

    V_Interp = interp1(lambdaV, V_lambda, lambdaSD65); %questa interpolazione serve per avere la curva V di lambda nello stesso range di lambda dell'illuminante S
    V_Interp(isnan(V_Interp)) = 0; % metto 0 nei punti che voglio interpolare ma dove non ho misure

    S_voluti = SD65(find(ismember(lambdaSD65,380:5:780)));
    V_voluti = V_Interp(find(ismember(lambdaSD65,380:5:780)));

    QRed = struct();
    QYellow = struct();
    QGreen = struct();
    QBlue = struct();

    nomiLenti = fieldnames(measure);

    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = measure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2);

        TrasmitSd65 = sum(tauVoluti .* V_voluti .* S_voluti) ./ sum(V_voluti .* S_voluti);

        TrasmitSignRosso = sum(tauVoluti .* prodottoRossoInterp) ./ sum(prodottoRossoInterp);
        QRed.(nomeLente) = TrasmitSignRosso / TrasmitSd65;

        TrasmitSignGiallo = sum(tauVoluti .* prodottoGialloInterp) ./ sum(prodottoGialloInterp);
        QYellow.(nomeLente) = TrasmitSignGiallo / TrasmitSd65;

        TrasmitSignVerde = sum(tauVoluti .* prodottoVerdeInterp) ./ sum(prodottoVerdeInterp);
        QGreen.(nomeLente) = TrasmitSignVerde / TrasmitSd65;

        TrasmitSignBlu = sum(tauVoluti .* prodottoBluInterp) ./ sum(prodottoBluInterp);
        QBlue.(nomeLente) = TrasmitSignBlu / TrasmitSd65;

    end
end
