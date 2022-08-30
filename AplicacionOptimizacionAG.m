%Aplicaci�n optimizaci�n de un sistema difuso que convierte una se�al triangular a seno

close all
clear all
warning off

%Condici�n inicial
x=[0.2 50 0.2 55 0.2 65 0.2 75 0.2 80 0.2 7 0.2 8 0.2 10.5 0.2 13 0.2 14 0.2 5 0.2 6 0.2 8.75 0.2 10 0.2 12];

%Importar datos
[Age, BLine, TUG] = functionData("Datos.txt");

%Sistema difuso sin optimizar
a=generafis(x)
Sr=evalfis([Age BLine],a);

%Presentaci�n de resultados
hold on
plot(Age, BLine,'or','MarkerFaceColor','r');
plot(Age, Sr, 'sb','MarkerFaceColor','b');
legend('Salida Real','Salida Simulada','Location','NorthWest')
hold off
xlabel('Edad')
ylabel('TUG')
title('Resultado simulaci�n')


%Optimizaci�n con algoritmos gen�ticos
optionsga = optimset('Display','iter')
x = ga(@desempe,30,optionsga)

%Sistema difuso entrenado con AG
a=generafis(x)
Sr=evalfis([Age BLine],a);

%Presentaci�n de resultados
hold on
plot(Age, BLine,'or','MarkerFaceColor','r');
plot(Age, Sr, 'sb','MarkerFaceColor','b');
legend('Salida Real','Salida Simulada','Location','NorthWest')
hold off
xlabel('Edad')
ylabel('TUG')
title('Resultado simulaci�n')

%Figura del error
e = TUG - Sr;
plot(e)

%Valor del MSE
mse = (1/length(e))*sum(e.^2)
