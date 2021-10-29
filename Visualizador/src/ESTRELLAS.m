function [cosalidaconductorveh,cosalidacopilotoveh,coperdidacontrolveh,coadelantamientoveh,cointerseccionveh,coaccesopropiedadesveh,cosalidaconductormot,cosalidacopilotomot,coperdidacontrolmot,coadelantamientomot,cointerseccionmot,coaccesopropiedadesmot,colargomot,colargoci,cosalidaci,cointerseccionci,colargoconpe,colargocoppe,coinsppe,colatpe,EstVehiculo,EstMotocicleta,EstCiclista,EstPeaton,EstVehicul,EstMoto,EstCicl,EstPeato]=ESTRELLAS(x)
%coeficientes:Se crea funcion para sacar coeficientes
%%0.CLASIFICACION POR ESTRELLAS PARA OCUPANTE DEL VEHICULO
%Salida del camino (lado del conductor)
%Ancho carril
%Tipo de area 1=Rural; 2=Urbano
tipoare=x(38);
anchocarri=x(13);
if tipoare==1 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
elseif tipoare==1 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.2;
elseif tipoare==1 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.5;
end
if tipoare==2 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
elseif tipoare==2 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.05;
elseif tipoare==2 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.1;
end
%Curvatura
T2=[1 1 1 1;1.8 2 2 1.8;3.5 3.8 3.8 3.5;6 6.5 6.5 6];
disp('1 =  Recto o ligeramente curvado');
disp('2 = Moderado');
disp('3 = Cerrada');
disp('4 = Muy cerrada');
curvatur=x(14);
if curvatur==1 %Recto o ligeramente curvado
    for i=1:4
curvatura(1,i)=T2(1,i);
    end
end
if curvatur==2 %Moderado
    for i=1:4
curvatura(1,i)=T2(2,i);
    end
end
if curvatur==3 %Cerrada
    for i=1:4
curvatura(1,i)=T2(3,i);
    end
end
if curvatur==4 %Muy cerrada
    for i=1:4
curvatura(1,i)=T2(4,i);
    end
end
%Calidad de curva
T3=[1 1 1 1;1.25 1.4 1.25 1.4;1 1 1 1];
disp('1 = Adecuado');
disp('2 = Deficiente');
disp('3 = No Aplica');
calidadcurv=x(15);
if calidadcurv==1
    for i=1:4
    calidadcurva(1,i)=T3(1,i);
    end
end
if calidadcurv==2
    for i=1:4
    calidadcurva(1,i)=T3(2,i);
    end
end
if calidadcurv==3
    for i=1:4
    calidadcurva(1,i)=T3(3,i);
    end
end
%Delineación
%T4=[1 1 1 1;1.2 1.2 1.2 1.2];
disp('1 = Adecuado');
disp('2 = Deficiente');
delineacio=x(19);
if delineacio==1
    delineacion=1;
elseif delineacio==2
    delineacion=1.2;
end
%Bandas sonoras en el espaldón
%T5=[1.25;1]
disp('1 = Ausente');
disp('2 = Presente');
bandasonorae=x(5);
if bandasonorae==1
    bandasonoraes=1.25;
elseif bandasonorae==2
    bandasonoraes=1;
end
%Estado de la superficie de la vía
T6=[1 1 1 1 1;1.2 1.25 1.2 1.2 1.25;1.4 1.5 1.4 1.4 1.5];
disp('1 = Buena');
disp('2 = Regular');
disp('3 = Mala');
estadosuperfici=x(17);
if estadosuperfici==1
    for i=1:5
    estadosuperficie(1,i)=T6(1,i);
    end
end
if estadosuperfici==2
    for i=1:5
    estadosuperficie(1,i)=T6(2,i);
    end
end    
if estadosuperfici==3
    for i=1:5
    estadosuperficie(1,i)=T6(3,i);
    end
end
%Pendiente
%T7=[1 1 1 1;1.2 1.2 1.2 1.2;1.7 1.7 1.7 1.7];
pendient=x(16);
if pendient==1 %0 % a < 7,5  
   pendiente=1;
elseif pendient==2 %7,5  a 10 
        pendiente=1.2
elseif pendient==3 %≥ 10
        pendiente=1.7
end
%Resistencia al deslizamiento
T8=[1 1 1 1;1.4 1.6 1.4 1.6;2 2.5 2 2.5;3 4 3 4;5.5 7.5 5.5 7.5];
disp('1 = Pavimentado - adecuado');
disp('2 = Pavimentado - regular');
disp('3 = Pavimentado – pobre');
disp('4 = Sin Pavimentar – adecuado');
disp('5 = Sin Pavimentar - pobre');
resdeslizamient=x(18);
if resdeslizamient==1
    for i=1:4
   resdeslizamiento(1,i)=T8(1,i);
    end
end
if resdeslizamient==2
    for i=1:4
   resdeslizamiento(1,i)=T8(2,i);
   end
end
if resdeslizamient==3
    for i=1:4
   resdeslizamiento(1,i)=T8(3,i);
   end
end
if resdeslizamient==4
    for i=1:4
   resdeslizamiento(1,i)=T8(4,i);
   end
end
if resdeslizamient==5
    for i=1:4
   resdeslizamiento(1,i)=T8(5,i);
   end
end
%Severidad en la carretera: distancia del lado del conductor
T9=[1 1 1;0.8 0.8 0.6;0.35 0.35 0.1;0.1 0.1 0.01];
distconducto=x(1);
if distconducto==1 %0 a < 1 m
    for i=1:3
  distconductor(1,i)=T9(1,i);
    end
end
if distconducto==2 %1 a < 5 m
    for i=1:3
  distconductor(1,i)=T9(2,i);
    end
end
if distconducto==3 %5 a < 10 m
    for i=1:3
  distconductor(1,i)=T9(3,i);
    end
end
if distconducto==4 %≥ 10 m
    for i=1:3
  distconductor(1,i)=T9(4,i);
    end
end
%Severidad en la carretera: objeto del lado del conductor
T10=[12 30 30;15 25 25;12 20 20;9 30 30;55 55 55;45 45 45;40 40 40;55 55 55;45 45 45;90 90 3000;60 60 60;60 60 60;60 60 60;30 30 30;60 60 60;60 60 60;35 35 35];
disp('1 = Barrera de seguridad – metal')
disp('2 = Barrera de seguridad – hormigón')
disp('3 = Barrera de seguridad: amigable para motocicletas')
disp('4 = Barrera de seguridad - cable de acero')
disp('5 = Cara vertical agresiva en el talud en corte')
disp('6 = Pendiente ascendente del talud en corte (15° a 75°)')
disp('7 = Pendiente empinada del talud en corte (> 75°)')
disp('8 = Cuneta profunda')
disp('9 = Terraplén')
disp('10 = Precipicio')
disp('11 = Árbol (≥ 10 cm de diámetro)')
disp('12 = Letrero / poste / barra rígidos (≥ 10 cm de diámetro)')
disp('13 = Estructura / puente / edificio rígidos')
disp('14 = Estructura /edificio colapsable')
disp('15 = Extremo de barrera desprotegido')
disp('16 = Grandes rocas (≥ 20 cm de altura)')
disp('17 = Ninguno (u objeto > 20 m de la carretera)')
objconducto=x(2);
if objconducto==1
    for i=1:3
 objconductor(1,i)=T10(1,i);
    end
end
if objconducto==2
    for i=1:3
 objconductor(1,i)=T10(2,i);
    end
end
if objconducto==3
    for i=1:3
 objconductor(1,i)=T10(3,i);
    end
end
if objconducto==4
    for i=1:3
 objconductor(1,i)=T10(4,i);
    end
end
if objconducto==5
    for i=1:3
 objconductor(1,i)=T10(5,i);
    end
end
if objconducto==6
    for i=1:3
 objconductor(1,i)=T10(6,i);
    end
end
if objconducto==7
    for i=1:3
 objconductor(1,i)=T10(7,i);
    end
end
if objconducto==8
    for i=1:3
 objconductor(1,i)=T10(8,i);
    end
end
if objconducto==9
    for i=1:3
 objconductor(1,i)=T10(9,i);
    end
end
if objconducto==10
    for i=1:3
 objconductor(1,i)=T10(10,i);
    end
end
if objconducto==11
    for i=1:3
 objconductor(1,i)=T10(11,i);
    end
end
if objconducto==12
    for i=1:3
 objconductor(1,i)=T10(12,i);
    end
end
if objconducto==13
    for i=1:3
 objconductor(1,i)=T10(13,i);
    end
end
if objconducto==14
    for i=1:3
 objconductor(1,i)=T10(14,i);
    end
end
if objconducto==15
    for i=1:3
 objconductor(1,i)=T10(15,i);
    end
end
if objconducto==16
    for i=1:3
 objconductor(1,i)=T10(16,i);
    end
end
if objconducto==17
    for i=1:3
 objconductor(1,i)=T10(17,i);
    end
end
%Ancho de espaldón pavimentado (lado del conductor)
T11=[0.77 16 1.2 90 14;0.83 17 1.2 90 15;0.95 18 1.2 90 18;1 20 1.2 90 20];
anchoespaldo=x(6);
if anchoespaldo==1 %Ancho (≥ 2,4 m)
    for i=1:5
  anchoespaldon(1,i)=T11(1,i);
    end
end
if anchoespaldo==2 %Medio (≥ 1,0 m a 2,4 m)
    for i=1:5
  anchoespaldon(1,i)=T11(2,i);
    end
end
if anchoespaldo==3 %Estrecho (≥ 0 m a 1,0 m)
    for i=1:5
  anchoespaldon(1,i)=T11(3,i);
    end
end
if anchoespaldo==4 %Ninguno
    for i=1:5
  anchoespaldon(1,i)=T11(4,i);
    end
end
%Influencia del flujo externo
flujoex=x(30);
ncarrile=x(12);
volinte=x(27);
%VEHICULOS Y MOTOCICLISTAS
%1.SALIDA DEL CAMINO
%Un carril
TPDAMAX1=36001;
SAT1=(flujoex/TPDAMAX1);
SATMIN1=0.000027777;
if ncarrile==1 && SAT1<=SATMIN1
    flujoy1=0.513626834381551;
elseif ncarrile==1 && SAT1>SATMIN1 && SAT1<1
    flujoy1=-0.2436*SAT1+0.5033;
elseif ncarrile==1 && SAT1>=1
    flujoy1=0.262054507337526;
end
%Dos carriles
TPDAMAX2=56001;
SAT2=(flujoex/TPDAMAX2);
SATMIN2=0.0000178568;
if ncarrile==2 && SAT2<=SATMIN2
    flujoy1=0.471698113207547;
elseif ncarrile==2 && SAT2>SATMIN2 && SAT2<1
    flujoy1=-0.0908*(SAT2^3) +0.2279*(SAT2^2) -0.3436*(SAT2)+0.4701
elseif ncarrile==2 && SAT2>=1
    flujoy1=0.262054507337526;
end
%Tres carriles
TPDAMAX3=72001;
SAT3=(flujoex/TPDAMAX3);
SATMIN3=0.0000138887;
if ncarrile==3 && SAT3<=SATMIN3
    flujoy1=0.471698113207547;
elseif ncarrile==3 && SAT3>SATMIN3 && SAT3<1
    flujoy1=-1.6982*(SAT3^5) +4.2456*(SAT3^4) -4.0098*(SAT3^3) +1.9263*(SAT3^2) -0.6735*(SAT3) +0.4711
elseif ncarrile==3 && SAT3>=1
    flujoy1=0.262054507337526;
end
%Cuatro + carriles
TPDAMAX4=80001;
SAT4=(flujoex/TPDAMAX4);
SATMIN4=0.0000124998;
if ncarrile==4 && SAT4<=SATMIN4
    flujoy1=0.429769392033543;
elseif ncarrile==4 && SAT4>SATMIN4 && SAT4<1
    flujoy1=0.4095*(SAT4^4) -1.0252*(SAT4^3)+ 0.9482*(SAT4^2) -0.5026*(SAT4) +0.431
elseif ncarrile==4 && SAT4>=1
    flujoy1=0.262054507337526;
end
%Dos + uno carriles
TPDAMAX5=48001;
SAT5=(flujoex/TPDAMAX5);
SATMIN5=0.0000208329;
if ncarrile==5 && SAT5<=SATMIN5
    flujoy1=0.4979035639413;
elseif ncarrile==5 && SAT5>SATMIN5 && SAT5<1
    flujoy1=-0.0858*(SAT5^3)+0.1876*(SAT5^2) -0.3366*(SAT5) +0.5016
elseif ncarrile==5 && SAT5>=1
    flujoy1=0.262054507337526;
end
%Tres + dos carriles
TPDAMAX6=60001;
SAT6=(flujoex/TPDAMAX6);
SATMIN6=0.0000166664;
if ncarrile==6 && SAT6<=SATMIN6
    flujoy1=0.471698113207547;
elseif ncarrile==6 && SAT6>SATMIN6 && SAT6<1
    flujoy1=-0.2516*(SAT6^3) +0.4897*(SAT6^2) -0.4475*(SAT6)+0.4745
elseif ncarrile==6 && SAT6>=1
    flujoy1=0.262054507337526;
end
%2.CHOQUE FRONTAL (Pérdida de control)
%Un carril
if ncarrile==1 && SAT1<=SATMIN1
    flujoy2=0.050314465408805;
elseif ncarrile==1 && SAT1>SATMIN1 && SAT1<1
    flujoy2=(0.4817*SAT1) + 0.058
elseif ncarrile==1 && SAT1>=1
    flujoy2=0.534591194968553;
end
%Dos carriles
TPDAMAXP2=72001;
SATP2=(flujoex/TPDAMAXP2);
SATMINP2=0.0000138887;
if ncarrile==2 && SATP2<=SATMINP2
    flujoy2=0.110062893081761;
elseif ncarrile==2 && SATP2>SATMINP2 && SATP2<1
    flujoy2=-0.4419*(SATP2^2) + (0.8657*SATP2) + 0.1105
elseif ncarrile==2 && SATP2>=1
    flujoy2=0.534591194968553;
end
%Tres carriles
TPDAMAXP3=84001;
SATP3=(flujoex/TPDAMAXP3);
SATMINP3=0.0000119046;
if ncarrile==3 && SATP3<=SATMINP3
    flujoy2=0.154088050314465;
elseif ncarrile==3 && SATP3>SATMINP3 && SATP3<1
    flujoy2=-0.4027*(SATP3^2) + (0.7703*SATP3) + 0.1604
elseif ncarrile==3 && SATP3>=1
    flujoy2=0.534591194968553;
end
%Cuatro + carriles
TPDAMAX4=80001; 
SAT4=(flujoex/TPDAMAX4);
SATMIN4=0.0000124998;
if ncarrile==4 && SAT4<=SATMIN4
    flujoy2=0.188679245283019
elseif ncarrile==4 && SAT4>SATMIN4 && SAT4<1
    flujoy2=-0.3152*(SAT4^2) + (0.6555*SAT4)+ 0.1916
elseif ncarrile==4 && SAT4>=1
    flujoy2=0.534591194968553;
end
%Dos + uno carriles
TPDAMAXP5=54001;
SATP5=(flujoex/TPDAMAXP5);
SATMINP5=0.0000185182;
if ncarrile==5 && SATP5<=SATMINP5
    flujoy2=0.0707547169811321;
elseif ncarrile==5 && SATP5>SATMINP5 && SATP5<1
    flujoy2= -0.2026*(SATP5^2) + (0.6696*SATP5) + 0.069
elseif ncarrile==5 && SATP5>=1
    flujoy2=0.534591194968553;
end
%Tres + dos carriles
TPDAMAXP6=80001;
SATP6=(flujoex/TPDAMAXP6);
SATMINP6=0.0000124998;
if ncarrile==6 && SATP6<=SATMINP6
    flujoy2=0.125786163522013;
elseif ncarrile==6 && SATP6>SATMINP6 && SATP6<1
    flujoy2=-0.4193*(SATP6^2)+(0.813*SATP6)+0.1323
elseif ncarrile==6 && SATP6>=1
    flujoy2=0.531446540880503;
end

%3.CHOQUE FRONTAL (Adelantamiento)
%Un carril
TPDAMAX1=36001;
SAT1=(flujoex/TPDAMAX1);
SATMINA1=0.1;
if ncarrile==1 && SAT1<=SATMINA1
    flujoy3=0.0138903;
elseif ncarrile==1 && SAT1>SATMINA1 && SAT1<1
    flujoy3=-0.2212*(SAT1^3)+0.5207*(SAT1^2)-0.119*(SAT1)+0.0212
elseif ncarrile==1 && SAT1>=1
    flujoy3=0.2;
end
%Dos carriles
TPDAMAXP2=72001;
SATP2=(flujoex/TPDAMAXP2);
if ncarrile==2 && flujoex<56001
    flujoy3=0;
elseif ncarrile==2 && flujoex>=56001 && flujoex<72001
    flujoy3=0.00314465408805032;
elseif ncarrile==2 && flujoex>=72001 && flujoex<80000  
    flujoy3= (23.555*SATP2) + 0.8148;
elseif ncarrile==2 && flujoex>=80001
    flujoy3=0.00786163522012579
end
%Tres carriles
if ncarrile==3 
    flujoy3=0;
end
%Cuatro + carriles
if ncarrile==4 
    flujoy3=0;
end
%Dos + uno carriles
TPDAMAXP5=54001;
SATP5=(flujoex/TPDAMAXP5);
SATMINP5=0.0000185182;
if ncarrile==5 && SATP5<=SATMINP5
    flujoy3=0.00786163522012579;
elseif ncarrile==5 && SATP5>SATMINP5 && SATP5<1
    flujoy3=-0.4073*(SATP5^4) + 0.7641*(SATP5^3) - 0.3544*(SATP5^2) + 0.0993*(SATP5) + 0.008
elseif ncarrile==5 && SATP5>=1
    flujoy3=0.110062893081761;
end
%Tres + dos carriles
TPDAMAXA6=90001;
SATA6=(flujoex/TPDAMAXA6);
if ncarrile==6 && flujoex<50001
    flujoy3=0;
