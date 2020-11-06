function v = dydt(t,y,Z,mfidot,a) 
%to sustima diaforikwn H1 comment line
    ylag1 = Z(:,1);
    ylag2 = Z(:,2);
    v = zeros(5,1);
    
    mfi2dot=0.0; %tyxaia timi
    %a=40;        
    a0=5.4;      %closed throttle angle
    
    %if t<3
     %   a=a0;
    %else
     %   a=40;
    %end
    
    
    v(1) = 1438.268793*(-0.012019775*(0.952*y(1)-0.0793)*y(2) ...
        +(7.32*1.013/sqrt(297))*((1-1*cosd(a0+0.4087*a))*b2pr(y(1))));
    
    v(2) = (-1/(5.26379*y(2)))*(y(2)*(1.673+0.272*y(2)+0.0135*(y(2)^2))...
        +y(2)*(-0.969+0.206*y(2))*y(1)+0.22*(y(2)^3))+(1/(5.26379*y(2)))*...
        43000*Ni(y(1),y(2),y(4))*ylag1(3); 
    
    v(3) = (1-0.1-8.89*(10^-3)*a)*mfi2dot+(0.1+8.89*(10^-3)*a)*mfidot-y(5); 
    %v(3)=m2dotf
    
    v(4) = (1/0.01)*(-y(4)+(0.012019775*(0.952*ylag2(1)-0.0793)*ylag2(2))...
        /(14.86*ylag2(3)));
    
    v(5)= -y(5)+(0.1+8.89*(10^-3)*a)*mfidot; %v(5)= m2dotff
    
end


function [ b2 ] = b2pr ( y1 ) % gia tin prwti diaforiki

    if ( (y1/1.013) < 0.4125 )
        b2= 1;
    else
        b2= (1/0.7404)*sqrt((y1/1.013)^0.4404-(y1/1.013)^2.3143);
    end

end


function [ f ] = Ni( y1, y2, y4 ) % gia tin deuteri diaforiki

    n1=0.558*(1-0.392*(y2^-0.360));
    
    n2=0.9301+0.2154*y1-0.1657*(y1^2);
    
    function [ n3 ] = a( y4 )

        if (y4 > 1 )
            n3=-0.0205+1.741*y4-0.745*(y4^2);
        else
            n3=-1.299+3.599*y4-1.332*(y4^2);
        end

    end
    %den exw valei to n4 pou einai sunartisi tou ignition advance pou gia
    %mas dn einai eisodos
    f=n1*n2*a(y4);
end
