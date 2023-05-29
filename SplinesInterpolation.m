%Projekt 3
% Metoda funkcjami sklejanymi 3 stopnia
clear all
close all
A = importdata("./profile_wysokosciowe/GlebiaChallengera.csv");
%A = importdata("./profile_wysokosciowe/MountEverest.csv");
%A = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");

startOf = 1;
endOf = size(A.data,1);
numberOfInterpolationNodes = 25;

n = floor(endOf/(numberOfInterpolationNodes-1));
if mod(n,2) == 0
    n = n - 1;
end

RealData = A.data(startOf:endOf, :);
interpolationNodes = RealData(startOf:n:endOf, :);

%RealData = zeros(7, 2);  % Inicjalizacja macierzy 7x2 wypełnionej zerami
%for i = 1:7
%    RealData(i, 1) = i - 1;  % Wypełnienie pierwszej kolumny wartościami 0-6
%end
%RealData(2, 2) = 6;
%RealData(4,2) = -2
%RealData(6,2) = 4;

%interpolationNodes = zeros(3,2);
%interpolationNodes(1,1) = 1;
%interpolationNodes(1,2) = 6;
%interpolationNodes(2,1) = 3;
%interpolationNodes(2,2) = -2;
%interpolationNodes(3,1) = 5;
%interpolationNodes(3,2) = 4;


plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50])
hold on
scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan"), xlabel("Dystans"), ylabel("Wysokość"), title("Profil wysokościowy - Dane Rzeczywiste")

b = splines(interpolationNodes);
interpolatedValues = performSplineInterpolation(interpolationNodes,RealData,b);

xmin = 0;
xmax = max(RealData(:,1));
ymin = min(RealData(:,2));
ymax = max(RealData(:,2)) + 10;
figure
plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]);
hold on
scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan");
plot(interpolatedValues(:,1), interpolatedValues(:,2)), xlabel("Dystans"), ylabel("Wysokość"), title("Profil wysokościowy - Interpolacja splajnami 3 stopnia"), xlim([xmin, xmax]), ylim([ymin, ymax])