elseif ncarrile==6 && flujoex>=50001 && flujoex<90000
    flujoy3=(0.2859*SATA6) - 0.0613;
elseif ncarrile==6 && flujoex>=90001
    flujoy3=0.220125786163522;
end

%4.INTERSECCIONES
if volinte==7
    flujoy4=0;
elseif volinte==6
    flujoy4=0.0018;
elseif volinte==5
    flujoy4=0.0636;
elseif volinte==4
    flujoy4=0.1273;
elseif volinte==3
    flujoy4=0.2455;
elseif volinte==2
    flujoy4=0.5;
elseif volinte==1
    flujoy4=1;
end

%5.PUNTOS DE ACCESO
flujopre=0.01

%6.A LO LARGO
%Un carril
TPDAMAX1=36001;
SAT1=(flujoex/TPDAMAX1);
if ncarrile==1 && flujoex>=1 && flujoex<=36000
    flujoy7=(0.4859*SAT1) + 0.0453;
elseif ncarrile==1 && flujoex>=36001 
    flujoy7=0.5314465409;
end
%Dos carriles
TPDAMAXP2=72001;
SATP2=(flujoex/TPDAMAXP2);
if ncarrile==2 && flujoex>=1 && flujoex<=4000
    flujoy7=0.045599;
elseif ncarrile==2 && flujoex>=4001 && flujoex<=8000
    flujoy7=(0.9623*SATP2) - 0.0079;
elseif ncarrile==2 && flujoex>=8001 && flujoex<=12000  
    flujoy7=0.099056604;
elseif ncarrile==2 && flujoex>=12001 && flujoex<=16000
    flujoy7=(0.9906*SATP2) - 0.0661;
elseif ncarrile==2 && flujoex>=16001 && flujoex<=20000  
    flujoy7=0.15408805;
elseif ncarrile==2 && flujoex>=20001 && flujoex<=24000
    flujoy7=(0.9623*SATP2)-0.1132;
elseif ncarrile==2 && flujoex>=24001 && flujoex<=28000  
    flujoy7=0.20754717;
elseif ncarrile==2 && flujoex>=28001 && flujoex<=32000
    flujoy7=(0.9623*SATP2) - 0.1667
elseif ncarrile==2 && flujoex>=32001 && flujoex<=36000  
    flujoy7=0.261006289;
elseif ncarrile==2 && flujoex>=36001 && flujoex<=40000
    flujoy7=(0.9057*SATP2) - 0.1918
elseif ncarrile==2 && flujoex>=40001 && flujoex<=44000  
    flujoy7=0.311320755;
elseif ncarrile==2 && flujoex>=44001 && flujoex<=48000
    flujoy7=(1.0472*SATP2) - 0.3286
elseif ncarrile==2 && flujoex>=48001 && flujoex<=52000  
    flujoy7=0.369496855;
elseif ncarrile==2 && flujoex>=52001 && flujoex<=56000
    flujoy7=(0.934*SATP2) - 0.305
elseif ncarrile==2 && flujoex>=56001 && flujoex<=60000  
    flujoy7=0.421383648;
elseif ncarrile==2 && flujoex>=60001 && flujoex<=64000
    flujoy7=(0.9057*SATP2) - 0.3333
elseif ncarrile==2 && flujoex>=64001 && flujoex<=68000  
    flujoy7=0.471698113;
elseif ncarrile==2 && flujoex>=68001 && flujoex<=72000
    flujoy7=(1.1038*SATP2) - 0.5708
elseif ncarrile==2 && flujoex>=72001  
    flujoy7=0.533018868;
end
%Tres carriles
TPDAMAXL3=108001;
SATL3=(flujoex/TPDAMAXL3);
if ncarrile==3 && flujoex>=1 && flujoex<=8000
    flujoy7=0.045597484;
elseif ncarrile==3 && flujoex>=8001 && flujoex<=12000
    flujoy7 = (1.4434*SATL3) - 0.0613;
elseif ncarrile==3 && flujoex>=12001 && flujoex<=20000  
    flujoy7=0.099056604;
elseif ncarrile==3 && flujoex>=20001 && flujoex<=24000
    flujoy7= (1.4859*SATL3) - 0.1761
elseif ncarrile==3 && flujoex>=24001 && flujoex<=32000  
    flujoy7=0.15408805;
elseif ncarrile==3 && flujoex>=32001 && flujoex<=36000
    flujoy7= (1.4434*SATL3)  - 0.2736
elseif ncarrile==3 && flujoex>=36001 && flujoex<=44000  
    flujoy7=0.20754717;
elseif ncarrile==3 && flujoex>=44001 && flujoex<=48000
    flujoy7= (1.401*SATL3) - 0.3632
elseif ncarrile==3 && flujoex>=48001 && flujoex<=56000  
    flujoy7=0.259433962;
elseif ncarrile==3 && flujoex>=56001 && flujoex<=60000
    flujoy7 = (1.4859*SATL3) - 0.511
elseif ncarrile==3 && flujoex>=60001 && flujoex<=68000  
    flujoy7=0.314465409;
elseif ncarrile==3 && flujoex>=68001 && flujoex<=72000
    flujoy7= (1.4434*SATL3) - 0.5944
elseif ncarrile==3 && flujoex>=72001 && flujoex<=80000  
    flujoy7=0.367924528;
elseif ncarrile==3 && flujoex>=80001 && flujoex<=84000
    flujoy7 = (1.4434*SATL3) - 0.7013
elseif ncarrile==3 && flujoex>=84001 && flujoex<=92000  
    flujoy7=0.421383648;
elseif ncarrile==3 && flujoex>=92001 && flujoex<=96000
    flujoy7= (1.401*SATL3) - 0.772
elseif ncarrile==3 && flujoex>=96001 && flujoex<=104000  
    flujoy7=0.47327044;
elseif ncarrile==3 && flujoex>=104001 && flujoex<=108000
    flujoy7= (1.5708*SATL3) - 1.0393
elseif ncarrile==3 && flujoex>=108001  
    flujoy7=0.531446541;
end
%Cuatro + carriles
TPDAMAXL4=144001;
SATL4=(flujoex/TPDAMAXL4);
if ncarrile==4 && flujoex>=1 && flujoex<=12000
    flujoy7=0.045597484;
elseif ncarrile==4 && flujoex>=12001 && flujoex<=16000
    flujoy7 = (1.9245*SATL4) - 0.1148
elseif ncarrile==4 && flujoex>=16001 && flujoex<=28000  
    flujoy7=0.099056604;
elseif ncarrile==4 && flujoex>=28001 && flujoex<=32000
    flujoy7= (1.9811*SATL4) - 0.2862
elseif ncarrile==4 && flujoex>=32001 && flujoex<=44000  
    flujoy7=0.15408805;
elseif ncarrile==4 && flujoex>=44001 && flujoex<=48000
    flujoy7 = (1.9245*SATL4) - 0.434
elseif ncarrile==4 && flujoex>=48001 && flujoex<=60000  
    flujoy7=0.20754717;
elseif ncarrile==4 && flujoex>=60001 && flujoex<=64000
    flujoy7= (1.9245*SATL4) - 0.5944
elseif ncarrile==4 && flujoex>=64001 && flujoex<=76000  
    flujoy7=0.261006289;
elseif ncarrile==4 && flujoex>=76001 && flujoex<=80000
    flujoy7= (1.9245*SATL4) - 0.7547
elseif ncarrile==4 && flujoex>=80001 && flujoex<=92000  
    flujoy7=0.314465409;
elseif ncarrile==4 && flujoex>=92001 && flujoex<=96000
    flujoy7= (1.9245*SATL4) - 0.9151
elseif ncarrile==4 && flujoex>=96001 && flujoex<=108000  
    flujoy7=0.367924528;
elseif ncarrile==4 && flujoex>=108001 && flujoex<=112000
    flujoy7= (2.0377*SATL4) - 1.1604
elseif ncarrile==4 && flujoex>=112001 && flujoex<=124000  
    flujoy7=0.424528302;
elseif ncarrile==4 && flujoex>=124001 && flujoex<=128000
    flujoy7 = (1.9245*SATL4) - 1.2327
elseif ncarrile==4 && flujoex>=128001 && flujoex<=140000  
    flujoy7=0.477987421;
elseif ncarrile==4 && flujoex>=140001 && flujoex<=144000
    flujoy7 = (1.9245*SATL4) - 1.3931
elseif ncarrile==4 && flujoex>=144001  
    flujoy7=0.531446541;
end
%Dos + uno carriles
TPDAMAXL5=56001;
SATL5=(flujoex/TPDAMAXL5);
if ncarrile==5 && flujoex>=1 && flujoex<=4000
    flujoy7=0.045597484;
elseif ncarrile==5 && flujoex>=4001 && flujoex<=12000
    flujoy7 = (0.7594*SATL5) - 0.0105
elseif ncarrile==5 && flujoex>=12001 && flujoex<=16000  
    flujoy7=0.15408805;
elseif ncarrile==5 && flujoex>=16001 && flujoex<=24000
    flujoy7= (0.7484*SATL5) - 0.0603
elseif ncarrile==5 && flujoex>=24001 && flujoex<=28000  
    flujoy7=0.261006289;
elseif ncarrile==5 && flujoex>=28001 && flujoex<=36000
    flujoy7= (0.7705*SATL5) - 0.1248
elseif ncarrile==5 && flujoex>=36001 && flujoex<=40000  
    flujoy7=0.371069182;
elseif ncarrile==5 && flujoex>=40001 && flujoex<=48000
    flujoy7= (0.7264*SATL5) - 0.1468
elseif ncarrile==5 && flujoex>=48001 && flujoex<=52000  
    flujoy7=0.474842767;
elseif ncarrile==5 && flujoex>=52001 && flujoex<=56000
    flujoy7= (0.7925*SATL5) - 0.261
elseif ncarrile==5 && flujoex>=56001   
    flujoy7=0.531446541;
end
%Tres + dos carriles
TPDAMAXL6=92001;
SATL6=(flujoex/TPDAMAXL6);
if ncarrile==6 && flujoex>=1 && flujoex<=8000
    flujoy7=0.045597484;
elseif ncarrile==6 && flujoex>=8001 && flujoex<=12000
    flujoy7 = (1.2296*SATL6) - 0.0613
elseif ncarrile==6 && flujoex>=12001 && flujoex<=16000  
    flujoy7=0.099056604;
elseif ncarrile==6 && flujoex>=16001 && flujoex<=20000
    flujoy7= (1.2657*SATL6) - 0.1211
elseif ncarrile==6 && flujoex>=20001 && flujoex<=28000  
    flujoy7=0.15408805;
elseif ncarrile==6 && flujoex>=28001 && flujoex<=32000
    flujoy7= (1.2296*SATL6) - 0.2201
elseif ncarrile==6 && flujoex>=32001 && flujoex<=36000  
    flujoy7=0.20754717;
elseif ncarrile==6 && flujoex>=36001 && flujoex<=40000
    flujoy7 = (1.1934*SATL6) - 0.2594
elseif ncarrile==6 && flujoex>=40001 && flujoex<=48000  
    flujoy7=0.259433962;
elseif ncarrile==6 && flujoex>=48001 && flujoex<=52000
    flujoy7= (1.2657*SATL6) - 0.401
elseif ncarrile==6 && flujoex>=52001 && flujoex<=56000
    flujoy7=0.314465409;
elseif ncarrile==6 && flujoex>=56001 && flujoex<=60000
    flujoy7= (1.2657*SATL6) - 0.456
elseif ncarrile==6 && flujoex>=60001 && flujoex<=68000
    flujoy7=0.369496855;
elseif ncarrile==6 && flujoex>=68001 && flujoex<=72000
    flujoy7= (1.2657*SATL6) - 0.5661
elseif ncarrile==6 && flujoex>=72001 && flujoex<=76000
    flujoy7=0.424528302;
elseif ncarrile==6 && flujoex>=76001 && flujoex<=80000
    flujoy7= (1.1572*SATL6) - 0.5315
elseif ncarrile==6 && flujoex>=80001 && flujoex<=88000
    flujoy7=0.474842767;
elseif ncarrile==6 && flujoex>=88001 && flujoex<=92000
    flujoy7= (1.3019*SATL6) - 0.7705
elseif ncarrile==6 && flujoex>=92001 
    flujoy7=0.531446541;
end
%CICLISTAS
%1.A lo largo y Salida de camino
%Uno
TPDAMAXC1=36001;
SATC1=(flujoex/TPDAMAXC1);
if ncarrile==1 && SATC1<=0.1
    flujoy5=0.0155845;
elseif ncarrile==1 && SATC1>=1
    flujoy5=0.1;
elseif ncarrile==1 && SATC1>0.1 && SATC1<1
    flujoy5=0.0475*(SATC1^3)-0.1193*(SATC1^2)+(0.1723*SATC1)-0.0005
end
%Dos
TPDAMAXC2=72001;
SATC2=(flujoex/TPDAMAXC2);
if ncarrile==2 && SATC2<=0.1
    flujoy5=0.0155845;
elseif ncarrile==2 && SATC2>=1
    flujoy5=0.1;
elseif ncarrile==2 && SATC2>0.1 && SATC2<1
    flujoy5=0.0475*(SATC2^3)-0.1193*(SATC2^2)+(0.1723*SATC2)-0.0005
end
%Tres
TPDAMAXC3=108001;
SATC3=(flujoex/TPDAMAXC3);
if ncarrile==3 && SATC3<=0.1
    flujoy5=0.0155845;
elseif ncarrile==3 && SATC3>=1
    flujoy5=0.1;
elseif ncarrile==3 && SATC3>0.1 && SATC3<1
    flujoy5=0.0475*(SATC3^3)-0.1193*(SATC3^2)+(0.1723*SATC3)-0.0005
end
%Cuatro
TPDAMAXC4=144001;
SATC4=(flujoex/TPDAMAXC4);
if ncarrile==4 && SATC4<=0.1
    flujoy5=0.0155845;
elseif ncarrile==4 && SATC4>=1
    flujoy5=0.1;
elseif ncarrile==4 && SATC4>0.1 && SATC4<1
    flujoy5=0.0475*(SATC4^3)-0.1193*(SATC4^2)+(0.1723*SATC4)-0.0005
end
%Dos + uno
TPDAMAXC5=54001;
SATC5=(flujoex/TPDAMAXC5);
if ncarrile==5 && SATC5<=0.1
    flujoy5=0.0155845;
elseif ncarrile==5 && SATC5>=1
    flujoy5=0.1;
elseif ncarrile==5 && SATC5>0.1 && SATC5<1
    flujoy5=0.0475*(SATC5^3)-0.1193*(SATC5^2)+(0.1723*SATC5)-0.0005
end
%Tres + dos
TPDAMAXC6=90001;
SATC6=(flujoex/TPDAMAXC6);
if ncarrile==6 && SATC6<=0.1
    flujoy5=0.0155845;
elseif ncarrile==6 && SATC6>=1
    flujoy5=0.1;
elseif ncarrile==6 && SATC6>0.1 && SATC6<1
    flujoy5=0.0475*(SATC6^3)-0.1193*(SATC6^2)+(0.1723*SATC6)-0.0005
end
%2.INTERSECCIONES
if volinte==7 
    flujoy6=0;
elseif volinte==6 
    flujoy6=0.00073469387755102;
elseif volinte==5 
    flujoy6=0.00109387755102041;
elseif volinte==4
    flujoy6=0.00463673469387755;
elseif volinte==3 
    flujoy6=0.0081469387755102;
elseif volinte==2 
    flujoy6=0.0114285714285714;
elseif volinte==1
    flujoy6=0.0114285714285714;
end
%PEATONES
%1.A LO LARGO (CONDUCTOR Y COPILOTO) Y .CRUCE PEATONAL
%Uno
TPDAMAXP1=36001;
SATP1=(flujoex/TPDAMAXP1);
if ncarrile==1 && SATP1<=0.1
    flujoy8=0.0155845;
elseif ncarrile==1 && SATP1>0.1 && SATP1<1
    flujoy8=0.0475*(SATP1^3)-0.1193*(SATP1^2)+(0.1723*SATP1)-0.0005
elseif ncarrile==1 && SATP1>=1
    flujoy8=0.1;
end
%Dos
TPDAMAXP2=72001;
SATP2=(flujoex/TPDAMAXP2);
if ncarrile==2 && SATP2<=0.1
    flujoy8=0.0155845;
elseif ncarrile==2 && SATP2>=1
    flujoy8=0.1;
elseif ncarrile==2 && SATP2>0.1 && SATP2<1
    flujoy8=0.0475*(SATP2^3)-0.1193*(SATP2^2)+(0.1723*SATP2)-0.0005
end
%Tres
TPDAMAXP3=96001;
SATP3=(flujoex/TPDAMAXP3);
if ncarrile==3 && SATP3<=0.1
    flujoy8=0.0155845;
elseif ncarrile==3 && SATP3>=1
    flujoy8=0.1;
elseif ncarrile==3 && SATP3>0.1 && SATP3<1
    flujoy8=0.0475*(SATP3^3)-0.1193*(SATP3^2)+(0.1723*SATP3)-0.0005
end
%Cuatro
TPDAMAXP4=64001;
SATP4=(flujoex/TPDAMAXP4);
if ncarrile==4 && SATP4<=0.0000156248
    flujoy8=0.0161282828282828;
elseif ncarrile==4 && SATP4>=1
    flujoy8=0.0639361111111111;
elseif ncarrile==4 && SATP4>0.0000156248 && SATP4<1
    flujoy8=-0.0663*(SATP4^3) + 0.0747*(SATP4^2) + 0.0394*(SATP4) + 0.0165
end
%Dos + uno
TPDAMAXP5=54001;
SATP5=(flujoex/TPDAMAXP5);
if ncarrile==5 && SATP5<=0.1
    flujoy8=0.0155845;
elseif ncarrile==5 && SATP5>=1
    flujoy8=0.1;
elseif ncarrile==5 && SATP5>0.1 && SATP5<1
    flujoy8=0.0475*(SATP5^3)-0.1193*(SATP5^2)+(0.1723*SATP5)-0.0005
