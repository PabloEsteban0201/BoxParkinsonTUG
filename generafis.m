function a=generafis(x)
%Función para generar el sistema difuso

%Entrada, salida y funciones de pertenencia
a=newfis('signalts');
a=addvar(a,'input','EDAD',[48 80]);
a=addmf(a,'input',1,'A','gaussmf',[x(1) x(2)]);
a=addmf(a,'input',1,'B','gaussmf',[x(3) x(4)]);
a=addmf(a,'input',1,'C','gaussmf',[x(5) x(6)]);
a=addmf(a,'input',1,'D','gaussmf',[x(7) x(8)]);
a=addmf(a,'input',1,'E','gaussmf',[x(9) x(10)]);

a=addvar(a,'input','BL',[6 15]);
a=addmf(a,'input',2,'F','gaussmf',[x(11) x(12)]);
a=addmf(a,'input',2,'G','gaussmf',[x(13) x(14)]);
a=addmf(a,'input',2,'H','gaussmf',[x(15) x(16)]);
a=addmf(a,'input',2,'I','gaussmf',[x(17) x(18)]);
a=addmf(a,'input',2,'J','gaussmf',[x(19) x(20)]);


a=addvar(a,'output','TUG',[4.5 13]);
a=addmf(a,'output',1,'K','gaussmf',[x(21) x(22)]);
a=addmf(a,'output',1,'L','gaussmf',[x(23) x(24)]);
a=addmf(a,'output',1,'M','gaussmf',[x(25) x(26)]);
a=addmf(a,'output',1,'N','gaussmf',[x(27) x(28)]);
a=addmf(a,'output',1,'O','gaussmf',[x(29) x(30)]);

%plotmf(a,'output',1)

%Reglas del sistema difuso
ruleList=[
  	1 1 1 1 1
   	2 2 2 1 1
    3 3 3 1 1
    4 4 4 1 1
    5 5 5 1 1
    ];

%Sistema difuso
a = addrule(a,ruleList);
