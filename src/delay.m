function d = delay(t,y)

   Ncyl=4; %number of engine's cylinders
   theta=180-40; %timi mesa sta oria
   
   d=zeros(2,1);
   
   d(1)=30/(Ncyl*y(2));
   d(2)=(theta/720)*(120/(Ncyl*y(2)))+d(1);
   
end     