end
%Tres + dos
TPDAMAXP6=90001;
SATP6=(flujoex/TPDAMAXP6);
if ncarrile==6 && SATP6<=0.0000142855
    flujoy8=0.0152613636363636;
elseif ncarrile==6 && SATP6>=1
    flujoy8=0.0829217171717172;
elseif ncarrile==6 && SATP6>0.0000142855 && SATP6<1
    flujoy8= -0.0118*(SATP6^3)-0.0286*(SATP6^2)+0.1083*(SATP6)+0.0158
end
%2. CRUCE LATERAL
if volinte==7 
    flujoy9=0;
elseif volinte==6 
    flujoy9=0.00342854470632248;
elseif volinte==5 
    flujoy9=0.00663524130190797;
elseif volinte==4
    flujoy9=0.0296461840628507;
elseif volinte==3 
    flujoy9=0.0533982416760195;
elseif volinte==2 
    flujoy9=0.0759410774410774;
elseif volinte==1
    flujoy9=0.0709373363262252;
end
%Transitabilidad media
disp('1 = Transitable')
disp('2 = No saturada')
transitabilidad=x(53);
if transitabilidad==1
   transitabilida=1;
elseif transitabilidad==2
   transitabilida=0;
end
%CONDICION PARA LAS VELOCIDADES DE OPERACION
veloperacio=x(52);
limitevelo=x(49);
veloperaciom=max(limitevelo,veloperacio);
if veloperaciom==150
    veloperacion=1;
elseif veloperaciom==145
    veloperacion=0.91;
elseif veloperaciom==140
         veloperacion=0.81;
elseif veloperaciom==135
         veloperacion=0.73;
elseif veloperaciom==130
         veloperacion=0.66;
elseif veloperaciom==125
         veloperacion=0.58;
elseif veloperaciom==120
        veloperacion=0.51;
elseif veloperaciom==115
         veloperacion=0.44;
elseif veloperaciom==110
         veloperacion=0.39;
elseif veloperaciom==105
         veloperacion=0.34;
elseif veloperaciom==100
         veloperacion=0.29;
elseif veloperaciom==95
         veloperacion=0.25;  
elseif veloperaciom==90
         veloperacion=0.21;
elseif veloperaciom==85
         veloperacion=0.18;
elseif veloperaciom==80
         veloperacion=0.15;
elseif veloperaciom==75
         veloperacion=0.12;
elseif veloperaciom==70
         veloperacion=0.1;
elseif veloperaciom==65
         veloperacion=0.08;
elseif veloperaciom==60
         veloperacion=0.06;
elseif veloperaciom==55
         veloperacion=0.05;
elseif veloperaciom==50
         veloperacion=0.04;
elseif veloperaciom==45
         veloperacion=0.03;
elseif veloperaciom==40
         veloperacion=0.02;
elseif veloperaciom==35
         veloperacion=0.01;
elseif veloperaciom==30
         veloperacion=0;
end
if curvatur==1
     curvatura2=curvatura(1,1);
elseif curvatur==2
        curvatura2=curvatura(1,1);
elseif curvatur==3
        curvatura2=curvatura(1,1);
elseif curvatur==4
      curvatura2=curvatura(1,1);
end
if calidadcurv==1
    calidadcurva2=calidadcurva(1,1);
elseif calidadcurv==2
    calidadcurva2=calidadcurva(1,1);
elseif calidadcurv==3
    calidadcurva2=calidadcurva(1,1);
end
if estadosuperfici==1
    estadosuperficie2=estadosuperficie(1,1);
elseif estadosuperfici==2
    estadosuperficie2=estadosuperficie(1,1);
elseif estadosuperfici==3
    estadosuperficie2=estadosuperficie(1,1);
end
if resdeslizamient==1
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==2
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==3
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==4
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==5
   resdeslizamiento2=resdeslizamiento(1,1);
end
if distconducto==1
  distconductor2=distconductor(1,1);
elseif distconducto==2
  distconductor2=distconductor(1,1);
elseif distconducto==3
  distconductor2=distconductor(1,1);
elseif distconducto==4
  distconductor2=distconductor(1,1);
end
if objconducto==1
 objconductor2=objconductor(1,1);
elseif objconducto==2
 objconductor2=objconductor(1,1);
elseif objconducto==3
 objconductor2=objconductor(1,1);
elseif objconducto==4
 objconductor2=objconductor(1,1);
elseif objconducto==5
 objconductor2=objconductor(1,1);
elseif objconducto==6
 objconductor2=objconductor(1,1);
elseif objconducto==7
 objconductor2=objconductor(1,1);
elseif objconducto==8
 objconductor2=objconductor(1,1);
elseif objconducto==9
 objconductor2=objconductor(1,1);
elseif objconducto==10
 objconductor2=objconductor(1,1);
elseif objconducto==11
 objconductor2=objconductor(1,1);
elseif objconducto==12
 objconductor2=objconductor(1,1);
elseif objconducto==13
 objconductor2=objconductor(1,1);
elseif objconducto==14
 objconductor2=objconductor(1,1);
elseif objconducto==15
 objconductor2=objconductor(1,1);
elseif objconducto==16
 objconductor2=objconductor(1,1);
elseif objconducto==17
 objconductor2=objconductor(1,1);
end
if anchoespaldo==1
  anchoespaldon2=anchoespaldon(1,1);
elseif anchoespaldo==2
  anchoespaldon2=anchoespaldon(1,1);
elseif anchoespaldo==3
  anchoespaldon2=anchoespaldon(1,1);
elseif anchoespaldo==4
  anchoespaldon2=anchoespaldon(1,1);
end
%Probabilidad
x1=anchocarril*curvatura2*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2;
%Severidad
x2=distconductor2*objconductor2*anchoespaldon2;
%Clasificación por Estrellas para la salida del camino (lado del conductor)
objcopilot=x(4);
if objcopilot==1
    for i=1:3
 objcopiloto(1,i)=T10(1,i);
    end
end
if objcopilot==2
    for i=1:3
 objcopiloto(1,i)=T10(2,i);
    end
end
if objcopilot==3
    for i=1:3
 objcopiloto(1,i)=T10(3,i);
    end
end
if objcopilot==4
    for i=1:3
 objcopiloto(1,i)=T10(4,i);
    end
end
if objcopilot==5
    for i=1:3
 objcopiloto(1,i)=T10(5,i);
    end
end
if objcopilot==6
    for i=1:3
 objcopiloto(1,i)=T10(6,i);
    end
end
if objcopilot==7
    for i=1:3
 objcopiloto(1,i)=T10(7,i);
    end
end
if objcopilot==8
    for i=1:3
 objcopiloto(1,i)=T10(8,i);
    end
end
if objcopilot==9
    for i=1:3
 objcopiloto(1,i)=T10(9,i);
    end
end
if objcopilot==10
    for i=1:3
 objcopiloto(1,i)=T10(10,i);
    end
end
if objcopilot==11
    for i=1:3
 objcopiloto(1,i)=T10(11,i);
    end
end
if objcopilot==12
    for i=1:3
 objcopiloto(1,i)=T10(12,i);
    end
end
if objcopilot==13
    for i=1:3
 objcopiloto(1,i)=T10(13,i);
    end
end
if objcopilot==14
    for i=1:3
 objcopiloto(1,i)=T10(14,i);
    end
end
if objcopilot==15
    for i=1:3
 objcopiloto(1,i)=T10(15,i);
    end
end
if objcopilot==16
    for i=1:3
 objcopiloto(1,i)=T10(16,i);
    end
end
if objcopilot==17
    for i=1:3
 objcopiloto(1,i)=T10(17,i);
    end
end
velosalida=veloperacion;
if veloperaciom==150 && objconducto>=1 && objcopilot==10
    velosalida=1;
elseif veloperaciom==145 && objconducto>=1 && objcopilot==10
    velosalida=0.97;
elseif veloperaciom==140 && objconducto>=1 && objcopilot==10
         velosalida=0.93; 
elseif veloperaciom==135 && objconducto>=1 && objcopilot==10
         velosalida=0.90;
elseif veloperaciom==130 && objconducto>=1 && objcopilot==10
         velosalida=0.87;
elseif veloperaciom==125 && objconducto>=1 && objcopilot==10
         velosalida=0.83;
elseif veloperaciom==120 && objconducto>=1 && objcopilot==10
        velosalida=0.80;
elseif veloperaciom==115 && objconducto>=1 && objcopilot==10
         velosalida=0.77;
elseif veloperaciom==110 && objconducto>=1 && objcopilot==10
         velosalida=0.73;
elseif veloperaciom==105 && objconducto>=1 && objcopilot==10
         velosalida=0.70;
elseif veloperaciom==100 && objconducto>=1 && objcopilot==10
         velosalida=0.67;
elseif veloperaciom==95 && objconducto>=1 && objcopilot==10
         velosalida=0.63;  
elseif veloperaciom==90 && objconducto>=1 && objcopilot==10
         velosalida=0.60;
elseif veloperaciom==85 && objconducto>=1 && objcopilot==10
         velosalida=0.57;
elseif veloperaciom==80 && objconducto>=1 && objcopilot==10
         velosalida=0.53;
elseif veloperaciom==75 && objconducto>=1 && objcopilot==10
         velosalida=0.50;
elseif veloperaciom==70 && objconducto>=1 && objcopilot==10
         velosalida=0.47;
elseif veloperaciom==65 && objconducto>=1 && objcopilot==10
         velosalida=0.43;
elseif veloperaciom==60 && objconducto>=1 && objcopilot==10
         velosalida=0.40;
elseif veloperaciom==55 && objconducto>=1 && objcopilot==10
         velosalida=0.36;
elseif veloperaciom==50 && objconducto>=1 && objcopilot==10
         velosalida=0.33;
elseif veloperaciom==45 && objconducto>=1 && objcopilot==10
         velosalida=0.30;
elseif veloperaciom==40 && objconducto>=1 && objcopilot==10
         velosalida=0.27;
elseif veloperaciom==35 && objconducto>=1 && objcopilot==10
         velosalida=0.23;
elseif veloperaciom==30 && objconducto>=1 && objcopilot==10
         velosalida=0.2;
elseif veloperaciom==150 && objcopilot>=1 && objconducto==10
    velosalida=1;
elseif veloperaciom==145 && objcopilot>=1 && objconducto==10
    velosalida=0.97;
elseif veloperaciom==140 && objcopilot>=1 && objconducto==10
         velosalida=0.93; 
elseif veloperaciom==135 && objcopilot>=1 && objconducto==10
         velosalida=0.90;
elseif veloperaciom==130 && objcopilot>=1 && objconducto==10
         velosalida=0.87;
elseif veloperaciom==125 && objcopilot>=1 && objconducto==10
         velosalida=0.83;
elseif veloperaciom==120 && objcopilot>=1 && objconducto==10
        velosalida=0.80;
elseif veloperaciom==115 && objcopilot>=1 && objconducto==10
         velosalida=0.77;
elseif veloperaciom==110 && objcopilot>=1 && objconducto==10
         velosalida=0.73;
elseif veloperaciom==105 && objcopilot>=1 && objconducto==10
         velosalida=0.70;
elseif veloperaciom==100 && objcopilot>=1 && objconducto==10
         velosalida=0.67;
elseif veloperaciom==95 && objcopilot>=1 && objconducto==10
         velosalida=0.63;  
elseif veloperaciom==90 && objcopilot>=1 && objconducto==10
         velosalida=0.60;
elseif veloperaciom==85 && objcopilot>=1 && objconducto==10
         velosalida=0.57;
elseif veloperaciom==80 && objcopilot>=1 && objconducto==10
         velosalida=0.53;
elseif veloperaciom==75 && objcopilot>=1 && objconducto==10
         velosalida=0.50;
elseif veloperaciom==70 && objcopilot>=1 && objconducto==10
         velosalida=0.47;
elseif veloperaciom==65 && objcopilot>=1 && objconducto==10
         velosalida=0.43;
elseif veloperaciom==60 && objcopilot>=1 && objconducto==10
         velosalida=0.40;
elseif veloperaciom==55 && objcopilot>=1 && objconducto==10
         velosalida=0.36;
elseif veloperaciom==50 && objcopilot>=1 && objconducto==10
         velosalida=0.33;
elseif veloperaciom==45 && objcopilot>=1 && objconducto==10
         velosalida=0.30;
elseif veloperaciom==40 && objcopilot>=1 && objconducto==10
         velosalida=0.27;
elseif veloperaciom==35 && objcopilot>=1 && objconducto==10
         velosalida=0.23;
elseif veloperaciom==30 && objcopilot>=1 && objconducto==10
         velosalida=0.2;       
end
A=anchocarril*curvatura2*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*distconductor2*objconductor2*anchoespaldon2*flujoy1*velosalida*transitabilida;
%%Salida del camino (lado del copiloto)%
%Severidad en la carretera: distancia del lado del copiloto
distcopilot=x(3);
if distcopilot==1
    for i=1:3
  distcopiloto(1,i)=T9(1,i);
    end
end
if distcopilot==2
        for i=1:3
  distcopiloto(1,i)=T9(2,i);
    end
end
if distcopilot==3
        for i=1:3
  distcopiloto(1,i)=T9(3,i);
    end
end
if distcopilot==4
        for i=1:3
  distcopiloto(1,i)=T9(4,i);
    end
end
%Severidad en la carretera: objeto del lado del conductor
objcopilot=x(4);
if objcopilot==1
    for i=1:3
 objcopiloto(1,i)=T10(1,i);
    end
end
if objcopilot==2
    for i=1:3
 objcopiloto(1,i)=T10(2,i);
    end
end
if objcopilot==3
    for i=1:3
 objcopiloto(1,i)=T10(3,i);
    end
end
if objcopilot==4
    for i=1:3
 objcopiloto(1,i)=T10(4,i);
    end
end
if objcopilot==5
    for i=1:3
 objcopiloto(1,i)=T10(5,i);
    end
end
if objcopilot==6
    for i=1:3
 objcopiloto(1,i)=T10(6,i);
    end
end
if objcopilot==7
    for i=1:3
 objcopiloto(1,i)=T10(7,i);
    end
end
if objcopilot==8
    for i=1:3
 objcopiloto(1,i)=T10(8,i);
    end
end
if objcopilot==9
    for i=1:3
 objcopiloto(1,i)=T10(9,i);
    end
end
if objcopilot==10
    for i=1:3
 objcopiloto(1,i)=T10(10,i);
    end
end
if objcopilot==11
    for i=1:3
 objcopiloto(1,i)=T10(11,i);
    end
end
if objcopilot==12
    for i=1:3
 objcopiloto(1,i)=T10(12,i);
    end
end
if objcopilot==13
    for i=1:3
 objcopiloto(1,i)=T10(13,i);
    end
end
if objcopilot==14
    for i=1:3
 objcopiloto(1,i)=T10(14,i);
    end
end
if objcopilot==15
    for i=1:3
 objcopiloto(1,i)=T10(15,i);
    end
end
if objcopilot==16
    for i=1:3
 objcopiloto(1,i)=T10(16,i);
    end
end
if objcopilot==17
    for i=1:3
 objcopiloto(1,i)=T10(17,i);
    end
end
%Ancho espaldones
anchoespaldonco=x(7);
if anchoespaldonco==1
    for i=1:5
  anchoespaldoncop(1,i)=T11(1,i);
    end
end
if anchoespaldonco==2
    for i=1:5
  anchoespaldoncop(1,i)=T11(2,i);
    end
end
if anchoespaldonco==3
    for i=1:5
  anchoespaldoncop(1,i)=T11(3,i);
    end
end
if anchoespaldonco==4
    for i=1:5
  anchoespaldoncop(1,i)=T11(4,i);
    end
end
if distcopilot==1
  distcopiloto2=distcopiloto(1,1);
elseif distcopilot==2
  distcopiloto2=distcopiloto(1,1);
elseif distcopilot==3
  distcopiloto2=distcopiloto(1,1);
elseif  distcopilot==4
  distcopiloto2=distcopiloto(1,1);
end
if objcopilot==1
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==2
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==3
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==4
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==5
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==6
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==7
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==8
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==9
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==10
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==11
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==12
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==13
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==14
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==15
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==16
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==17
 objcopiloto2=objcopiloto(1,1);
end
if anchoespaldonco==1
  anchoespaldoncop2=anchoespaldoncop(1,1);
elseif anchoespaldonco==2
  anchoespaldoncop2=anchoespaldoncop(1,1);
elseif anchoespaldonco==3
  anchoespaldoncop2=anchoespaldoncop(1,1);
elseif anchoespaldonco==4
  anchoespaldoncop2=anchoespaldoncop(1,1);
end
%Probabilidad igual a Probabibilidad del lado del conductor
%Severidad
x3=distcopiloto2*objcopiloto2*anchoespaldoncop2;
%Clasificacion por estrellas para salida del camino (lado copiloto)
B=anchocarril*curvatura2*calidadcurva2*delineacion*bandasonoraes*estadosuperficie2*pendiente*resdeslizamiento2*distcopiloto2*objcopiloto2*anchoespaldoncop2*flujoy1*velosalida;
%%Choque frontal (pérdida de control)%
%Bandas sonoras centrales
disp('1= Ausente')
disp('2 = Presente')
bandassonora=x(11);
if bandassonora==1
    bandassonoras=1.20;
else bandassonora==2
     bandassonoras=1;
end
%Tipo de mediana
T13=[0 0 1 0.7;0 0 1 0.7;2 0 1 0.7;10 0 1 0.7;35 0 1 0.7;80 0 1 0.7;90 0 1.6 0.7;77 25 3 1;90 0 2.7 1;83 82.5 2.4 1;100 100 3 1;0 0 1 0.7;0 0 1 0.7;95 100 2.7 1;0 0 1 0.7];
disp('1 = Barrera de seguridad – metal')
disp('2 = Barrera de seguridad – hormigón')
disp('3 = Mediana física con un ancho ≥ 20 m')
disp('4 = Mediana física con un ancho ≥ 10m a < 20 m')
disp('5 = Mediana física con un ancho ≥ 5 m a < 10 m')
disp('6 = Mediana física con un ancho ≥ 1 m a < 5 m')
disp('7 = Mediana física con un ancho ≥ 0 m a < 1 m')
disp('8 = Carril central continuo para giro')
disp('9 = Delineadores flexibles')
disp('10 = Raya separadora de sentidos de circulación doble > 1 m y rayas diagonales a 45°')
disp('11 = Línea central')
disp('12 = Barrera de seguridad - amigable para motociclistas')
disp('13 = Un solo sentido')
disp('14 = Raya separadora de sentidos de circulación doble (0.3m a 1m) y rayas diagonales a 45°')
disp('15 = Barrera de seguridad - cable de acero')
tipomedian=x(10);
if tipomedian==1
    for i=1:4
 tipomediana(1,i)=T13(1,i);
    end
