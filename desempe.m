function mse=desempe(x)
%Función de desempeño

%Importar datos
[Age, BLine, TUG] = functionData("Datos.txt");

%Generar el sistema difuso
a=generafis(x);

%Evaluar el sistema difuso
Sr=evalfis([Age BLine],a);

%Calcular el índice de desempeño
mse=1/length(Age)*sum((TUG-Sr).^2);
