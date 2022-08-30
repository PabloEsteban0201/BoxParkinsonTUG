function mse=desempe(x)
%Funci�n de desempe�o

%Importar datos
[Age, BLine, TUG] = functionData("Datos.txt");

%Generar el sistema difuso
a=generafis(x);

%Evaluar el sistema difuso
Sr=evalfis([Age BLine],a);

%Calcular el �ndice de desempe�o
mse=1/length(Age)*sum((TUG-Sr).^2);
