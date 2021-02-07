%% halfwidth/debljina

for i = 1 : length(y_gornjaka_sto_dvjesto)
   
%     if 
%         y_donjaka_sto_dvjesto(i)<1;
      h(i)=(y_gornjaka_sto_dvjesto(i)-y_donjaka_sto_dvjesto(i))/2; 
%     
%     else
%     
%     h(i)=(y_gornjaka_sto_dvjesto(i)-y_donjaka_sto_dvjesto(i))/2;
%     
%     end
end
% x_h =linspace(1,4580,length(h));
bar(x_gornjaka_sto_dvjesto,h,20); hold on, grid on, axis equal
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto);
legend('raspored halfwidth','gornjaka','donjaka');

%% promjena debljine, dh/dx  //Alfax
figure;
for i = 1 : length(x_gornjaka_sto_dvjesto)-1
dhdx(i)=(h(i+1)-h(i))/(x_gornjaka_sto_dvjesto(i+1)-x_gornjaka_sto_dvjesto(i));

end
dhdx(208)=dhdx(207);
plot(x_gornjaka_sto_dvjesto,dhdx,'-'); legend('dh/dx');


%% ODRE?IVANJE NAGIBA/thete  metodom y2-y1/x2-x1     i   Alfac tj. camber nagib

[a,b]=max(y_gornjaka_sto_dvjesto);
[c,d]=min(y_donjaka_sto_dvjesto);
figure;


for i = 1 : length(x_gornjaka_sto_dvjesto)-1
    
    nagib_gornjaka(i)=((y_gornjaka_sto_dvjesto(i+1)-y_gornjaka_sto_dvjesto(i))/(x_gornjaka_sto_dvjesto(i+1)-x_gornjaka_sto_dvjesto(i)));
%     if i >= b
%         nagib_gornjaka(i)=-1*nagib_gornjaka(i);
%     end
    nagib_camber(i)=(y_camber_sto_dvjesto(i+1)-y_camber_sto_dvjesto(i))/(x_camber_sto_dvjesto(i+1)-x_camber_sto_dvjesto(i));
    nagib_donjaka(i)=-1*((y_donjaka_sto_dvjesto(i+1)-y_donjaka_sto_dvjesto(i))/(x_donjaka_sto_dvjesto(i+1)-x_donjaka_sto_dvjesto(i)));
%     if i >= d
%         nagib_donjaka(i) = -1*nagib_donjaka(i);
%     end
end
% nagib_donjaka=-1*nagib_donjaka
nagib_camber(end)=-0.0434; % ina?e na kraju bude NaN pa se ne može compute
% nagib_gornjaka(end)=nagib_gornjaka(end)*-1;
%Vjerojatno treba donjaku i gornjaku pomnozit s minus 1..
%  nagib_donjaka=-1.*nagib_donjaka;
%  nagib_gornjaka=-1.*nagib_gornjaka;
%  cpl_cpu=nagib_donjaka+nagib_gornjaka;
% plot(cpl_cpu);
plot(nagib_gornjaka); hold on, grid on, plot(nagib_donjaka); legend('dy/dx (theta) - gornjaka','dy/dx (theta) - donjaka','zbroj njihov');


%% ODRE?IVANJE NAGIBA/thete  metodom y3-y1/x3-x1

for i = 1 : length(x_gornjaka_sto_dvjesto)-2
    nagib_gornjaka(i)=(y_gornjaka_sto_dvjesto(i+2)-y_gornjaka_sto_dvjesto(i))/(x_gornjaka_sto_dvjesto(i+2)-x_gornjaka_sto_dvjesto(i));
    nagib_camber(i)=(y_camber_sto_dvjesto(i+2)-y_camber_sto_dvjesto(i))/(x_camber_sto_dvjesto(i+2)-x_camber_sto_dvjesto(i));
    nagib_donjaka(i)=(y_donjaka_sto_dvjesto(i+2)-y_donjaka_sto_dvjesto(i))/(x_donjaka_sto_dvjesto(i+2)-x_donjaka_sto_dvjesto(i));
end

%Vjerojatno treba donjaku pomnožiti s minus 1!
%  nagib_donjaka=-1.*nagib_donjaka;
plot(nagib_gornjaka); hold on, grid on, plot(nagib_donjaka); legend('dy/dx - gornjaka','dy/dy - donjaka');

