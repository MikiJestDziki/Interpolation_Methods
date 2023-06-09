clear all
close all
%projekt main
err = LagrangeInterpolation(4,"LagrangeFewNodes", false);
errors(:, 1) = transpose(err);
err = LagrangeInterpolation(10,"LagrangeMediumNodes", false);
errors(:,2) = transpose(err);
err = LagrangeInterpolation(25, "LagrangeaLotNodes", false);
errors(:,3) = transpose(err);
err = LagrangeInterpolation(14, "LagrangeUnequal", true);
errors(:,4) = transpose(err);
err = SplinesInterpolation(4,"SplinesFewNodes", false);
errors(:,5) = transpose(err);
err = SplinesInterpolation(10, "SplinesMediumNodes", false);
errors(:,6) = transpose(err);
err = SplinesInterpolation(25,"SplinesaLotNodes", false);
errors(:,7) = transpose(err);
err = SplinesInterpolation(14, "SplinesUnequal", true);
errors(:,8) = transpose(err);
xlswrite('bledy_sredniokwadratowe.xlsx',errors);
close all

errors = transpose(errors);

figure
semilogy([4,10,25],errors(1:3, 1));
hold on
semilogy([4,10,25],errors(5:7, 1)), title("Błędy średniokwadratowe - Głębia Challengera."), xlabel("Liczba węzłów"), ylabel("błąd średniokwadratowy[m]"), legend("lagrange", "Splines");
saveas(gcf, "BladSrGlebiaChallengera.png")

figure
semilogy([4,10,25],errors(1:3, 2));
hold on
semilogy([4,10,25],errors(5:7, 2)), title("Błędy średniokwadratowe - Spacerniak w Gdańsku."), xlabel("Liczba węzłów"), ylabel("błąd średniokwadratowy[m]"), legend("lagrange", "Splines");
saveas(gcf, "BladSrSpacerniakwGd.png")

figure
semilogy([4,10,25],errors(1:3, 3));
hold on
semilogy([4,10,25],errors(5:7, 3)), title("Błędy średniokwadratowe - Wielki Kanion Kolorado."), xlabel("Liczba węzłów"), ylabel("błąd średniokwadratowy[m]"), legend("lagrange", "Splines");
saveas(gcf, "BladSrWKK.png")