end
if tipomedian==2
    for i=1:4
 tipomediana(1,i)=T13(2,i);
    end
end
if tipomedian==3
    for i=1:4
 tipomediana(1,i)=T13(3,i);
    end
end
if tipomedian==4
    for i=1:4
 tipomediana(1,i)=T13(4,i);
    end
end
if tipomedian==5
    for i=1:4
 tipomediana(1,i)=T13(5,i);
    end
end
if tipomedian==6
    for i=1:4
 tipomediana(1,i)=T13(6,i);
    end
end
if tipomedian==7
    for i=1:4
 tipomediana(1,i)=T13(7,i);
    end
end
if tipomedian==8
    for i=1:4
 tipomediana(1,i)=T13(8,i);
    end
end
if tipomedian==9
    for i=1:4
 tipomediana(1,i)=T13(9,i);
    end
end
if tipomedian==10
    for i=1:4
 tipomediana(1,i)=T13(10,i);
    end
end
if tipomedian==11
    for i=1:4
 tipomediana(1,i)=T13(11,i);
    end
end
if tipomedian==12
    for i=1:4
 tipomediana(1,i)=T13(12,i);
    end
end
if tipomedian==13
    for i=1:4
 tipomediana(1,i)=T13(13,i);
    end
end
if tipomedian==14
    for i=1:4
 tipomediana(1,i)=T13(14,i);
    end
end
if tipomedian==15
    for i=1:4
 tipomediana(1,i)=T13(15,i);
    end
end
%Influencia del flujo externo
%if flujoex<8001
%    flujoext1=0.1622;
%elseif flujoex>=8001&flujoex<16001
%        flujoext1=0.3244259331;
%elseif flujoex>=16001&flujoex<24001
%       flujoext1=0.434158234;
%elseif flujoex>=24001&flujoex<32001
%        flujoext1=0.5422206955;
%elseif flujoex>=32001&flujoex<40001
%        flujoext1=0.651237351;
%elseif flujoex>=40001&flujoex<48001
%        flujoext1=0.7585841671;
%elseif flujoex>=48001&flujoex<56001
%        flujoext1=0.8134503175;       
%else flujoex>=56001
%        flujoext1=0.868316468; 
%end
%Velocidad de operacion (aqui toma el -10km/h)
if veloperaciom==150
        veloperacion1=1;
elseif veloperaciom==145
         veloperacion1=0.91;
elseif veloperaciom==140
         veloperacion1=0.81;
elseif veloperaciom==135
         veloperacion1=0.73;
elseif veloperaciom==130
         veloperacion1=0.66;
elseif veloperaciom==125
         veloperacion1=0.58;
elseif veloperaciom==120
        veloperacion1=0.51;
elseif veloperaciom==115
         veloperacion1=0.44;
elseif veloperaciom==110
         veloperacion1=0.39;
elseif veloperaciom==105
         veloperacion1=0.34;
elseif veloperaciom==100
         veloperacion1=0.29;
elseif veloperaciom==95
         veloperacion1=0.25;   
elseif veloperaciom==90
         veloperacion1=0.21;
elseif veloperaciom==85
         veloperacion1=0.18;
elseif veloperaciom==80
         veloperacion1=0.15;
elseif veloperaciom==75
         veloperacion1=0.12;
elseif veloperaciom==70
         veloperacion1=0.1;
elseif veloperaciom==65
         veloperacion1=0.08;
elseif veloperaciom==60
         veloperacion1=0.06;
elseif veloperaciom==55
         veloperacion1=0.05;
elseif veloperaciom==50
         veloperacion1=0.04;
elseif veloperaciom==45
         veloperacion1=0.03;
elseif veloperaciom==40
         veloperacion1=0.02;
elseif veloperaciom==35
         veloperacion1=0.01
elseif veloperaciom==30
         veloperacion1=0;
end
if tipomedian==1
 tipomediana2=tipomediana(1,1);
elseif tipomedian==2
 tipomediana2=tipomediana(1,1);
elseif tipomedian==3
 tipomediana2=tipomediana(1,1);
elseif tipomedian==4
 tipomediana2=tipomediana(1,1);
elseif tipomedian==5
 tipomediana2=tipomediana(1,1);
elseif tipomedian==6
 tipomediana2=tipomediana(1,1);
elseif tipomedian==7
 tipomediana2=tipomediana(1,1);
elseif tipomedian==8
 tipomediana2=tipomediana(1,1);
elseif tipomedian==9
 tipomediana2=tipomediana(1,1);
elseif tipomedian==10
 tipomediana2=tipomediana(1,1);
elseif tipomedian==11
 tipomediana2=tipomediana(1,1);
elseif tipomedian==12
 tipomediana2=tipomediana(1,1);
elseif tipomedian==13
 tipomediana2=tipomediana(1,1);
elseif tipomedian==14
 tipomediana2=tipomediana(1,1);
elseif tipomedian==15
 tipomediana2=tipomediana(1,1);
end 
%Probabilidad
x4=anchocarril*curvatura2*calidadcurva2*delineacion*bandassonoras*estadosuperficie2*pendiente*resdeslizamiento2;
%Severidad igual a tipomediana2
%Clasificacion por estrellas para accidente frontal (perdida del control)
C=anchocarril*curvatura2*calidadcurva2*delineacion*bandassonoras*estadosuperficie2*pendiente*resdeslizamiento2*tipomediana2*flujoy2*veloperacion1*transitabilida;
%%Clasificación por Estrellas Choque frontal (adelantamiento) %
%Velocidades diferenciales
disp('1 = Ausente');
disp('2 = Presente');
velodiferenci=x(50);
if velodiferenci==1
    velodiferencial=1;
else velodiferenci==2
     velodiferencial=1.2;
end
%Numero de carriles
T14=[1 1;0.02 2.8;0.01 5.2;0.01 8;0.5 1.8;0.02 4];
disp('1 = Uno');
disp('2 = Dos');
disp('3 = Tres');
disp('4 = Cuatro o mas');
disp('5 = Dos y uno');
disp('6 = Tres y dos');
ncarrile=x(12);
if ncarrile==1
    for i=1:2
    ncarriles(1,i)=T14(1,i);
    end
end
if ncarrile==2
    for i=1:2
    ncarriles(1,i)=T14(2,i);
    end
end
if ncarrile==3
    for i=1:2
    ncarriles(1,i)=T14(3,i);
    end
end
if ncarrile==4
    for i=1:2
    ncarriles(1,i)=T14(4,i);
    end
end
if ncarrile==5
    for i=1:2
    ncarriles(1,i)=T14(5,i);
    end
end
if ncarrile==6
    for i=1:2
    ncarriles(1,i)=T14(6,i);
    end
end
if ncarrile==1
    ncarriles2=ncarriles(1,1);
elseif ncarrile==2
        ncarriles2=ncarriles(1,1);
elseif ncarrile==3
        ncarriles2=ncarriles(1,1);
elseif ncarrile==4
        ncarriles2=ncarriles(1,1);        
elseif ncarrile==5
        ncarriles2=ncarriles(1,1);        
elseif ncarrile==6
        ncarriles2=ncarriles(1,1);  
end
if tipomedian==1
 tipomediana3=tipomediana(1,2);
elseif tipomedian==2
 tipomediana3=tipomediana(1,2);
elseif tipomedian==3
 tipomediana3=tipomediana(1,2);
elseif tipomedian==4
 tipomediana3=tipomediana(1,2);
elseif tipomedian==5
 tipomediana3=tipomediana(1,2);
elseif tipomedian==6
 tipomediana3=tipomediana(1,2);
elseif tipomedian==7
 tipomediana3=tipomediana(1,2);
elseif tipomedian==8
 tipomediana3=tipomediana(1,2);
elseif tipomedian==9
 tipomediana3=tipomediana(1,2);
elseif tipomedian==10
 tipomediana3=tipomediana(1,2);
elseif tipomedian==11
 tipomediana3=tipomediana(1,2);
elseif tipomedian==12
 tipomediana3=tipomediana(1,2);
elseif tipomedian==13
 tipomediana3=tipomediana(1,2);
elseif tipomedian==14
 tipomediana3=tipomediana(1,2);
elseif tipomedian==15
 tipomediana3=tipomediana(1,2);
end
%Probabilidad
x5=pendiente*resdeslizamiento2*velodiferencial*ncarriles2;
%Severidad igual a tipomediana3
%Clasificacion por estrellas frontal (adelantamiento)
D=pendiente*resdeslizamiento2*velodiferencial*ncarriles2*tipomediana3*flujoy3*veloperacion1;
%%Interseccion 
%Tipo de interseccion
T15=[6 15 1.05 40 6 20;15 15 1.5 150 30 30;13 45 1.1 45 17 45;16 45 1.1 55 20 45;9 45 1.1 30 9 45;12 45 1.1 40 14 45;16 50 1.2 55 16 50;23 50 1.2 80 26 50;10 50 1.2 35 10 50;15 50 1.2 50 16 50;0 0 1 0 0 0;1 150 1 3 1 150;0.5 150 1 1 0.5 150;0.5 45 1.1 2 0.5 45;0.3 45 1.1 1 0.3 45;16 35 1.3 55 16 35];
disp('1 = Carril de incorporacion')
disp('2 = Rotonda')
disp('3 = 3 ramas (no semaforizada) con giro continuo')
disp('4 = 3 ramas (no semaforizada) sin giro continuo')
disp('5 = 3 ramas (semaforizada) con giro continuo')
disp('6 = 3 ramas (semaforizada) sin giro continuo')
disp('7 = 4 ramas (no semaforizada) con giro continuo')
disp('8 = 4 ramas (no semaforizada) sin giro continuo')
disp('9 = 4 ramas (semaforizada) con giro continuo')
disp('10 = 4 ramas (semaforizada) sin giro continuo')
disp('11 = Ninguno')
disp('12 = Cruce de ferrocarril - pasivo (solo señalizacion vertical)')
disp('13 = Cruce de ferrocarril - activo (semaforo intermitente/pluma)')
disp('14 = Punto de cruce de faja separadora central - informal')
disp('15 = Punto de cruce de faja separadora central - formal')
disp('16 = Minirotonda')
tipointe=x(25);
if tipointe==1
    for i=1:6
    tipointer(1,i)=T15(1,i);
    end
end
if tipointe==2
    for i=1:6
    tipointer(1,i)=T15(2,i);
    end
end
if tipointe==3
    for i=1:6
    tipointer(1,i)=T15(3,i)
    end
end
if tipointe==4
    for i=1:6
    tipointer(1,i)=T15(4,i);
    end
end
if tipointe==5
    for i=1:6
    tipointer(1,i)=T15(5,i);
    end
end
if tipointe==6
    for i=1:6
    tipointer(1,i)=T15(6,i);
    end
end
if tipointe==7
    for i=1:6
    tipointer(1,i)=T15(7,i);
    end
end
if tipointe==8
    for i=1:6
    tipointer(1,i)=T15(8,i);
    end
end
if tipointe==9
    for i=1:6
    tipointer(1,i)=T15(9,i);
    end
end
if tipointe==10
    for i=1:6
    tipointer(1,i)=T15(10,i);
    end
end
if tipointe==11
    for i=1:6
    tipointer(1,i)=T15(11,i);
    end
end
if tipointe==12
    for i=1:6
    tipointer(1,i)=T15(12,i);
    end
end
if tipointe==13
    for i=1:6
    tipointer(1,i)=T15(13,i);
    end
end
if tipointe==14
    for i=1:6
    tipointer(1,i)=T15(14,i);
    end
end
if tipointe==15
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==16
    for i=1:6
    tipointer(1,i)=T15(16,i);
    end
end
%Calidad de la interseccion 
%T16=[1 1 1 1;1.2 1.2 1.2 1.2;1 1 1 1]
disp('1 = Adecuado')
disp('2 = Deficiente')
disp('3 = No aplica')
calinte=x(28);
if calinte==1
    calinter=1;
elseif calinte==2
     calinter=1.2;
elseif calinte==3
      calinter=1;
end
%Alumbrado publico
T17=[1.15 1.25 1.25;1 1 1];
disp('1 = Ausente')
disp('2 = Presente')
alumbrad=x(20);
if alumbrad==1
    for i=1:3
    alumbrado(1,i)=T17(1,i);
    end
end
if alumbrad==2
    for i=1:3
    alumbrado(1,i)=T17(2,i);
    end
end
%Distancia visual
%T18=[1 1 1;1.42 1.42 1.42];
disp('1 = Adecuada');
disp('2 = Deficiente');
distvisua=x(24);
if distvisua==1
    distvisual=1;
elseif distvisua==2
     distvisual=1.42;
end
%Canalización de la intersección
disp('1 = Ausente');
disp('2 = Presente');
caninte=x(26);
if caninte==1
    caninter=1.2;
elseif caninte==2
     caninter=1;
end
%Gestión de la velocidad / Calmante del tráfico
T19=[1.25 1.25 1.25;1 1 1];
disp('1 = Ausente')
disp('2 = Presente')
gestvel=x(51);
if gestvel==1
    gestvelo=1.25;
else gestvel==2 
     gestvelo=1;
end
if tipointe==1
    tipointer2=tipointer(1,1);
elseif tipointe==2
    tipointer2=tipointer(1,1);
elseif tipointe==3
    tipointer2=tipointer(1,1);
elseif tipointe==4
    tipointer2=tipointer(1,1);
elseif tipointe==5
    tipointer2=tipointer(1,1);
elseif tipointe==6
    tipointer2=tipointer(1,1);
elseif tipointe==7
    tipointer2=tipointer(1,1);
elseif tipointe==8
    tipointer2=tipointer(1,1);
elseif tipointe==9
    tipointer2=tipointer(1,1);
elseif tipointe==10
    tipointer2=tipointer(1,1);
elseif tipointe==11
    tipointer2=tipointer(1,1);
elseif tipointe==12
    tipointer2=tipointer(1,1);
elseif tipointe==13
    tipointer2=tipointer(1,1);
elseif tipointe==14
    tipointer2=tipointer(1,1);
elseif tipointe==15
    tipointer2=tipointer(1,1);
elseif tipointe==13
    tipointer2=tipointer(1,1)
end
if alumbrad==1
    alumbrado1=alumbrado(1,1);
elseif  alumbrad==2
      alumbrado1=alumbrado(1,1);
end
if tipointe==1
    tipointer3=tipointer(1,2);
elseif tipointe==2
    tipointer3=tipointer(1,2);
elseif tipointe==3
    tipointer3=tipointer(1,2);
elseif tipointe==4
    tipointer3=tipointer(1,2);
elseif tipointe==5
    tipointer3=tipointer(1,2);
elseif tipointe==6
    tipointer3=tipointer(1,2);
elseif tipointe==7
    tipointer3=tipointer(1,2);
elseif tipointe==8
    tipointer3=tipointer(1,2);
elseif tipointe==9
    tipointer3=tipointer(1,2);
elseif tipointe==10
    tipointer3=tipointer(1,2);
elseif tipointe==11
    tipointer3=tipointer(1,2);
elseif tipointe==12
    tipointer3=tipointer(1,2);
elseif tipointe==13
    tipointer3=tipointer(1,2);
elseif tipointe==14
    tipointer3=tipointer(1,2);
elseif tipointe==15
    tipointer3=tipointer(1,2);
elseif tipointe==16
    tipointer3=tipointer(1,2);
end
%Intersección del volumen de la carretera
%volinte=x(27)
%Probabilidad
x6=tipointer2*calinter*pendiente*alumbrado1*resdeslizamiento2*distvisual*caninter*gestvelo;
%Severidad igual a tipointer3
%Clasificacion por estrellas para la interseccion
velointer=veloperacion;
if veloperaciom==150 && tipointe==12
    velointer=1;
elseif veloperaciom==145 && tipointe==12
    velointer=0.97;
elseif veloperaciom==140 && tipointe==12
         velointer=0.93; 
elseif veloperaciom==135 && tipointe==12
         velointer=0.90;
elseif veloperaciom==130 && tipointe==12
         velointer=0.87;
elseif veloperaciom==125 && tipointe==12
         velointer=0.83;
elseif veloperaciom==120 && tipointe==12
        velointer=0.80;
elseif veloperaciom==115 && tipointe==12
         velointer=0.77;
elseif veloperaciom==110 && tipointe==12
         velointer=0.73;
elseif veloperaciom==105 && tipointe==12
         velointer=0.70;
elseif veloperaciom==100 && tipointe==12
         velointer=0.67;
elseif veloperaciom==95 && tipointe==12
         velointer=0.63;  
elseif veloperaciom==90 && tipointe==12
         velointer=0.60;
elseif veloperaciom==85 && tipointe==12
         velointer=0.57;
elseif veloperaciom==80 && tipointe==12
         velointer=0.53;
elseif veloperaciom==75 && tipointe==12
         velointer=0.50;
elseif veloperaciom==70 && tipointe==12
         velointer=0.47;
elseif veloperaciom==65 && tipointe==12
         velointer=0.43;
elseif veloperaciom==60 && tipointe==12
         velointer=0.40;
elseif veloperaciom==55 && tipointe==12
         velointer=0.36;
elseif veloperaciom==50 && tipointe==12
         velointer=0.33;
elseif veloperaciom==45 && tipointe==12
         velointer=0.30;
elseif veloperaciom==40 && tipointe==12
         velointer=0.27;
elseif veloperaciom==35 && tipointe==12
         velointer=0.23;
elseif veloperaciom==30 && tipointe==12
         velointer=0.2;
elseif veloperaciom==150 && tipointe==13
    velointer=1;
