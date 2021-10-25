
function [D,P,D01,P01,D02,P02,D03,P03,D1,P1,D2,P2,D3,P3,D4,P4,D5,P5,D6,P6,D7,P7,D8,P8,D9,P9,D10,P10,D11,P11,D12,P12,D13,P13,D14,P14,D15,P15,D16,P16,D17,P17,D18,P18,D19,P19,D20,P20] = Usuarios(Y)
%Ocupante del vehículo
S=find(Y.Ocupante_del_vehiculo==0);
D=(1/1000)*sum(Y.Distancia(S));
P=(D*100)/(1/1000*sum(Y.Distancia));

S1=find(Y.Ocupante_del_vehiculo==1);
D1=(1/1000)*sum(Y.Distancia(S1));
P1=(D1*100)/(1/1000*sum(Y.Distancia));

S2=find(Y.Ocupante_del_vehiculo==2);
D2=(1/1000)*sum(Y.Distancia(S2));
P2=(D2*100)/(1/1000*sum(Y.Distancia));            

S3=find(Y.Ocupante_del_vehiculo==3);
D3=(1/1000)*sum(Y.Distancia(S3));
P3=(D3*100)/(1/1000*sum(Y.Distancia));
            
S4=find(Y.Ocupante_del_vehiculo==4);
D4=(1/1000)*sum(Y.Distancia(S4));
P4=(D4*100)/(1/1000*sum(Y.Distancia));
  
S5=find(Y.Ocupante_del_vehiculo==5);
D5=(1/1000)*sum(Y.Distancia(S5));
P5=(D5*100)/(1/1000*sum(Y.Distancia));
            
%Motociclista
S01=find(Y.Motociclista==0);
D01=(1/1000)*sum(Y.Distancia(S01));
P01=(D01*100)/(1/1000*sum(Y.Distancia));

S6=find(Y.Motociclista==1);
D6=(1/1000)*sum(Y.Distancia(S6));
P6=(D6*100)/(1/1000*sum(Y.Distancia));

S7=find(Y.Motociclista==2);
D7=(1/1000)*sum(Y.Distancia(S7));
P7=(D7*100)/(1/1000*sum(Y.Distancia));            

S8=find(Y.Motociclista==3);
D8=(1/1000)*sum(Y.Distancia(S8));
P8=(D8*100)/(1/1000*sum(Y.Distancia));

S9=find(Y.Motociclista==4);
D9=(1/1000)*sum(Y.Distancia(S9));
P9=(D9*100)/(1/1000*sum(Y.Distancia));

S10=find(Y.Motociclista==5);
D10=(1/1000)*sum(Y.Distancia(S10));
P10=(D10*100)/(1/1000*sum(Y.Distancia));

%Ciclista
S02=find(Y.Ciclista==0);
D02=(1/1000)*sum(Y.Distancia(S02));
P02=(D02*100)/(1/1000*sum(Y.Distancia));

S11=find(Y.Ciclista==1);
D11=(1/1000)*sum(Y.Distancia(S11));
P11=(D11*100)/(1/1000*sum(Y.Distancia));

S12=find(Y.Ciclista==2);
D12=(1/1000)*sum(Y.Distancia(S12));
P12=(D12*100)/(1/1000*sum(Y.Distancia));            
            
S13=find(Y.Ciclista==3);
D13=(1/1000)*sum(Y.Distancia(S13));
P13=(D13*100)/(1/1000*sum(Y.Distancia));
            
S14=find(Y.Ciclista==4);
D14=(1/1000)*sum(Y.Distancia(S14));
P14=(D14*100)/(1/1000*sum(Y.Distancia));
  
S15=find(Y.Ciclista==5);
D15=(1/1000)*sum(Y.Distancia(S15));
P15=(D15*100)/(1/1000*sum(Y.Distancia));
            
%Peatón
S03=find(Y.Peaton==0);
D03=(1/1000)*sum(Y.Distancia(S03));
P03=(D03*100)/(1/1000*sum(Y.Distancia));

S16=find(Y.Peaton==1);
D16=(1/1000)*sum(Y.Distancia(S16));
P16=(D16*100)/(1/1000*sum(Y.Distancia));

S17=find(Y.Peaton==2);
D17=(1/1000)*sum(Y.Distancia(S17));
P17=(D17*100)/(1/1000*sum(Y.Distancia));            
            
S18=find(Y.Peaton==3);
D18=(1/1000)*sum(Y.Distancia(S18));
P18=(D18*100)/(1/1000*sum(Y.Distancia));
            
S19=find(Y.Peaton==4);
D19=(1/1000)*sum(Y.Distancia(S19));
P19=(D19*100)/(1/1000*sum(Y.Distancia));
  
S20=find(Y.Peaton==5);
D20=(1/1000)*sum(Y.Distancia(S20));
P20=(D20*100)/(1/1000*sum(Y.Distancia));
          
end
       