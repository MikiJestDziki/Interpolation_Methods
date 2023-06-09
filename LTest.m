%Projekt3
% Metoda wielomianu lagrange!
clear all;
close all;
Data(1) = importdata("./profile_wysokosciowe/GlebiaChallengera.csv");
Titles(1) = "Głębia Challengera";
%Data(2) = importdata("./profile_wysokosciowe/SpacerniakGdansk.csv");
%Titles(2) = "Spacerniak w Gdańsku";
%Data(3) = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
%Titles(3) = "Wielki Kanion Kolorado";

numberOfInterpolationNodes = 10;

for i = 1:numel(Data)
    startOf = 1;
    endOf = size(Data(i).data,1);
    %endOf = 240;
    numberOfData = endOf - startOf;

    n = floor((numberOfData)/(numberOfInterpolationNodes-1));
    if mod(n,2) == 0
        n = n - 1;
    end
    
    RealData = Data(i).data(startOf:endOf, :);
    %interpolationNodes = RealData(1:n:numberOfData, :);
    indices = [1,142,248,375,512];
    interpolationNodes = RealData(indices, :);
    %selectIndices = sort(randsample(indices,numberOfInterpolationNodes));
    %interpolationNodes = RealData(selectIndices,:);
    
    %figure
    %plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]), xlabel("Dystans"), ylabel("Wysokość"), title(strcat("Profil wysokościowy - ", Titles(i)))
    
    interpolatedValues = lagrange(interpolationNodes, RealData);

    err = sqrt(sum((RealData(:,2) - interpolatedValues(:,2)).^2)) / numel(RealData(:,2))
    
    xmin = 0;
    xmax = max(RealData(:,1));
    ymin = min(RealData(:,2));
    ymax = max(RealData(:,2)) + 10;
    figure
    plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]);
    hold on
    scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan");
    plot(interpolatedValues(:,1), interpolatedValues(:,2), 'r'), xlabel("Dystans"), ylabel("Wysokość"), title(strcat("Interpolacja wielomianem Lagrange - ",Titles(i))), xlim([xmin, xmax]), ylim([ymin, ymax])
    %saveas(gcf, strcat("LagrangeFewNodes", Titles(i), ".png"))
end