elseif veloperaciom==145 && tipointe==13
    velointer=0.97;
elseif veloperaciom==140 && tipointe==13
         velointer=0.93; 
elseif veloperaciom==135 && tipointe==13
         velointer=0.90;
elseif veloperaciom==130 && tipointe==13
         velointer=0.87;
elseif veloperaciom==125 && tipointe==13
         velointer=0.83;
elseif veloperaciom==120 && tipointe==13
        velointer=0.80;
elseif veloperaciom==115 && tipointe==13
         velointer=0.77;
elseif veloperaciom==110 && tipointe==13
         velointer=0.73;
elseif veloperaciom==105 && tipointe==13
         velointer=0.70;
elseif veloperaciom==100 && tipointe==13
         velointer=0.67;
elseif veloperaciom==95 && tipointe==13
         velointer=0.63;  
elseif veloperaciom==90 && tipointe==13
         velointer=0.60;
elseif veloperaciom==85 && tipointe==13
         velointer=0.57;
elseif veloperaciom==80 && tipointe==13
         velointer=0.53;
elseif veloperaciom==75 && tipointe==13
         velointer=0.50;
elseif veloperaciom==70 && tipointe==13
         velointer=0.47;
elseif veloperaciom==65 && tipointe==13
         velointer=0.43;
elseif veloperaciom==60 && tipointe==13
         velointer=0.40;
elseif veloperaciom==55 && tipointe==13
         velointer=0.36;
elseif veloperaciom==50 && tipointe==13
         velointer=0.33;
elseif veloperaciom==45 && tipointe==13
         velointer=0.30;
elseif veloperaciom==40 && tipointe==13
         velointer=0.27;
elseif veloperaciom==35 && tipointe==13
         velointer=0.23;
elseif veloperaciom==30 && tipointe==13
         velointer=0.2;
end
E=tipointer2*calinter*pendiente*alumbrado1*resdeslizamiento2*distvisual*caninter*gestvelo*tipointer3*flujoy4*velointer;
%%Acceso a propiedades
if tipomedian==1
 tipomediana4=tipomediana(1,4);
elseif tipomedian==2
 tipomediana4=tipomediana(1,4);
elseif tipomedian==3
 tipomediana4=tipomediana(1,4);
elseif tipomedian==4
 tipomediana4=tipomediana(1,4);
elseif tipomedian==5
 tipomediana4=tipomediana(1,4);
elseif tipomedian==6
 tipomediana4=tipomediana(1,4);
elseif tipomedian==7
 tipomediana4=tipomediana(1,4);
elseif tipomedian==8
 tipomediana4=tipomediana(1,4);
elseif tipomedian==9
 tipomediana4=tipomediana(1,4);
elseif tipomedian==10
 tipomediana4=tipomediana(1,4);
elseif tipomedian==11
 tipomediana4=tipomediana(1,4);
elseif tipomedian==12
 tipomediana4=tipomediana(1,4);
elseif tipomedian==13
 tipomediana4=tipomediana(1,4);
elseif tipomedian==14
 tipomediana4=tipomediana(1,4);
elseif tipomedian==15
 tipomediana4=tipomediana(1,4);
end
%Via de servicio
disp('1 = Ausente')
disp('2 = Presente')
vacces=x(22);
if vacces==1
    vacceso=1.5;
else vacces==2
        vacceso=1;
end
%Puntos de acceso
T19=[2 50;1.3 50;1.1 50;1 0];
disp('1 = Acceso comercial 1+')
disp('2 = Acceso residencial >=3')
disp('3 = Acceso residencial <3')
disp('4 = Ninguno')
puntacces=x(29);
if puntacces==1
    for i=1:2
    puntacceso(1,i)=T19(1,i);
    end
end
if puntacces==2
    for i=1:2
    puntacceso(1,i)=T19(2,i);
    end
end
if puntacces==3
    for i=1:2
    puntacceso(1,i)=T19(3,i);
    end
end
if puntacces==4
    for i=1:2
    puntacceso(1,i)=T19(4,i);
    end
end
if puntacces==1
    puntacceso1=puntacceso(1,1);
elseif puntacces==2
    puntacceso1=puntacceso(1,1);
elseif puntacces==3
    puntacceso1=puntacceso(1,1);
elseif puntacces==4
    puntacceso1=puntacceso(1,1);
end
if puntacces==1
    puntacceso2=puntacceso(1,2);
elseif puntacces==2
    puntacceso2=puntacceso(1,2);
elseif puntacces==3
    puntacceso2=puntacceso(1,2);
elseif puntacces==4
    puntacceso2=puntacceso(1,2);
end
%Influencia del flujo externo - Flujo predeterminado
%flujopre=0.01;
%Probabilidad
x7=tipomediana4*vacceso*puntacceso1;
%Severidad igual a puntacceso2
%Clasificacion por estrellas para acceso a propiedades
F=tipomediana4*vacceso*puntacceso1*puntacceso2*flujopre*veloperacion;
%Tipo de carretera
tipocarretera=x(8)
if tipocarretera==1 %Calzada A de una calzada dividida
    tipocarreter=1.034080299;
    tipocarreterm=1.027787077;
elseif tipocarretera==2 %Calzada B de una calzada dividida
    tipocarreter=1.034080299;
    tipocarreterm=1.027787077;
elseif tipocarretera==3 %Carretera no dividida
    tipocarreter=1;
    tipocarreterm=1;
elseif tipocarretera==4 %Calzada A de una infraestructura de motocicletas
    tipocarreter=1.034080299;
    tipocarreterm=1.027787077;
elseif  tipocarretera==5 %Calzada B de una infraestructura de motocicletas
    tipocarreter=1.034080299;
    tipocarreterm=1.027787077;
end 
%Clasificacion para vehiculos
EstVehicul=(A+B+C+D+E+F)*tipocarreter;
if EstVehicul>=22.5
    EstVehiculo=1;
elseif EstVehicul>=12.5&EstVehicul<22.5
    EstVehiculo=2;
elseif EstVehicul>=5&EstVehicul<12.5
    EstVehiculo=3;
elseif EstVehicul>=2.5&EstVehicul<5
    EstVehiculo=4;
elseif EstVehicul>=0&EstVehicul<2.5
    EstVehiculo=5;
elseif EstVehicul==0
    EstVehiculo=0;
end
%Puntuacion Total/Vehiculo
x8=EstVehicul;
%CLASIFICACION PARA MOTOCICLISTAS
%Salida del camino (lado del conducto)
if curvatur==1
    curvatura3=curvatura(1,2);
elseif curvatur==2
    curvatura3=curvatura(1,2);
elseif curvatur==3
    curvatura3=curvatura(1,2);
elseif curvatur==4
    curvatura3=curvatura(1,2);
end
if calidadcurv==1
    calidadcurva3=calidadcurva(1,2);
 else if calidadcurv==2
    calidadcurva3=calidadcurva(1,2);
 else if calidadcurv==3
    calidadcurva3=calidadcurva(1,2);
 end
     end
end
if estadosuperfici==1
    estadosuperficie3=estadosuperficie(1,2);
elseif estadosuperfici==2
    estadosuperficie3=estadosuperficie(1,2);
elseif estadosuperfici==3
    estadosuperficie3=estadosuperficie(1,2);
end
if resdeslizamient==1
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==2
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==3
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==4
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==5
   resdeslizamiento3=resdeslizamiento(1,2);
end
if distconducto==1
  distconductor3=distconductor(1,2);
elseif distconducto==2
  distconductor3=distconductor(1,2);
elseif distconducto==3
  distconductor3=distconductor(1,2);
elseif distconducto==4
  distconductor3=distconductor(1,2);
end
if objconducto==1
 objconductor3=objconductor(1,2);
elseif objconducto==2
 objconductor3=objconductor(1,2);
elseif objconducto==3
 objconductor3=objconductor(1,2);
elseif objconducto==4
 objconductor3=objconductor(1,2);
elseif objconducto==5
 objconductor3=objconductor(1,2);
elseif objconducto==6
 objconductor3=objconductor(1,2);
elseif objconducto==7
 objconductor3=objconductor(1,2);
elseif objconducto==8
 objconductor3=objconductor(1,2);
elseif objconducto==9
 objconductor3=objconductor(1,2);
elseif objconducto==10
 objconductor3=objconductor(1,2);
elseif objconducto==11
 objconductor3=objconductor(1,2);
elseif objconducto==12
 objconductor3=objconductor(1,2);
elseif objconducto==13
 objconductor3=objconductor(1,2);
elseif objconducto==14
 objconductor3=objconductor(1,2);
elseif objconducto==15
 objconductor3=objconductor(1,2);
elseif objconducto==16
 objconductor3=objconductor(1,2);
elseif objconducto==17
 objconductor3=objconductor(1,2);
end 
if anchoespaldo==1
  anchoespaldon3=anchoespaldon(1,1);
elseif anchoespaldo==2
  anchoespaldon3=anchoespaldon(1,1);
elseif anchoespaldo==3
  anchoespaldon3=anchoespaldon(1,1);
elseif anchoespaldo==4
  anchoespaldon3=anchoespaldon(1,1);
end
%Probabilidad
x9=anchocarril*curvatura3*calidadcurva3*delineacion*bandasonoraes*estadosuperficie3*pendiente*resdeslizamiento3;
%Severidad
x10=distconductor3*objconductor3*anchoespaldon2;
%Clasificacion por estrellas pra la salida del camino (lado del conductor)
G=anchocarril*curvatura3*calidadcurva3*delineacion*bandasonoraes*estadosuperficie3*pendiente*resdeslizamiento3*distconductor3*objconductor3*anchoespaldon2*flujoy1*velosalida*transitabilida;
%%Salida del camino (lado del copiloto)
if distcopilot==1
  distcopiloto3=distcopiloto(1,2);
elseif distcopilot==2
  distcopiloto3=distcopiloto(1,2);
elseif distcopilot==3
  distcopiloto3=distcopiloto(1,2);
elseif distcopilot==4
  distcopiloto3=distcopiloto(1,2);
end
if objcopilot==1
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==2
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==3
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==4
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==5
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==6
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==7
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==8
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==9
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==10
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==11
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==12
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==13
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==14
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==15
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==16
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==17
 objcopiloto3=objcopiloto(1,2);
end
if anchoespaldonco==1
  anchoespaldoncop3=anchoespaldoncop(1,1);
elseif anchoespaldonco==2
  anchoespaldoncop3=anchoespaldoncop(1,1);
elseif anchoespaldonco==3
  anchoespaldoncop3=anchoespaldoncop(1,1);
elseif anchoespaldonco==4
  anchoespaldoncop3=anchoespaldoncop(1,1);
end
%Probabilidad igual a conductor Modo x9
%Severidad
x11=distcopiloto3*objcopiloto3*anchoespaldoncop3;
%Clasificacion por estrellas para la salida de la via (lado copiloto)
H=anchocarril*curvatura3*calidadcurva3*delineacion*bandasonoraes*estadosuperficie3*pendiente*resdeslizamiento3*distcopiloto3*objcopiloto3*anchoespaldoncop3*flujoy1*velosalida;
%Frontal (pérdida del control)
%Probabilidad
x12=anchocarril*curvatura3*calidadcurva3*delineacion*bandassonoras*estadosuperficie3*pendiente*resdeslizamiento3;
%Severidad es tipomediana2
%Clasificacion por estrellas frontal (perdida de control)
I=anchocarril*curvatura3*calidadcurva3*delineacion*bandassonoras*estadosuperficie3*pendiente*resdeslizamiento3*tipomediana2*flujoy2*veloperacion1*transitabilida;
%%Frontal (Adelantamiento)
%Probabilidad
x13=pendiente*resdeslizamiento3*velodiferencial*ncarriles2;
%Severidad es tipomediana3
%Clasificacion por estrellas frontal (adeantamiento)
J=pendiente*resdeslizamiento3*velodiferencial*ncarriles2*tipomediana3*flujoy3*veloperacion;
%%Interseccion
if tipointe==1
    tipointer4=tipointer(1,5);
elseif tipointe==2
    tipointer4=tipointer(1,5);
elseif tipointe==3
    tipointer4=tipointer(1,5);
elseif tipointe==4
    tipointer4=tipointer(1,5);
elseif tipointe==5
    tipointer4=tipointer(1,5);
elseif tipointe==6
    tipointer4=tipointer(1,5);
elseif tipointe==7
    tipointer4=tipointer(1,5);
elseif tipointe==8
    tipointer4=tipointer(1,5);
elseif tipointe==9
    tipointer4=tipointer(1,5);
elseif tipointe==10
    tipointer4=tipointer(1,5);
elseif tipointe==11
    tipointer4=tipointer(1,5);
elseif tipointe==12
    tipointer4=tipointer(1,5);
elseif tipointe==13
    tipointer4=tipointer(1,5);
elseif tipointe==14
    tipointer4=tipointer(1,5);
elseif tipointe==15
    tipointer4=tipointer(1,5);
elseif tipointe==16
    tipointer4=tipointer(1,5);
end
if tipointe==1
    tipointer5=tipointer(1,6);
elseif tipointe==2
    tipointer5=tipointer(1,6);
elseif tipointe==3
    tipointer5=tipointer(1,6);
elseif tipointe==4
    tipointer5=tipointer(1,6);
elseif tipointe==5
    tipointer5=tipointer(1,6);
elseif tipointe==6
    tipointer5=tipointer(1,6);
elseif tipointe==7
    tipointer5=tipointer(1,6);
elseif tipointe==8
    tipointer5=tipointer(1,6);
elseif tipointe==9
    tipointer5=tipointer(1,6);
elseif tipointe==10
    tipointer5=tipointer(1,6);
elseif tipointe==11
    tipointer5=tipointer(1,6);
elseif tipointe==12
    tipointer5=tipointer(1,6);
elseif tipointe==13
    tipointer5=tipointer(1,6);
elseif tipointe==14
    tipointer5=tipointer(1,6);
elseif tipointe==15
    tipointer5=tipointer(1,6);
elseif tipointe==16
    tipointer5=tipointer(1,6);
end
%Intersección del volumen de la carretera
%Probabilidad
x14=tipointer4*calinter*pendiente*alumbrado1*resdeslizamiento3*distvisual*caninter*gestvelo;
%Severidad igual a tipointer5
%Clasificacion por estrellas para la interseccion
K=tipointer4*calinter*pendiente*alumbrado1*resdeslizamiento3*distvisual*caninter*gestvelo*tipointer5*flujoy4*velointer;
%%Acceso a propiedades
%Via de servicio
%Puntos de acceso
%Influencia del flujo externo - Flujo predeterminado
%Probabilidad
x15=vacceso*puntacceso1;
%Severidad es igual a puntacceso2
ZX=vacceso*puntacceso1*puntacceso2*flujopre*veloperacion;
%%A lo largo
%Infraestructura para motocicletas
T20=[0 50;0.1 50;0 50;0.1 50;1 50;2 50];
disp('1 = Motovía exclusiva de un sentido con barrera')
disp('2 = Motovía exclusiva de un sentido sin barrera')
disp('3 = Motovía exclusiva de dos sentidos con barrera')
disp('4 = Motovía exclusiva de dos sentidos sin barrera')
disp('5 = Motovía compartida en la carretera')
disp('6 = Ninguno')
infmot=x(45);
if infmot==1
    for i=1:2
    infmoto(1,i)=T20(1,i)
    end
end
if infmot==2
    for i=1:2
    infmoto(1,i)=T20(2,i)
    end
end
if infmot==3
    for i=1:2
    infmoto(1,i)=T20(3,i)
    end
end
if infmot==4
    for i=1:2
    infmoto(1,i)=T20(4,i)
    end
end
if infmot==5
    for i=1:2
    infmoto(1,i)=T20(5,i)
    end
end
if infmot==6
    for i=1:2
    infmoto(1,i)=T20(6,i)
    end
end
if infmot==1
    infmoto1=infmoto(1,1)
elseif infmot==2
        infmoto1=infmoto(1,1)
elseif infmot==3
        infmoto1=infmoto(1,1)
elseif infmot==4
        infmoto1=infmoto(1,1)
elseif infmot==5
        infmoto1=infmoto(1,1)
elseif infmot==6
        infmoto1=infmoto(1,1)
end
if infmot==1
    infmoto2=infmoto(1,2)
elseif infmot==2
        infmoto2=infmoto(1,2)
elseif infmot==3
        infmoto2=infmoto(1,2)
elseif infmot==4
        infmoto2=infmoto(1,2)
elseif infmot==5
        infmoto2=infmoto(1,2)
elseif infmot==6
        infmoto2=infmoto(1,2)
end
%Influencia del flujo externo - Sin TDPA de motocicletas (M/C) por carril
L=infmoto1*infmoto2*flujoy7*veloperacion;
pormoto=x(31);
if pormoto==1 
        EstMoto=0;
elseif pormoto==2
        EstMoto=0;
elseif pormoto==3
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;   
elseif pormoto==4
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;
elseif pormoto==5
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;      
elseif pormoto==6
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;
elseif pormoto==7
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;       
elseif pormoto==8
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;
elseif pormoto==9
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;        
elseif pormoto==10
        EstMoto=(G+H+I+J+K+L+ZX)*tipocarreterm;
end
if EstMoto>=22.5
    EstMotocicleta=1;
elseif EstMoto>=12.5&EstMoto<22.5
    EstMotocicleta=2;
elseif EstMoto>=5&EstMoto<12.5
    EstMotocicleta=3;
elseif EstMoto>=2.5&EstMoto<5
    EstMotocicleta=4;
elseif EstMoto>0&EstMoto<2.5
    EstMotocicleta=5;
else EstMoto==0
    EstMotocicleta=0;
end
%Puntuacion total
x16=EstMoto;
%%%Clasificación por Estrellas para ciclistas
%Infraestructura para bicicletas 
T21=[0 1 0;0.1 1 90;12 1 90;20 1.2 90;17 1.2 90;19 1 90;1 1 90];
disp('1 = Ciclovía fuera de la carretera con barrera')
disp('2 = Ciclovía fuera de la carretera sin barrera')
disp('3 = Ciclovía en la carretera')
disp('4 = Ninguno')
disp('5 = Carril extra fuera de la calzada (≥4.2 m)')
disp('6 = Vía compartida con señalización vertical')
disp('7 = Ciclovía de uso compartido')
infbic=x(46);
if infbic==1
    for i=1:3
    infbici(1,i)=T21(1,i);
    end
