%Projekt3
% Metoda wielomianu lagrange!
clear all;
close all;
A = importdata("./profile_wysokosciowe/GlebiaChallengera.csv");
%A = importdata("./profile_wysokosciowe/MountEverest.csv");
%A = importdata("./profile_wysokosciowe/WielkiKanionKolorado.csv");
startOf = 1;
endOf = size(A.data,1);
numberOfInterpolationNodes = 11;

n = floor(endOf/(numberOfInterpolationNodes-1));
if mod(n,2) == 0
    n = n - 1;
end

RealData = A.data(startOf:endOf, :);
interpolationNodes = RealData(startOf:n:endOf, :);

plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50])
hold on
scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan"), xlabel("Dystans"), ylabel("Wysokość"), title("Profil wysokościowy - Dane Rzeczywiste")

interpolatedValues = lagrange(interpolationNodes, RealData);

xmin = 0;
xmax = max(RealData(:,1));
ymin = min(RealData(:,2));
ymax = max(RealData(:,2)) + 10;
figure
plot(RealData(:,1),RealData(:,2), LineWidth=5, Color=[0.50 0.50 0.50]);
hold on
scatter(interpolationNodes(:,1),interpolationNodes(:,2), "cyan");
plot(interpolatedValues(:,1), interpolatedValues(:,2)), xlabel("Dystans"), ylabel("Wysokość"), title("Profil wysokościowy - Interpolacja Lagrange"), xlim([xmin, xmax]), ylim([ymin, ymax])