%% tre?i na?in nagiba

nagib_gornjaka=gradient(y_gornjaka_sto_dvjesto,x_gornjaka_sto_dvjesto);
nagib_camber=gradient(y_camber_sto_dvjesto,x_camber_sto_dvjesto);
nagib_donjaka=-1*gradient(y_donjaka_sto_dvjesto,x_donjaka_sto_dvjesto);
%  nagib_donjaka=-1.*nagib_donjaka;
plot(nagib_gornjaka); hold on, grid on, plot(nagib_donjaka); legend('dy/dx - gornjaka','dy/dy - donjaka');





%% odre?ivanje pressure coefficient Cp za npr Ma = 1.5 i AoA 2

% b=cell(1,length([1:0.25 : 3]));
Ma=1.3;
i=0;
formatSpec = 'AoA = %2.2f';
for AoA = 0
   
i=i+1;
% b(1,i)={sprintf(formatSpec,AoA)};
Cpu = (2.*(nagib_gornjaka))/sqrt(Ma^2-1);
Cpl = (2.*(nagib_donjaka))/sqrt(Ma^2-1);
% plot(sum(diff(x_gornjaka_sto_dvjesto).*(Cpl-Cpu))/4580);
plot(Cpu); hold on, grid on, plot(Cpl); legend ('Cp gornjaka','Cp donjaka');
% cn=(sum((diff(x_gornjaka_sto_dvjesto)).*(Cpl-Cpu))/4580);
% ca=(sum((diff(x_gornjaka_sto_dvjesto)).*(Cpu.*nagib_gornjaka-Cpl.*nagib_donjaka))/4580);
% cl=mean(cn.*cosd(AoA)-ca.*sind(AoA));
% cd=mean(cn.*sind(AoA)+ca.*cosd(AoA));
end

title ('Koeficijent tlaka'), grid on, xlabel('dx'),ylabel('Cp');

% legend(b,'Location','east');



%% Cl i Cd vs AoA s promjenom Ma;
x=[-3:1:10];
b=cell(1,length([1.5:0.5:3]));
i=0;
formatSpec = 'Ma = %2.2f';
for Ma = 1.5:0.5:3
    i=i+1;
Cl = 4.*deg2rad(x)/sqrt(Ma^2-1);
Cd=4.*(deg2rad(x).^2+mean(dhdx)^2+mean(nagib_camber)^2)/sqrt(Ma^2-1);
b(1,i)={sprintf(formatSpec,Ma)};

plot(Cd,Cl),hold on, grid on,title('Cl - Cd'), xlabel('Cd'),ylabel('Cl');
hold on
end

 legend(b,'Location','northwest');

figure;
for Ma = 1.5:0.5:3
Cd=4.*(deg2rad(x).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
plot(x,Cd), grid on, title('Cd vs AoA'), xlabel('AoA'),ylabel('Cd');
hold on
end
legend(b,'Location','north');
figure;
for Ma =1.5:0.5:3
Cl = 4.*deg2rad(x)./sqrt(Ma.^2-1);
plot(x,Cl), grid on, title('Cl vs AoA'),xlabel('AoA'),ylabel('Cl');
hold on
end
legend(b,'Location','southeast');

%% Cl i Cd u odnosu na Ma, AoA fixan na 3 stupnja
Ma=[1:0.05:3];
formatSpec = 'AoA = %2.f\n';
i=0;
b=cell(1,length([-2:2:8]));
for x = -2:2:8
    i=i+1;
Cl = 4.*deg2rad(x)./sqrt(Ma.^2.-1);
Cd=4.*(deg2rad(x).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2.-1);
b(1,i)={sprintf(formatSpec,x)};
plot(Cd,Cl),hold on, grid on, title('Cl - Cd'),xlabel('Cd'),ylabel('Cl');
end
legend(b);
figure;
for x = -2:2:8
    Cd=4.*(deg2rad(x).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2.-1);
plot(Ma,Cd), grid on, title('Cd vs Ma'), hold on,xlabel('Ma'),ylabel('Cd')
end
legend(b);
figure;
for x = -2:2:8
Cl = 4.*deg2rad(x)./sqrt(Ma.^2.-1);
plot(Ma,Cl), grid on, title('Cl vs Ma'), hold on,xlabel('Ma'),ylabel('Cl');
end
legend(b);