end
if infbic==2
    for i=1:3
    infbici(1,i)=T21(2,i);
    end
end
if infbic==3
    for i=1:3
    infbici(1,i)=T21(3,i);
    end
end
if infbic==4
    for i=1:3
    infbici(1,i)=T21(4,i);
    end
end
if infbic==5
    for i=1:3
    infbici(1,i)=T21(5,i);
    end
end
if infbic==6
    for i=1:3
    infbici(1,i)=T21(6,i);
    end
end
if infbic==7
    for i=1:3
    infbici(1,i)=T21(7,i);
    end
end
if infbic==1
    infbici1=infbici(1,1);
elseif infbic==2
        infbici1=infbici(1,1);
elseif infbic==3
        infbici1=infbici(1,1);
elseif infbic==4
        infbici1=infbici(1,1);
elseif infbic==5
        infbici1=infbici(1,1);
elseif infbic==6
        infbici1=infbici(1,1);
elseif infbic==7
        infbici1=infbici(1,1);
end
%Estacionamiento de vehiculos
disp('1 = Ninguno')
disp('2 = Un lado')
disp('3 = Dos lados')
estve=x(21);
if estve==1
    estveh=1
elseif estve==2
    estveh=1.2
elseif estve==3
    estveh=1.33
end
if alumbrad==1
    alumbrado2=alumbrado(1,3);
elseif  alumbrad==2
   alumbrado2=alumbrado(1,3);
end
if infbic==1
    infbici2=infbici(1,3);
elseif infbic==2
        infbici2=infbici(1,3);
elseif infbic==3
        infbici2=infbici(1,3);
elseif infbic==4
        infbici2=infbici(1,3);
elseif infbic==5
        infbici2=infbici(1,3);
elseif infbic==6
        infbici2=infbici(1,3);
elseif infbic==7
        infbici2=infbici(1,3);
end
%Velocidad de operacion (+10 km/h)
%veloperacio=x(52);
 if veloperaciom==150
        veloperacionbi=1;
 elseif veloperaciom==145
         veloperacionbi=0.97;
 elseif veloperaciom==140
         veloperacionbi=0.93;
 elseif veloperaciom==135
         veloperacionbi=0.9;
 elseif veloperaciom==130
         veloperacionbi=0.87;
 elseif veloperaciom==125
         veloperacionbi=0.83;
 elseif veloperaciom==120
        veloperacionbi=0.8;
 elseif veloperaciom==115
         veloperacionbi=0.77;
 elseif veloperaciom==110
         veloperacionbi=0.73;
 elseif veloperaciom==105
         veloperacionbi=0.7;
 elseif veloperaciom==100
         veloperacionbi=0.67;
 elseif veloperaciom==95
         veloperacionbi=0.63;  
 elseif veloperaciom==90
         veloperacionbi=0.53;
 elseif veloperaciom==85
         veloperacionbi=0.44;
 elseif veloperaciom==80
         veloperacionbi=0.36;
 elseif veloperaciom==75
         veloperacionbi=0.28;
 elseif veloperaciom==70
         veloperacionbi=0.22;
 elseif veloperaciom==65
         veloperacionbi=0.18;
 elseif veloperaciom==60
         veloperacionbi=0.14;
 elseif veloperaciom==55
         veloperacionbi=0.1;
 elseif veloperaciom==50
         veloperacionbi=0.07;
 elseif veloperaciom==45
         veloperacionbi=0.05;
 elseif veloperaciom==40
         veloperacionbi=0.03;
 elseif veloperaciom==35
         veloperacionbi=0.02;
 elseif veloperaciom==30
         veloperacionbi=0.01;
 end
%flujoext=input('Ingresar flujo externo : ');
%Probabilidad
x17=infbici1*curvatura2*calidadcurva3*distvisual*anchocarril*delineacion*pendiente*estadosuperficie2*gestvelo*bandasonoraes*estveh*resdeslizamiento3*alumbrado2;
%Severidad es infbici2
%Clasificacion por estrellas a lo largo
M=infbici1*curvatura2*calidadcurva3*distvisual*anchocarril*delineacion*pendiente*estadosuperficie2*gestvelo*bandasonoraes*estveh*resdeslizamiento3*alumbrado2*infbici2*veloperacionbi*flujoy5;
%%Salida de via
if estadosuperfici==1
    estadosuperficie5=estadosuperficie(1,5);
elseif estadosuperfici==2
    estadosuperficie5=estadosuperficie(1,5);
elseif estadosuperfici==3
    estadosuperficie5=estadosuperficie(1,5);
end
if distconducto==1
  distconductor4=distconductor(1,3);
elseif distconducto==2
  distconductor4=distconductor(1,3);
elseif distconducto==3
  distconductor4=distconductor(1,3);
elseif distconducto==4
  distconductor4=distconductor(1,3);
end
if objconducto==1
 objconductor4=objconductor(1,3);
elseif objconducto==2
 objconductor4=objconductor(1,3);
elseif objconducto==3
 objconductor4=objconductor(1,3);
elseif objconducto==4
 objconductor4=objconductor(1,3);
elseif objconducto==5
 objconductor4=objconductor(1,3);
elseif objconducto==6
 objconductor4=objconductor(1,3);
elseif objconducto==7
 objconductor4=objconductor(1,3);
elseif objconducto==8
 objconductor4=objconductor(1,3);
elseif objconducto==9
 objconductor4=objconductor(1,3);
elseif objconducto==10
 objconductor4=objconductor(1,3);
elseif objconducto==11
 objconductor4=objconductor(1,3);
elseif objconducto==12
 objconductor4=objconductor(1,3);
elseif objconducto==13
 objconductor4=objconductor(1,3);
elseif objconducto==14
 objconductor4=objconductor(1,3);
elseif objconducto==15
 objconductor4=objconductor(1,3);
elseif objconducto==16
 objconductor4=objconductor(1,3);
elseif objconducto==17
 objconductor4=objconductor(1,3);
end
if distcopilot==1
  distcopiloto4=distcopiloto(1,3);
elseif distcopilot==2
  distcopiloto4=distcopiloto(1,3);
elseif distcopilot==3
  distcopiloto4=distcopiloto(1,3);
elseif distcopilot==4
  distcopiloto4=distcopiloto(1,3);
end
if objcopilot==1
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==2
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==3
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==4
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==5
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==6
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==7
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==8
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==9
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==10
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==11
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==12
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==13
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==14
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==15
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==16
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==17
 objcopiloto4=objcopiloto(1,3);
end
%Probabilidad
x20=anchocarril*curvatura2*calidadcurva3*delineacion*alumbrado2*estadosuperficie5*pendiente*resdeslizamiento3;
%Severidad
W=((distconductor4*objconductor4)+(distcopiloto4*objcopiloto4))/2
%Clasificacion por estrellas salida de la via
N=anchocarril*curvatura2*calidadcurva3*delineacion*alumbrado2*estadosuperficie5*pendiente*resdeslizamiento3*W*veloperacionbi*flujoy5;
%%Interseccion
if tipointe==1
    tipointer6=tipointer(1,4);
elseif tipointe==2
    tipointer6=tipointer(1,4);
elseif tipointe==3
    tipointer6=tipointer(1,4);
elseif tipointe==4
    tipointer6=tipointer(1,4);
elseif tipointe==5
    tipointer6=tipointer(1,4);
elseif tipointe==6
    tipointer6=tipointer(1,4);
elseif tipointe==7
    tipointer6=tipointer(1,4);
elseif tipointe==8
    tipointer6=tipointer(1,4);
elseif tipointe==9
    tipointer6=tipointer(1,4);
elseif tipointe==10
    tipointer6=tipointer(1,4);
elseif tipointe==11
    tipointer6=tipointer(1,4);
elseif tipointe==12
    tipointer6=tipointer(1,4);
elseif tipointe==13
    tipointer6=tipointer(1,4);
elseif tipointe==14
    tipointer6=tipointer(1,4);
elseif tipointe==15
    tipointer6=tipointer(1,4);
elseif tipointe==16
    tipointer6=tipointer(1,4);
end
if infbic==1
    infbici3=infbici(1,2);
elseif infbic==2
        infbici3=infbici(1,2);
elseif infbic==3
        infbici3=infbici(1,2);
elseif infbic==4
        infbici3=infbici(1,2);
elseif infbic==5
        infbici3=infbici(1,2);
elseif infbic==6
        infbici3=infbici(1,2);
elseif infbic==7
        infbici3=infbici(1,2);
end
%Infraestructura para cruce peatonal (inspeccionada)
disp('1 = Supervisor de cruce en zona escolar presente en horario de entrada y salida de la escuela')
disp('2 = Supervisor de cruce en zona escolar no presente')
disp('3 = No aplica (no hay escuela en el lugar)')
supescolar=x(48)
disp('1 = Infraestructura a desnivel')
disp('2 = Semaforizada con refugio')
disp('3 = Semaforizada sin refugio')
disp('4 = No semaforizada. señalizada con pintura y con refugio')
disp('5 = No semaforizada. señalizada con pintura y sin refugio')
disp('6 = Solo refugio')
disp('7 =  Sin infraestructura')
disp('8 = Cruce demarcado elevado. sin semáforo. con refugio')
disp('9 = Cruce demarcado elevado. sin semáforo. sin refugio')
disp('10 = Cruce no demarcado elevado. con refugio')
disp('11 = Cruce no demarcado elevado. sin refugio')
T40=[0.4 0.3 0.4;1 0.95 1;1.25 1.2 1.25;3.8 1 3.8;4.8 1.25 4.8;5.1 3.8 5.1;6.7 4.8 6.7;2.5 1 2.5;3.2 1 3.2;3.4 2.5 3.4;4.5 3.2 4.5];
%Via Inspeccionada
infcrucepe=x(39)
if infcrucepe==1 && supescolar==3
    infcrucep=0.4;
elseif infcrucepe==2 && supescolar==3
    infcrucep=1;
elseif infcrucepe==3 && supescolar==3
    infcrucep=1.25;
elseif infcrucepe==4 && supescolar==3
    infcrucep=3.8;
elseif infcrucepe==5 && supescolar==3
    infcrucep=4.8;
elseif infcrucepe==6 && supescolar==3
    infcrucep=5.1;
elseif infcrucepe==7 && supescolar==3
    infcrucep=6.7;        
elseif infcrucepe==8 && supescolar==3
    infcrucep=2.5;    
elseif infcrucepe==9 && supescolar==3
    infcrucep=3.2;   
elseif infcrucepe==10 && supescolar==3
    infcrucep=3.4;    
elseif infcrucepe==11 && supescolar==3
    infcrucep=4.5;    
end
if infcrucepe==1 && supescolar==1
    infcrucep=0.3;
elseif infcrucepe==2 && supescolar==1
    infcrucep=0.95;
elseif infcrucepe==3 && supescolar==1
    infcrucep=1.2;
elseif infcrucepe==4 && supescolar==1
    infcrucep=1;
elseif infcrucepe==5 && supescolar==1
    infcrucep=1.25;
elseif infcrucepe==6 && supescolar==1
    infcrucep=3.8;
elseif infcrucepe==7 && supescolar==1
    infcrucep=4.8;        
elseif infcrucepe==8 && supescolar==1
    infcrucep=1;    
elseif infcrucepe==9 && supescolar==1
    infcrucep=1;   
elseif infcrucepe==10 && supescolar==1
    infcrucep=2.5;    
elseif infcrucepe==11 && supescolar==1
    infcrucep=3.2;    
end
if infcrucepe==1 && supescolar==2
    infcrucep=0.4;
elseif infcrucepe==2 && supescolar==2
    infcrucep=1;
elseif infcrucepe==3 && supescolar==2
    infcrucep=1.25;
elseif infcrucepe==4 && supescolar==2
    infcrucep=3.8;
elseif infcrucepe==5 && supescolar==2
    infcrucep=4.8;
elseif infcrucepe==6 && supescolar==2
    infcrucep=5.1;
elseif infcrucepe==7 && supescolar==2
    infcrucep=6.7;        
elseif infcrucepe==8 && supescolar==2
    infcrucep=2.5;    
elseif infcrucepe==9 && supescolar==2
    infcrucep=3.2;   
elseif infcrucepe==10 && supescolar==2
    infcrucep=3.4;    
elseif infcrucepe==11 && supescolar==2
    infcrucep=4.5;    
end
%Probabilidad
x18=tipointer6*calinter*pendiente*resdeslizamiento3*infbici3*alumbrado2*distvisual*caninter*gestvelo*infcrucep;
%Severidad igual a tipointer5
%Clasificacion por estrellas para la interseccion
O=tipointer6*calinter*pendiente*resdeslizamiento3*infbici3*alumbrado2*distvisual*caninter*gestvelo*infcrucep*tipointer5*veloperacionbi*flujoy6;
porcicli=x(35);
if porcicli==1
        EstCicl=0;
elseif porcicli==2
        EstCicl=(M+N+O);
elseif porcicli==3
        EstCicl=(M+N+O);   
elseif porcicli==4
        EstCicl=(M+N+O);
elseif porcicli==5
        EstCicl=(M+N+O);      
elseif porcicli==6
        EstCicl=(M+N+O);
elseif porcicli==7
        EstCicl=(M+N+O);       
elseif porcicli==8
        EstCicl=(M+N+O);
elseif porcicli==9
        EstCicl=(M+N+O);        
elseif porcicli==10
        EstCicl=(M+N+O);
elseif porcicli==11
        EstCicl=(M+N+O);
end
if EstCicl>=60
    EstCiclista=1
elseif EstCicl>=30&& EstCicl<60
    EstCiclista=2
elseif EstCicl>=10&& EstCicl<30
    EstCiclista=3;
elseif EstCicl>=5&& EstCicl<10
    EstCiclista=4
elseif EstCicl>0&& EstCicl<5
    EstCiclista=5
elseif EstCicl==0
    EstCiclista=0;
end
%Puntaje total
x19=EstCicl;
%%CALIFICACION DE ESTRELLAS PARA PEATONES
%A lo largo (lado del conductor) 
%Atributo vial (probabilidad)
%Acera-lado de conductor
T22=[0 90;0.075 90;0.09 90;0.1 90;20 90;5 90;6 90];
disp('1 = Barrera fisica')
disp('2 = Separación no física >= 3.0 m')
disp('3 = Separación no física 1.0 m a 3.0 m')
disp('4 = Separación no física 0 m < 1.0 m')
disp('5 = Ninguno')
disp('6 = Camino informal ? 1.0 m')
disp('7 = Camino informal de 0 m a <1.0 m')
aceconducto=x(43);
if aceconducto==1
    for i=1:2
    aceconductor(1,i)=T22(1,i)
    end
end
if aceconducto==2
    for i=1:2
    aceconductor(1,i)=T22(2,i)
    end
end
if aceconducto==3
    for i=1:2
    aceconductor(1,i)=T22(3,i)
    end
end
if aceconducto==4
    for i=1:2
    aceconductor(1,i)=T22(4,i)
    end
end
if aceconducto==5
    for i=1:2
    aceconductor(1,i)=T22(5,i)
    end
end
if aceconducto==6
    for i=1:2
    aceconductor(1,i)=T22(6,i)
    end
end
if aceconducto==7
    for i=1:2
    aceconductor(1,i)=T22(7,i)
    end
end
if aceconducto==1
    aceconductor1=aceconductor(1,1);
elseif aceconducto==2
        aceconductor1=aceconductor(1,1);
elseif aceconducto==3
        aceconductor1=aceconductor(1,1);
elseif aceconducto==4
        aceconductor1=aceconductor(1,1);
elseif aceconducto==5
        aceconductor1=aceconductor(1,1);
elseif aceconducto==6
        aceconductor1=aceconductor(1,1);
elseif aceconducto==7
        aceconductor1=aceconductor(1,1);
end
%Probabilidad
P=aceconductor1*curvatura3*calidadcurva2*distvisual*anchocarril*delineacion*pendiente*estadosuperficie2*gestvelo*estveh*bandasonoraes*resdeslizamiento2*alumbrado2;
if aceconducto==1
    aceconductor2=aceconductor(1,2);
elseif aceconducto==2
        aceconductor2=aceconductor(1,2);
elseif aceconducto==3
        aceconductor2=aceconductor(1,2);
elseif aceconducto==4
        aceconductor2=aceconductor(1,2);
elseif aceconducto==5
        aceconductor2=aceconductor(1,2);
elseif aceconducto==6
        aceconductor2=aceconductor(1,2);
elseif aceconducto==7
        aceconductor2=aceconductor(1,2);
end
%Influencia del flujo externo
%Velocidad de operacion (+10 km/h)
 if veloperaciom==150
        veloperacionpe=1;
 elseif veloperaciom==145
         veloperacionpe=0.97;
 elseif veloperaciom==140
         veloperacionpe=0.93;
 elseif veloperaciom==135
         veloperacionpe=0.9;
 elseif veloperaciom==130
         veloperacionpe=0.87;
 elseif veloperaciom==125
         veloperacionpe=0.83;
 elseif veloperaciom==120
        veloperacionpe=0.8;
 elseif veloperaciom==115
         veloperacionpe=0.77;
 elseif veloperaciom==110
         veloperacionpe=0.73;
 elseif veloperaciom==105
         veloperacionpe=0.7;
 elseif veloperaciom==100
         veloperacionpe=0.67;
 elseif veloperaciom==95
         veloperacionpe=0.63;  
 elseif veloperaciom==90
         veloperacionpe=0.6;
 elseif veloperaciom==85
         veloperacionpe=0.57;
 elseif veloperaciom==80
         veloperacionpe=0.53;
 elseif veloperaciom==75
         veloperacionpe=0.46;
 elseif veloperaciom==70
         veloperacionpe=0.38;
 elseif veloperaciom==65
         veloperacionpe=0.3;
 elseif veloperaciom==60
         veloperacionpe=0.22;
 elseif veloperaciom==55
         veloperacionpe=0.16; 
 elseif veloperaciom==50
         veloperacionpe=0.12; %0.16
 elseif veloperaciom==45
         veloperacionpe=0.08;
 elseif veloperaciom==40
         veloperacionpe=0.05;
 elseif veloperaciom==35
         veloperacionpe=0.03;
 elseif veloperaciom==30
         veloperacionpe=0.01;
 end
