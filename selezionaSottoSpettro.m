% Funzione per selezionare da uno spettro di partenza solo la parte nel range
% di lambda voluti
% ATTENZIONE AL PASSO!
% es: se quello di partenza è a passo 1 e io voglio qualcosa a passo 5 ---> passo 5
% es: se quello di partenza è a passo 5 e io voglio qualcosa a passo 5 ---> passo 1

% "spettro" deve avere due colonne, la prima con le lambda, la seconda con
% i valori associati

% lo script restituisce due colonne, lambda e valore associato

function sottoSpettro = selezionaSottoSpettro(spettro, lambdaInizio, lambdaFine, passo)
    indiceInizio = find(spettro(:,1) == lambdaInizio);
    indiceFine = find(spettro(:,1) == lambdaFine);
    sottoSpettro = spettro(indiceInizio:passo:indiceFine, :);
end