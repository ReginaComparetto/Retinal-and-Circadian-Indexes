% Calcolo NLCI di un illuminante e dello stesso
% illuminante filtrato da lenti
% ADDITIONAL FILE 1 dell'articolo CIRCADIAN LIGHT di REA, FIGUEIRO 2010
% CL = circadian light [W/m^2]
% ATTENZIONE AL RANGE DI LAMBDA E AL SALTO DI LAMBDA!!


function [NLCI_ipad NLCI_D65] = calcoloNLCI(misure)
%function rapportoCL = calcoloindiciCL_lenti(misure)

load workspaceINDICICIRCADIANI.mat
load WorkspaceCircadianRetinalData.mat;

MlambdaVoluti = selezionaSottoSpettro(M, 380, 780, 1);
slambdaVoluti = selezionaSottoSpettro(S_cone, 380, 780, 1);
V10lambdaVoluti = selezionaSottoSpettro(V10, 380, 780, 1);
VscotopicaVoluti = selezionaSottoSpettro(Vscotopica, 380, 780, 1);

V10lambdaVoluti = V10lambdaVoluti(:,2);
slambdaVoluti = slambdaVoluti(:,2);
MlambdaVoluti = MlambdaVoluti(:,2);
VscotopicaVoluti = VscotopicaVoluti(:,2);

%% IPAD
iPadVoluti = selezionaSottoSpettro(ipad, 380, 780, 5);  % modifica lambda per selezionaSottoSpettro!
iPadVoluti = iPadVoluti(:,2);

% ATTENZIONE!! *10 SE FACCIO IL CONTO OGNI 10nm, *5 OGNI 5nm...
R_spettro = (sum( iPadVoluti .* VscotopicaVoluti )) * 5;
G_spettro = (sum( iPadVoluti .* MlambdaVoluti )) * 5;
B_spettro = (sum( iPadVoluti .* slambdaVoluti )) * 5;
Y_spettro = (k .* sum( iPadVoluti .* V10lambdaVoluti )) * 5;

if B_spettro - Y_spettro >= 0;
   CL_spettro = (a1 * G_spettro) - b1 + a2 * (B_spettro - Y_spettro) - b2 - a3 * (1 - exp((-R_spettro)/(rodSat)));
else CL_spettro = (a1 * G_spettro) - b1;
end

% CLa_spettro = 5831 * CL_spettro;
% CS_spettro = 0.75 - (0.75) / (1 + (CLa_spettro/215.75)^0.864);


    nomiLenti = fieldnames(misure);
    
    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = misure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2) ./ 100;
        
        % ATTENZIONE!! *10 SE FACCIO IL CONTO OGNI 10nm, *5 OGNI 5nm...
        R_spettrofiltrato.(nomeLente) = (sum( iPadVoluti .* tauVoluti .* VscotopicaVoluti )) * 5;
        G_spettrofiltrato.(nomeLente) = (sum( iPadVoluti .* tauVoluti .* MlambdaVoluti )) * 5;
        B_spettrofiltrato.(nomeLente) = (sum( iPadVoluti .* tauVoluti .* slambdaVoluti )) * 5;
        Y_spettrofiltrato.(nomeLente) = (k .* sum( iPadVoluti .* tauVoluti .* V10lambdaVoluti )) * 5;


        if B_spettrofiltrato.(nomeLente) - Y_spettrofiltrato.(nomeLente) >= 0;
           CL_spettrofiltrato.(nomeLente) = (a1 * G_spettrofiltrato.(nomeLente)) - b1 + a2 * (B_spettrofiltrato.(nomeLente) - Y_spettrofiltrato.(nomeLente)) - b2 - a3 * (1 - exp((-R_spettrofiltrato.(nomeLente))/(rodSat)));
        else CL_spettrofiltrato.(nomeLente) = (a1 * G_spettrofiltrato.(nomeLente)) - b1;
        end
           
        % CLa_spettrofiltrato.(nomeLente) = 5831 * CL_spettrofiltrato.(nomeLente);
        % CS_spettrofiltrato.(nomeLente) = 0.75 - (0.75) / (1 + (CLa_spettrofiltrato.(nomeLente)/215.75)^0.864);
        
        NLCI_ipad.(nomeLente) = CL_spettrofiltrato.(nomeLente) ./ CL_spettro;
        
    end


%% ILLUMINANT D65 USATO IN TESI
illuminanteD65Voluti = selezionaSottoSpettro(illuminanteD65, 380, 780, 5);
illuminanteD65Voluti = illuminanteD65Voluti(:,2);
%%

% ATTENZIONE!! *10 SE FACCIO IL CONTO OGNI 10nm, *5 OGNI 5nm...
R_spettro = (sum( illuminanteD65Voluti .* VscotopicaVoluti )) * 5;
G_spettro = (sum( illuminanteD65Voluti .* MlambdaVoluti )) * 5;
B_spettro = (sum( illuminanteD65Voluti .* slambdaVoluti )) * 5;
Y_spettro = (k .* sum( illuminanteD65Voluti .* V10lambdaVoluti )) * 5;

if B_spettro - Y_spettro >= 0;
   CL_spettro = (a1 * G_spettro) - b1 + a2 * (B_spettro - Y_spettro) - b2 - a3 * (1 - exp((-R_spettro)/(rodSat)));
else CL_spettro = (a1 * G_spettro) - b1;
end

% CLa_spettro = 5831 * CL_spettro;
% CS_spettro = 0.75 - (0.75) / (1 + (CLa_spettro/215.75)^0.864);


    nomiLenti = fieldnames(misure);
    
    for i = 1:numel(nomiLenti)
        nomeLente = nomiLenti{i};
        tau = misure.(nomeLente)(:,1:2); % lambda e tau
        tauVoluti = selezionaSottoSpettro(tau, 380, 780, 1);
        tauVoluti = tauVoluti(:,2) ./ 100;
        
        % ATTENZIONE!! *10 SE FACCIO IL CONTO OGNI 10nm, *5 OGNI 5nm...
        R_spettrofiltrato.(nomeLente) = (sum( illuminanteD65Voluti .* tauVoluti .* VscotopicaVoluti )) * 5;
        G_spettrofiltrato.(nomeLente) = (sum( illuminanteD65Voluti .* tauVoluti .* MlambdaVoluti )) * 5;
        B_spettrofiltrato.(nomeLente) = (sum( illuminanteD65Voluti .* tauVoluti .* slambdaVoluti )) * 5;
        Y_spettrofiltrato.(nomeLente) = (k .* sum( illuminanteD65Voluti .* tauVoluti .* V10lambdaVoluti )) * 5;


        if B_spettrofiltrato.(nomeLente) - Y_spettrofiltrato.(nomeLente) >= 0;
           CL_spettrofiltrato.(nomeLente) = (a1 * G_spettrofiltrato.(nomeLente)) - b1 + a2 * (B_spettrofiltrato.(nomeLente) - Y_spettrofiltrato.(nomeLente)) - b2 - a3 * (1 - exp((-R_spettrofiltrato.(nomeLente))/(rodSat)));
        else CL_spettrofiltrato.(nomeLente) = (a1 * G_spettrofiltrato.(nomeLente)) - b1;
        end
           
        % CLa_spettrofiltrato.(nomeLente) = 5831 * CL_spettrofiltrato.(nomeLente);
        % CS_spettrofiltrato.(nomeLente) = 0.75 - (0.75) / (1 + (CLa_spettrofiltrato.(nomeLente)/215.75)^0.864);
        
        NLCI_D65.(nomeLente) = CL_spettrofiltrato.(nomeLente) ./ CL_spettro;
        
    end
    
end