%A lo largo (lado del copiloto) 
%Atributo vial (probabilidad)
%Acera-lado de conductor
T22=[0 90;0.075 90;0.09 90;0.1 90;20 90;5 90;6 90];
disp('1 = Barrera fisica')
disp('2 = Separación no física >= 3.0 m')
disp('3 = Separación no física 1.0 m a 3.0 m')
disp('4 = Separación no física 0 m < 1.0 m')
disp('5 = Ninguno')
disp('6 = Camino informal ? 1.0 m')
disp('7 = Camino informal de 0 m a <1.0 m')
acecopilot=x(44);
if acecopilot==1
    for i=1:2
    acecopiloto(1,i)=T22(1,i)
    end
end
if acecopilot==2
    for i=1:2
    acecopiloto(1,i)=T22(2,i)
    end
end
if acecopilot==3
    for i=1:2
    acecopiloto(1,i)=T22(3,i)
    end
end
if acecopilot==4
    for i=1:2
    acecopiloto(1,i)=T22(4,i)
    end
end
if acecopilot==5
    for i=1:2
    acecopiloto(1,i)=T22(5,i)
    end
end
if acecopilot==6
    for i=1:2
    acecopiloto(1,i)=T22(6,i)
    end
end
if acecopilot==7
    for i=1:2
    acecopiloto(1,i)=T22(7,i)
    end
end
if acecopilot==1
    acecopiloto1=acecopiloto(1,1);
elseif acecopilot==2
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==3
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==4
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==5
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==6
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==7
        acecopiloto1=acecopiloto(1,1);
end
%Probabilidad
R=acecopiloto1*curvatura3*calidadcurva2*distvisual*anchocarril*delineacion*pendiente*estadosuperficie2*gestvelo*estveh*bandasonoraes*resdeslizamiento2*alumbrado2;
if aceconducto==1
     acecopiloto2=acecopiloto(1,2);
elseif aceconducto==2
        acecopiloto2=acecopiloto(1,2);
elseif aceconducto==3
        acecopiloto2=acecopiloto(1,2);
elseif aceconducto==4
        acecopiloto2=acecopiloto(1,2);
elseif aceconducto==5
        acecopiloto2=acecopiloto(1,2);
elseif aceconducto==6
        acecopiloto2=acecopiloto(1,2);
elseif aceconducto==7
        acecopiloto2=acecopiloto(1,2);
end
%Cruce peatonal (vía inpseccionada)
%Atributo vial (probabilidad)
%Numero de carriles
if ncarrile==1
    ncarriles3=ncarriles(1,2);
elseif ncarrile==2
        ncarriles3=ncarriles(1,2);
elseif ncarrile==3
        ncarriles3=ncarriles(1,2);
elseif ncarrile==4
        ncarriles3=ncarriles(1,2);        
elseif ncarrile==5
        ncarriles3=ncarriles(1,2);        
elseif ncarrile==6
        ncarriles3=ncarriles(1,2);  
end
if tipomedian==1
 tipomediana5=tipomediana(1,3);
elseif tipomedian==2
 tipomediana5=tipomediana(1,3);
elseif tipomedian==3
 tipomediana5=tipomediana(1,3);
elseif tipomedian==4
 tipomediana5=tipomediana(1,3);
elseif tipomedian==5
 tipomediana5=tipomediana(1,3);
elseif tipomedian==6
 tipomediana5=tipomediana(1,3);
elseif tipomedian==7
 tipomediana5=tipomediana(1,3);
elseif tipomedian==8
 tipomediana5=tipomediana(1,3);
elseif tipomedian==9
 tipomediana5=tipomediana(1,3);
elseif tipomedian==10
 tipomediana5=tipomediana(1,3);
elseif tipomedian==11
 tipomediana5=tipomediana(1,3);
elseif tipomedian==12
 tipomediana5=tipomediana(1,3);
elseif tipomedian==13
 tipomediana5=tipomediana(1,3);
elseif tipomedian==14
 tipomediana5=tipomediana(1,3);
elseif tipomedian==15
 tipomediana5=tipomediana(1,3);
end
%Calidad del cruce peatonal
disp('1 = Adecuado')
disp('2 = Pobre')
disp('3 = No aplica')
calicruc=x(40);
if calicruc==1
    calicruce=1;
elseif calicruc==2
    calicruce=1.5;    
elseif calicruc==3
    calicruce=1;
end
%%Interseccion
if tipointe==1
    tipointer7=tipointer(1,3);
elseif tipointe==2
    tipointer7=tipointer(1,3);
elseif tipointe==3
    tipointer7=tipointer(1,3);
elseif tipointe==4
    tipointer7=tipointer(1,3);
elseif tipointe==5
    tipointer7=tipointer(1,3);
elseif tipointe==6
    tipointer7=tipointer(1,3);
elseif tipointe==7
    tipointer7=tipointer(1,3);
elseif tipointe==8
    tipointer7=tipointer(1,3);
elseif tipointe==9
    tipointer7=tipointer(1,3);
elseif tipointe==10
    tipointer7=tipointer(1,3);
elseif tipointe==11
    tipointer7=tipointer(1,3);
elseif tipointe==12
    tipointer7=tipointer(1,3);
elseif tipointe==13
    tipointer7=tipointer(1,3);
elseif tipointe==14
    tipointer7=tipointer(1,3);
elseif tipointe==15
    tipointer7=tipointer(1,3);
elseif tipointe==16
    tipointer7=tipointer(1,3);
end
%Vallas peatonales
disp('1 = Presente')
disp('2 = Ausente')
valla=x(42);
if valla==1
    vallap=1
elseif valla==2
    vallap=1.25
end
if alumbrad==1
    alumbrado3=alumbrado(1,2);
elseif alumbrad==2
   alumbrado3=alumbrado(1,2);
end
%Numero de carriles
%Probabilidad
x21=ncarriles3*tipomediana5*infcrucep*calicruce*tipointer7*calinter*vallap*resdeslizamiento2*alumbrado3*distvisual*estveh*gestvelo;
%Severidad
infcruceinsp1=90;
%flujoext9=0.03;
%ClasifiCacion por estrellas del cruce peatonal (via inspeccionada)
U=ncarriles3*tipomediana5*infcrucep*calicruce*tipointer7*calinter*vallap*resdeslizamiento2*alumbrado3*distvisual*estveh*gestvelo*flujoy8*veloperacionpe*infcruceinsp1;
%Cruce peatonal (vía lateral)
%Via Inspeccionada
infcrucepelat=x(41)
if infcrucepelat==1 && supescolar==3
    infcrucepela=0.4;
elseif infcrucepelat==2 && supescolar==3
    infcrucepela=1;
elseif infcrucepelat==3 && supescolar==3
    infcrucepela=1.25;
elseif infcrucepelat==4 && supescolar==3
    infcrucepela=3.8;
elseif infcrucepelat==5 && supescolar==3
    infcrucepela=4.8;
elseif infcrucepelat==6 && supescolar==3
    infcrucepela=5.1;
elseif infcrucepelat==7 && supescolar==3
    infcrucepela=6.7;        
elseif infcrucepelat==8 && supescolar==3
    infcrucepela=2.5;    
elseif infcrucepelat==9 && supescolar==3
    infcrucepela=3.2;   
elseif infcrucepelat==10 && supescolar==3
    infcrucepela=3.4;    
elseif infcrucepelat==11 && supescolar==3
    infcrucepela=4.5;    
end
if infcrucepelat==1 && supescolar==1
    infcrucepela=0.3;
elseif infcrucepelat==2 && supescolar==1
    infcrucepela=0.95;
elseif infcrucepelat==3 && supescolar==1
    infcrucepela=1.2;
elseif infcrucepelat==4 && supescolar==1
    infcrucepela=1;
elseif infcrucepelat==5 && supescolar==1
    infcrucepela=1.25;
elseif infcrucepelat==6 && supescolar==1
    infcrucepela=3.8;
elseif infcrucepelat==7 && supescolar==1
    infcrucepela=4.8;        
elseif infcrucepelat==8 && supescolar==1
    infcrucepela=1;    
elseif infcrucepelat==9 && supescolar==1
    infcrucepela=1;   
elseif infcrucepelat==10 && supescolar==1
    infcrucepela=2.5;    
elseif infcrucepelat==11 && supescolar==1
    infcrucepela=3.2;    
end
if infcrucepelat==1 && supescolar==2
    infcrucepela=0.4;
elseif infcrucepelat==2 && supescolar==2
    infcrucepela=1;
elseif infcrucepelat==3 && supescolar==2
    infcrucepela=1.25;
elseif infcrucepelat==4 && supescolar==2
    infcrucepela=3.8;
elseif infcrucepelat==5 && supescolar==2
    infcrucepela=4.8;
elseif infcrucepelat==6 && supescolar==2
    infcrucepela=5.1;
elseif infcrucepelat==7 && supescolar==2
    infcrucepela=6.7;        
elseif infcrucepelat==8 && supescolar==2
    infcrucepela=2.5;    
elseif infcrucepelat==9 && supescolar==2
    infcrucepela=3.2;   
elseif infcrucepelat==10 && supescolar==2
    infcrucepela=3.4;    
elseif infcrucepelat==11 && supescolar==2
    infcrucepela=4.5;    
end
%Atributo vial (probabilidad)
%Numero de carriles
if tipomedian==1
 tipomediana6=tipomediana(1,3);
elseif tipomedian==2
 tipomediana6=tipomediana(1,3);
elseif tipomedian==3
 tipomediana6=tipomediana(1,3);
elseif tipomedian==4
 tipomediana6=tipomediana(1,3);
elseif tipomedian==5
 tipomediana6=tipomediana(1,3);
elseif tipomedian==6
 tipomediana6=tipomediana(1,3);
elseif tipomedian==7
 tipomediana6=tipomediana(1,3);
elseif tipomedian==8
 tipomediana6=tipomediana(1,3);
elseif tipomedian==9
 tipomediana6=tipomediana(1,3);
elseif tipomedian==10
 tipomediana6=tipomediana(1,3);
elseif tipomedian==11
 tipomediana6=tipomediana(1,3);
elseif tipomedian==12
 tipomediana6=tipomediana(1,3);
elseif tipomedian==13
 tipomediana6=tipomediana(1,3);
elseif tipomedian==14
 tipomediana6=tipomediana(1,3);
elseif tipomedian==15
 tipomediana6=tipomediana(1,3);
end
%Interseccion
%Probabilidad
x22=ncarriles3*tipomediana6*infcrucepela*calicruce*tipointer7*calinter*vallap*resdeslizamiento2*alumbrado3*distvisual*estveh*gestvelo;
%Severidad
%infcruceinsp1at=0.02;
%Infraestructura para cruce peatonal 
%Clasificacion por estrellas del cruce peatonal (via lateral) %flujoy6
V=ncarriles3*tipomediana6*infcrucepela*calicruce*tipointer7*calinter*vallap*resdeslizamiento2*alumbrado3*distvisual*estveh*gestvelo*infcruceinsp1*flujoy9*veloperacionpe;
%Flujo peatonal en hora pico cruzando la Carretera 
%Flujo peatonal en hora pico a lo largo de la carretera (lado del conductor)
%Flujo peatonal en hora pico a lo largo de la carretera (lado del conductor)
%Los anteriores tres se junta para realizar combinaciones y brindar el
%puntaje total
porpeatoncru=x(32);
porpeatoncon=x(33);
porpeatoncopi=x(34);
%Y es Clasificacion por estrellas a lo largo (lado del conductor)
Y=veloperacionpe*flujoy8*aceconductor2*P;
%S es Clasificacion por estrellas a lo largo (lado del copiloto)
S=veloperacionpe*flujoy8*acecopiloto2*R;
%T es el Promedio entre A lo largo (conductor) y A lo largo (copiloto)
T=(S+Y)/2;                          
x24=T;
%Z es el resultado
if porpeatoncru==1 && porpeatoncon==1 && porpeatoncopi==1 %sin peatones
    Z=0;
elseif porpeatoncru==1 && porpeatoncon>=2 && porpeatoncopi==1 %Fact sheet 9 = A lo largo conductor
    Z=Y;
elseif porpeatoncru==1 && porpeatoncon>=2 && porpeatoncopi>=2 %Fact sheet 9 = %T Promedio
    Z=T;
elseif porpeatoncru==1 && porpeatoncon==1 && porpeatoncopi>= 2 %Fact sheet 9 = A lo largo copiloto
    Z=S;
elseif porpeatoncru>=2 && porpeatoncon==1 && porpeatoncopi==1 %Fact sheet 9 = Cruce peatonal(inspecccionada) + Cruce peatonal (lateral)
    Z=U+V;
elseif porpeatoncru>=2 && porpeatoncon>=2 && porpeatoncopi==1 %Fact sheet 9 = A lo largo conductor + Cruce peatonal(inspecccionada) + Cruce peatonal (lateral)
    Z=Y+V+U;
elseif porpeatoncru>=2 && porpeatoncon==1 && porpeatoncopi>=2 %Fact sheet 9 = A lo largo copiloto + Cruce peatonal(inspecccionada) + Cruce peatonal (lateral)
    Z=S+V+U;
elseif porpeatoncru>=2 && porpeatoncon>=2 && porpeatoncopi>=2 %Suma todos pero promedio entre Conductor y copiloto Fact sheet 9 = A lo largo conductor + A lo largo copiloto + Cruce peatonal(inspecccionada) + Cruce peatonal (lateral)
    Z=T+V+U;
end
%Advertencia de zona escolar
%zonaescolar=input('ingresar zona escolar')
zonaescolar=x(47)
if zonaescolar==1
    zonaescola=0.90;
elseif zonaescolar==2
        zonaescola=0.95;
elseif zonaescolar==3
        zonaescola=1;        
elseif zonaescolar==4
        zonaescola=1;
end
%Total de estrellas en peatones
EstPeato=Z*zonaescola;
if porpeatoncru==1 && porpeatoncon==1 && porpeatoncopi==1 && EstPeato==0 %sin peatones
    EstPeaton=0;
end

if porpeatoncru==1 && porpeatoncon>=2 && porpeatoncopi==1 %A lo largo
if EstPeato>=15
    EstPeaton=1;
elseif EstPeato>=7.5 && EstPeato<15
    EstPeaton=2;
elseif EstPeato>=1 && EstPeato<7.5
    EstPeaton=3;
elseif EstPeato>=0.2 && EstPeato<1
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<0.2
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
end
end

if porpeatoncru==1 && porpeatoncon>=2 && porpeatoncopi>=2 %A lo largo
if EstPeato>=15
    EstPeaton=1;
elseif EstPeato>=7.5 && EstPeato<15
    EstPeaton=2;
elseif EstPeato>=1 && EstPeato<7.5
    EstPeaton=3;
elseif EstPeato>=0.2 && EstPeato<1
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<0.2
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
end
end

if porpeatoncru==1 && porpeatoncon==1 && porpeatoncopi>= 2 %A lo largo
if EstPeato>=15
    EstPeaton=1;
elseif EstPeato>=7.5 && EstPeato<15
    EstPeaton=2;
elseif EstPeato>=1 && EstPeato<7.5
    EstPeaton=3;
elseif EstPeato>=0.2 && EstPeato<1
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<0.2
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
end
end
    
if porpeatoncru>=2 && porpeatoncon==1 && porpeatoncopi==1 %Cruce
if EstPeato>=75
    EstPeaton=1;
elseif EstPeato>=32.5 && EstPeato<75
    EstPeaton=2;
elseif EstPeato>=14 && EstPeato<32.5
    EstPeaton=3;
elseif EstPeato>=4.8 && EstPeato<14
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<4.8
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
end
end
    
if porpeatoncru>=2 && porpeatoncon>=2 && porpeatoncopi==1 %Total
    if EstPeato>=90
    EstPeaton=1;
elseif EstPeato>=40 && EstPeato<90
    EstPeaton=2;
elseif EstPeato>=15 && EstPeato<40
    EstPeaton=3;
elseif EstPeato>=5 && EstPeato<15
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<5
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
    end
end

if porpeatoncru>=2 && porpeatoncon==1 && porpeatoncopi>=2 %Total
    if EstPeato>=90
    EstPeaton=1;
elseif EstPeato>=40 && EstPeato<90
    EstPeaton=2;
elseif EstPeato>=15 && EstPeato<40
    EstPeaton=3;
elseif EstPeato>=5 && EstPeato<15
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<5
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
    end
end

if porpeatoncru>=2 && porpeatoncon>=2 && porpeatoncopi>=2 %Total
    if EstPeato>=90
    EstPeaton=1;
elseif EstPeato>=40 && EstPeato<90
    EstPeaton=2;
elseif EstPeato>=15 && EstPeato<40
    EstPeaton=3;
elseif EstPeato>=5 && EstPeato<15
    EstPeaton=4;
elseif EstPeato>0 && EstPeato<5
    EstPeaton=5;
elseif EstPeato==0
    EstPeaton=0;
    end
end
%Puntuacion total
x23=EstPeato;
%COEFICIENTES PARA VEHICULO
%Salida del camino (lado del conductor) Coeficientes1
cosalidaconductorveh=zeros(1,17);
cosalidaconductorveh(1)=anchocarril;
cosalidaconductorveh(2)=curvatura2;
cosalidaconductorveh(3)=calidadcurva2;
cosalidaconductorveh(4)=delineacion;
cosalidaconductorveh(5)=bandasonoraes;
cosalidaconductorveh(6)=estadosuperficie2;
cosalidaconductorveh(7)=pendiente;
cosalidaconductorveh(8)=resdeslizamiento2;
cosalidaconductorveh(9)=distconductor2;
cosalidaconductorveh(10)=objconductor2;
cosalidaconductorveh(11)=anchoespaldon2;
cosalidaconductorveh(12)=flujoy1;
cosalidaconductorveh(13)=transitabilida;
cosalidaconductorveh(14)=veloperacion;
cosalidaconductorveh(15)=x1;
cosalidaconductorveh(16)=x2;
cosalidaconductorveh(17)=A;
%cosalidaconductorveh=[anchocarril,curvatura2,calidadcurva2,delineacion,bandasonoraes,estadosuperficie2,pendiente,resdeslizamiento2,distconductor2,objconductor2,anchoespaldon2,flujoext,transitabilida,veloperacion,A];
%Salida del camino (lado del copiloto) Coeficientes2
cosalidacopilotoveh=zeros(1,16);
cosalidacopilotoveh(1)=anchocarril;
cosalidacopilotoveh(2)=curvatura2;
cosalidacopilotoveh(3)=calidadcurva2;
cosalidacopilotoveh(4)=delineacion;
cosalidacopilotoveh(5)=bandasonoraes;
cosalidacopilotoveh(6)=estadosuperficie2;
cosalidacopilotoveh(7)=pendiente;
cosalidacopilotoveh(8)=resdeslizamiento2;
cosalidacopilotoveh(9)=distcopiloto2;
cosalidacopilotoveh(10)=objcopiloto2;
cosalidacopilotoveh(11)=anchoespaldoncop2;
cosalidacopilotoveh(12)=flujoy1;
cosalidacopilotoveh(13)=veloperacion;
cosalidacopilotoveh(14)=x1;
cosalidacopilotoveh(15)=x3;
cosalidacopilotoveh(16)=B;
%cosalidacopilotoveh=[anchocarril,curvatura2,calidadcurva2,delineacion,bandasonoraes,estadosuperficie2,pendiente,resdeslizamiento2,distcopiloto2,objcopiloto2,anchoespaldoncop2,flujoext,veloperacion,B];
%Choque Frontal (perdida del control) Coeficientes3
coperdidacontrolveh=zeros(1,14);
coperdidacontrolveh(1)=anchocarril;
coperdidacontrolveh(2)=curvatura2;
coperdidacontrolveh(3)=calidadcurva2;
coperdidacontrolveh(4)=delineacion;
coperdidacontrolveh(5)=bandassonoras;
coperdidacontrolveh(6)=estadosuperficie2;
coperdidacontrolveh(7)=pendiente;
coperdidacontrolveh(8)=resdeslizamiento2;
coperdidacontrolveh(9)=tipomediana2;
coperdidacontrolveh(10)=flujoy2;
coperdidacontrolveh(11)=transitabilida;
coperdidacontrolveh(12)=veloperacion1;
coperdidacontrolveh(13)=x4;
coperdidacontrolveh(14)=C;
%coperdidacontrolveh=[anchocarril,curvatura2,calidadcurva2,delineacion,bandassonoras,estadosuperficie2,pendiente,resdeslizamiento2,tipomediana2,flujoext1,transitabilida,veloperacion1,C];
%Choque Frontal (adelantamiento) Coeficientes4
coadelantamientoveh=zeros(1,9);
coadelantamientoveh(1)=pendiente;
coadelantamientoveh(2)=resdeslizamiento2;
coadelantamientoveh(3)=velodiferencial;
coadelantamientoveh(4)=ncarriles2;
coadelantamientoveh(5)=tipomediana3;
coadelantamientoveh(6)=flujoy3;
coadelantamientoveh(7)=veloperacion1;
coadelantamientoveh(8)=x5;
coadelantamientoveh(9)=D;
%coadelantamientoveh=[pendiente,resdeslizamiento2,velodiferencial,ncarriles2,tipomediana3,cero,veloperacion1,D];
%Interseccion Coeficientes5
cointerseccionveh=zeros(1,13);
cointerseccionveh(1)=tipointer2;
cointerseccionveh(2)=calinter;
cointerseccionveh(3)=pendiente;
cointerseccionveh(4)=alumbrado1;
cointerseccionveh(5)=resdeslizamiento2;
cointerseccionveh(6)=distvisual;
cointerseccionveh(7)=caninter;
cointerseccionveh(8)=gestvelo;
cointerseccionveh(9)=tipointer3;
cointerseccionveh(10)=flujoy4;
cointerseccionveh(11)=veloperacion1;
cointerseccionveh(12)=x6;
cointerseccionveh(13)=E;
%cointerseccionveh=[tipointer2,calinter,pendiente,alumbrado1,resdeslizamiento2,distvisual,caninter,gestvelo,tipointer3,volinter,veloperacion1,E];
%Acceso a propiedades Coeficientes6
coaccesopropiedadesveh=zeros(1,9);
coaccesopropiedadesveh(1)=puntacceso1;
coaccesopropiedadesveh(2)=tipomediana4;
coaccesopropiedadesveh(3)=vacceso;
coaccesopropiedadesveh(4)=puntacceso2;
coaccesopropiedadesveh(5)=flujopre;
coaccesopropiedadesveh(6)=veloperacion1;
coaccesopropiedadesveh(7)=x7;
coaccesopropiedadesveh(8)=F;
coaccesopropiedadesveh(9)=x8;
%coaccesopropiedadesveh=[puntacceso1,tipomediana4,vacceso,puntacceso2,flujopre,veloperacion1,F];
%copropiedadesveh=double(coaccesopropiedadesveh);

%COEFICIENTES PARA MOTOCICLETAS
%Salida del camino (lado del conductor) Coeficientes1
cosalidaconductormot=zeros(1,17);
cosalidaconductormot(1)=anchocarril;
cosalidaconductormot(2)=curvatura3;
cosalidaconductormot(3)=calidadcurva3;
cosalidaconductormot(4)=delineacion;
cosalidaconductormot(5)=bandasonoraes;
cosalidaconductormot(6)=estadosuperficie3;
cosalidaconductormot(7)=pendiente;
cosalidaconductormot(8)=resdeslizamiento3;
cosalidaconductormot(9)=distconductor3;
cosalidaconductormot(10)=objconductor3;
cosalidaconductormot(11)=anchoespaldon3;
cosalidaconductormot(12)=flujoy1;
cosalidaconductormot(13)=transitabilida;
cosalidaconductormot(14)=veloperacion;
cosalidaconductormot(15)=x9;
cosalidaconductormot(16)=x10;
cosalidaconductormot(17)=G;
%cosalidaconductormot=[anchocarril,curvatura3,calidadcurva3,delineacion,bandasonoraes,estadosuperficie3,pendiente,resdeslizamiento3,distconductor3,objconductor3,anchoespaldon3,flujoext,transitabilida,veloperacion,G];
%Salida del camino (lado del copiloto) Coeficientes2
cosalidacopilotomot=zeros(1,16);
cosalidacopilotomot(1)=anchocarril;
cosalidacopilotomot(2)=curvatura3;
cosalidacopilotomot(3)=calidadcurva3;
cosalidacopilotomot(4)=delineacion;
cosalidacopilotomot(5)=bandasonoraes;
cosalidacopilotomot(6)=estadosuperficie3;
cosalidacopilotomot(7)=pendiente;
cosalidacopilotomot(8)=resdeslizamiento3;
cosalidacopilotomot(9)=distcopiloto3;
cosalidacopilotomot(10)=objcopiloto3;
cosalidacopilotomot(11)=anchoespaldoncop3;
cosalidacopilotomot(12)=flujoy1;
cosalidacopilotomot(13)=veloperacion;
cosalidacopilotomot(14)=x9;
cosalidacopilotomot(15)=x11;
cosalidacopilotomot(16)=H;
%cosalidacopilotomot=[anchocarril,curvatura3,calidadcurva3,delineacion,bandasonoraes,estadosuperficie3,pendiente,resdeslizamiento3,distcopiloto3,objcopiloto3,anchoespaldoncop3,flujoext,veloperacion,H];
%Choque Frontal (perdida del control) Coeficientes3
coperdidacontrolmot=zeros(1,14);
coperdidacontrolmot(1)=anchocarril;
coperdidacontrolmot(2)=curvatura3;
coperdidacontrolmot(3)=calidadcurva3;
coperdidacontrolmot(4)=delineacion;
coperdidacontrolmot(5)=bandassonoras;
coperdidacontrolmot(6)=estadosuperficie3;
coperdidacontrolmot(7)=pendiente;
coperdidacontrolmot(8)=resdeslizamiento3;
coperdidacontrolmot(9)=tipomediana2;
coperdidacontrolmot(10)=flujoy2;
coperdidacontrolmot(11)=transitabilida;
coperdidacontrolmot(12)=veloperacion1;
coperdidacontrolmot(13)=x12;
coperdidacontrolmot(14)=I;
%coperdidacontrolmot=[anchocarril,curvatura3,calidadcurva3,delineacion,bandassonoras,estadosuperficie3,pendiente,resdeslizamiento3,tipomediana2,flujoext1,transitabilida,veloperacion1,I];
%Choque Frontal (adelantamiento) Coeficientes4
coadelantamientomot=zeros(1,9);
coadelantamientomot(1)=pendiente;
coadelantamientomot(2)=resdeslizamiento3;
coadelantamientomot(3)=velodiferencial;
coadelantamientomot(4)=ncarriles2;
coadelantamientomot(5)=tipomediana3;
coadelantamientomot(6)=flujoy3;
coadelantamientomot(7)=veloperacion1;
coadelantamientomot(8)=x13;
coadelantamientomot(9)=J;
%coadelantamientomot=[pendiente,resdeslizamiento3,velodiferencial,ncarriles2,tipomediana3,cero,veloperacion1,J];
%Interseccion Coeficientes5
cointerseccionmot=zeros(1,13);
cointerseccionmot(1)=tipointer4;
cointerseccionmot(2)=calinter;
cointerseccionmot(3)=pendiente;
cointerseccionmot(4)=alumbrado1;
cointerseccionmot(5)=resdeslizamiento3;
cointerseccionmot(6)=distvisual;
cointerseccionmot(7)=caninter;
cointerseccionmot(8)=gestvelo;
cointerseccionmot(9)=tipointer5;
cointerseccionmot(10)=flujoy4;
cointerseccionmot(11)=veloperacion1;
cointerseccionmot(12)=x14;
cointerseccionmot(13)=K;
%cointerseccionmot=[tipointer4,calinter,pendiente,alumbrado1,resdeslizamiento3,distvisual,caninter,gestvelo,tipointer5,volinter2,veloperacion1,K];
%Acceso a propiedades Coeficientes6
coaccesopropiedadesmot=zeros(1,7);
coaccesopropiedadesmot(1)=puntacceso1;
coaccesopropiedadesmot(2)=vacceso;
coaccesopropiedadesmot(3)=puntacceso2;
coaccesopropiedadesmot(4)=flujopre;
coaccesopropiedadesmot(5)=veloperacion1;
coaccesopropiedadesmot(6)=x15;
coaccesopropiedadesmot(7)=ZX;
%coaccesopropiedadesmot=[puntacceso1,vacceso,puntacceso2,flujopre,veloperacion1,ZX];
%copropiedadesmot=double(coaccesopropiedadesmot);
%A lo largo Coeficientes7
colargomot=zeros(1,6);
colargomot(1)=infmoto1;
colargomot(2)=infmoto2;
colargomot(3)=flujoy7;
colargomot(4)=veloperacion1;
colargomot(5)=L;
colargomot(6)=x16;
%colargomot=[infmoto1,infmoto2,flujoy7,veloperacion1,L];

%COEFICIENTES PARA CICLISTAS
%A lo largo Coeficientes1
colargoci=zeros(1,18);
colargoci(1)=infbici1;
colargoci(2)=curvatura2;
colargoci(3)=calidadcurva3;
colargoci(4)=distvisual;
colargoci(5)=anchocarril;
colargoci(6)=delineacion;
colargoci(7)=pendiente;
colargoci(8)=estadosuperficie2;
colargoci(9)=gestvelo;
colargoci(10)=bandasonoraes;
colargoci(11)=estveh;
colargoci(12)=resdeslizamiento3;
colargoci(13)=alumbrado2;
colargoci(14)=infbici2;
colargoci(15)=flujoy5;
colargoci(16)=veloperacionbi;
colargoci(17)=x17;
colargoci(18)=M;
%colargoci=[infbici1,curvatura2,calidadcurva3,distvisual,anchocarril,delineacion,pendiente,estadosuperficie2,gestvelo,bandasonoraes,estveh,resdeslizamiento3,alumbrado2,infbici2,flujoext5,veloperacionbi,M];
%Salida del camino  Coeficientes2
cosalidaci=zeros(1,17);
cosalidaci(1)=anchocarril;
cosalidaci(2)=curvatura2;
cosalidaci(3)=calidadcurva3;
cosalidaci(4)=delineacion;
cosalidaci(5)=alumbrado2;
cosalidaci(6)=estadosuperficie5;
cosalidaci(7)=pendiente;
cosalidaci(8)=resdeslizamiento3;
cosalidaci(9)=distconductor4;
cosalidaci(10)=objconductor4;
cosalidaci(11)=distcopiloto4;
cosalidaci(12)=objcopiloto4;
cosalidaci(13)=flujoy5;
cosalidaci(14)=veloperacionbi;
cosalidaci(15)=x20;
cosalidaci(16)=W;
cosalidaci(17)=N;
%cosalidaci=[anchocarril,curvatura2,calidadcurva3,delineacion,alumbrado2,estadosuperficie5,pendiente,resdeslizamiento3,distconductor4,objconductor4,distcopiloto4,objcopiloto4,flujoext5,veloperacionbi,N];
%Interseccion Coeficientes3
cointerseccionci=zeros(1,16);
cointerseccionci(1)=tipointer6;
cointerseccionci(2)=calinter;
cointerseccionci(3)=pendiente;
cointerseccionci(4)=resdeslizamiento3;
cointerseccionci(5)=infbici3;
cointerseccionci(6)=alumbrado2;
cointerseccionci(7)=distvisual;
cointerseccionci(8)=caninter;
cointerseccionci(9)=gestvelo;
cointerseccionci(10)=infcrucep;
cointerseccionci(11)=tipointer5;
cointerseccionci(12)=flujoy6;
cointerseccionci(13)=veloperacionbi;
cointerseccionci(14)=x18;
cointerseccionci(15)=O;
cointerseccionci(16)=x19;
%cointerseccionci=[tipointer6,calinter,pendiente,resdeslizamiento3,infbici3,alumbrado2,distvisual,caninter,gestvelo,infcrucep,tipointer5,volinter3,veloperacionbi,O];

%COEFICIENTES PARA PEATONES
%A lo largo (lado del conductor) Coeficientes1
colargoconpe=zeros(1,18);
colargoconpe(1)=aceconductor1;
colargoconpe(2)=curvatura3;
colargoconpe(3)=calidadcurva2;
colargoconpe(4)=distvisual;
colargoconpe(5)=anchocarril;
colargoconpe(6)=delineacion;
colargoconpe(7)=pendiente;
colargoconpe(8)=estadosuperficie2;
colargoconpe(9)=gestvelo;
colargoconpe(10)=estveh;
colargoconpe(11)=bandasonoraes;
colargoconpe(12)=resdeslizamiento2;
colargoconpe(13)=alumbrado3;
colargoconpe(14)=aceconductor2;
colargoconpe(15)=flujoy8;
colargoconpe(16)=veloperacionpe;
colargoconpe(17)=P;
colargoconpe(18)=Y;
%colargoci=[infbici1,curvatura2,calidadcurva3,distvisual,anchocarril,delineacion,pendiente,estadosuperficie2,gestvelo,bandasonoraes,estveh,resdeslizamiento3,alumbrado2,infbici2,flujoext5,veloperacionbi,M];
%A lo largo (lado del copiloto) Coeficientes2
colargocoppe=zeros(1,18);
colargocoppe(1)=acecopiloto1;
colargocoppe(2)=curvatura3;
colargocoppe(3)=calidadcurva2;
colargocoppe(4)=distvisual;
colargocoppe(5)=anchocarril;
colargocoppe(6)=delineacion;
colargocoppe(7)=pendiente;
colargocoppe(8)=estadosuperficie2;
colargocoppe(9)=gestvelo;
colargocoppe(10)=estveh;
colargocoppe(11)=bandasonoraes;
colargocoppe(12)=resdeslizamiento2;
colargocoppe(13)=alumbrado3;
colargocoppe(14)=acecopiloto2;
colargocoppe(15)=flujoy8;
colargocoppe(16)=veloperacionpe;
colargocoppe(17)=R;
colargocoppe(18)=S;
%Cruce peatonal (via inspecionada) Coeficientes3
coinsppe=zeros(1,17);
coinsppe(1)=ncarriles3;
coinsppe(2)=tipomediana5;
coinsppe(3)=infcrucep;
coinsppe(4)=calicruce;
coinsppe(5)=tipointer7;
coinsppe(6)=calinter;
coinsppe(7)=vallap;
coinsppe(8)=resdeslizamiento2;
coinsppe(9)=alumbrado3;
coinsppe(10)=distvisual;
coinsppe(11)=estveh;
coinsppe(12)=gestvelo;
coinsppe(13)=infcruceinsp1;
coinsppe(14)=flujoy8;
coinsppe(15)=veloperacionpe;
coinsppe(16)=x21;
coinsppe(17)=U;
%cointerseccionci=[tipointer6,calinter,pendiente,resdeslizamiento3,infbici3,alumbrado2,distvisual,caninter,gestvelo,infcrucep,tipointer5,volinter3,veloperacionbi,O];
%Cruce peatonal (via lateral) Coeficientes4
colatpe=zeros(1,19);
colatpe(1)=ncarriles3;
colatpe(2)=tipomediana6;
colatpe(3)=infcrucepela;
colatpe(4)=calicruce;
colatpe(5)=tipointer7;
colatpe(6)=calinter;
colatpe(7)=vallap;
colatpe(8)=resdeslizamiento2;
colatpe(9)=alumbrado3;
colatpe(10)=distvisual;
colatpe(11)=estveh;
colatpe(12)=gestvelo;
colatpe(13)=infcruceinsp1;
colatpe(14)=flujoy9;
colatpe(15)=veloperacionpe;
colatpe(16)=x22;
colatpe(17)=V;
colatpe(18)=x23;
colatpe(19)=x24;
%colargoconpe,colargocoppe,coinsppe,colatpe,
end