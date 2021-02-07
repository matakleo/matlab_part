%% Main function of a project, used to deliver the necessary data for calculations.
%% It takes 1 to 3 arguments in form of 3 integers -> position of an airfoil (determining it's camber line curvatore),
%% free stream Mach number, and final argument is used whether the user wants a graphic display of the selected
%% position of an airfoil.

function [dhdx,nagib_camber,nagib_gornjaka,nagib_donjaka,Cpu,Cpl,x_donjaka_sto_dvjesto,...
        y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(pozicija,Ma,crtanje)
Rezanje_tocaka; %a script used for defining numerous data points that define the surfaces of the airofil, divides the original coordinate vector into 3 sections

%Depending on the first argument given to the function, the "position argument", var "a" takes the values
%of the amount of degrees the leading and trailing edge are going to deform

if pozicija == 1
    a(1)=-2;
    a(2)=-20;
elseif pozicija == 2
    a(1)=15;
    a(2)=-20;
elseif pozicija == 3                
    a(1)=-2;
    a(2)=2;
elseif pozicija == 4
    a(1)=25;
    a(2)=0;
elseif pozicija == 0
    a(1)=0;
    a(2)=0;
else
    
    error('try again with numbers 0-4.');
end

%% Leading edge arrangement from vector arrays into matrices
  %setting 2 vector arrays into single matrix in a proper order
mlef_gornjaka=[xlef_gornjaka';ylef_gornjaka'];
mlef_srednjaka=[xlef_srednjaka';ylef_srednjaka'];  
mlef_donjaka=[xlef_donjaka';ylef_donjaka'];

centar_gornjaka=[mlef_gornjaka(:,end)];
centar_srednjaka=[mlef_srednjaka(:,end)];
centar_donjaka=[mlef_donjaka(:,end)];

m2lef_gornjaka=mlef_gornjaka-centar_gornjaka;
m2lef_srednjaka=mlef_srednjaka-centar_gornjaka;
m2lef_donjaka=mlef_donjaka-centar_gornjaka;

% plot(xlef_gornjaka,ylef_gornjaka,xsredina_gornjaka,ysredina_gornjaka,xtef_gornjaka,ytef_gornjaka);
% hold on, grid on, axis equal;

% Applying the rotation matrix to newly formed leading edge matrices containing coordinate points in
% order to rotate them around a focal point based on the cartesian coordinate system

z=[cos(deg2rad(a(1))) -sin(deg2rad(a(1)));sin(deg2rad(a(1))),cos(deg2rad(a(1)))];
rotacija_lef_gornjaka= z*m2lef_gornjaka+centar_gornjaka;
rotacija_lef_srednjaka= z*m2lef_srednjaka+centar_gornjaka;
rotacija_lef_donjaka = z*m2lef_donjaka+centar_gornjaka;

xlef_gornjaka_rotiran = rotacija_lef_gornjaka(1,:);
ylef_gornjaka_rotiran = rotacija_lef_gornjaka(2,:);
xlef_srednjaka_rotiran=rotacija_lef_srednjaka(1,:);
ylef_srednjaka_rotiran=rotacija_lef_srednjaka(2,:);
xlef_donjaka_rotiran=rotacija_lef_donjaka(1,:);
ylef_donjaka_rotiran=rotacija_lef_donjaka(2,:);

% plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'r',x_camber_sto_dvjesto,...
% y_camber_sto_dvjesto,'g',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'b'); 
% hold on;
% fill(xlef_gornjaka_rotiran,ylef_gornjaka_rotiran,'r',xlef_donjaka_rotiran,ylef_donjaka_rotiran,'b');


%% Trailing edge



mtef_gornjaka=[xtef_gornjaka';ytef_gornjaka'];
mtef_srednjaka=[xtef_srednjaka';ytef_srednjaka'];
mtef_donjaka=[xtef_donjaka';ytef_donjaka'];

centar_gornjaka=[mtef_gornjaka(:,1)];
centar_srednjaka=[mtef_srednjaka(:,1)];
centar_donjaka=[mtef_donjaka(:,1)];

m2tef_gornjaka=mtef_gornjaka-centar_gornjaka;
m2tef_srednjaka=mtef_srednjaka-centar_gornjaka;
m2tef_donjaka=mtef_donjaka-centar_gornjaka;

% plot(xlef_gornjaka,ylef_gornjaka,xsredina_gornjaka,ysredina_gornjaka,xtef_gornjaka,ytef_gornjaka);
% hold on, grid on, axis equal;

%trailing edge rotation

z=[cosd(a(2)) -sind(a(2));sind(a(2)),cosd(a(2))];
rotacija_tef_gornjaka= z*m2tef_gornjaka+centar_gornjaka;
rotacija_tef_srednjaka= z*m2tef_srednjaka+centar_gornjaka;
rotacija_tef_donjaka = z*m2tef_donjaka+centar_gornjaka;

xtef_gornjaka_rotiran = rotacija_tef_gornjaka(1,:);
ytef_gornjaka_rotiran = rotacija_tef_gornjaka(2,:);
xtef_srednjaka_rotiran=rotacija_tef_srednjaka(1,:);
ytef_srednjaka_rotiran=rotacija_tef_srednjaka(2,:);
xtef_donjaka_rotiran=rotacija_tef_donjaka(1,:);
ytef_donjaka_rotiran=rotacija_tef_donjaka(2,:);

% plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'r',x_camber_sto_dvjesto,y_camber_sto_dvjesto,'g',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'b'); 
% hold on;
% fill(xtef_gornjaka_rotiran,ytef_gornjaka_rotiran,'r',xtef_srednjaka_rotiran, ytef_srednjaka_rotiran,'g',xtef_donjaka_rotiran,ytef_donjaka_rotiran,'b');

%% Assambling the rotated airfoil parts into a whole composition, along with the central part which doesn't go through any changes

x_gornjaka_sto_dvjesto=[xlef_gornjaka_rotiran,xsredina_gornjaka',xtef_gornjaka_rotiran];
y_gornjaka_sto_dvjesto=[ylef_gornjaka_rotiran,ysredina_gornjaka',ytef_gornjaka_rotiran];

x_camber_sto_dvjesto = [xlef_srednjaka_rotiran,xsredina_srednjaka',xtef_srednjaka_rotiran];
y_camber_sto_dvjesto = [ylef_srednjaka_rotiran,ysredina_srednjaka',ytef_srednjaka_rotiran];

x_donjaka_sto_dvjesto = [xlef_donjaka_rotiran,xsredina_donjaka',xtef_donjaka_rotiran];
y_donjaka_sto_dvjesto = [ylef_donjaka_rotiran,ysredina_donjaka',ytef_donjaka_rotiran];


%% Displaying the geometry-changed airfoil in the xy plane
if nargin > 2 && crtanje ==1
    figure;
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,x_camber_sto_dvjesto,y_camber_sto_dvjesto,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto)
hold on, axis equal, grid on;
end

%% Determining the halfwidth of the airfoil throughout the entire length

for i = 1 : length(y_gornjaka_sto_dvjesto)
    h(i)=(y_gornjaka_sto_dvjesto(i)-y_donjaka_sto_dvjesto(i))/2 ;
end

%% Determining the change in the halfwidth, it's gradient
for i = 1 : length(x_gornjaka_sto_dvjesto)-1
dhdx(i)=(h(i+1)-h(i))/(x_gornjaka_sto_dvjesto(i+1)-x_gornjaka_sto_dvjesto(i));

end
dhdx(208)=dhdx(207);


%% Determining the change in the theta angle, the angle of the free stream deflection while following the surface of the airfoil
for i = 1 : length(x_gornjaka_sto_dvjesto)-1
    
    nagib_gornjaka(i)=((y_gornjaka_sto_dvjesto(i+1)-y_gornjaka_sto_dvjesto(i))/(x_gornjaka_sto_dvjesto(i+1)-x_gornjaka_sto_dvjesto(i)));
    nagib_camber(i)=(y_camber_sto_dvjesto(i+1)-y_camber_sto_dvjesto(i))/(x_camber_sto_dvjesto(i+1)-x_camber_sto_dvjesto(i));
    nagib_donjaka(i)=-1*((y_donjaka_sto_dvjesto(i+1)-y_donjaka_sto_dvjesto(i))/(x_donjaka_sto_dvjesto(i+1)-x_donjaka_sto_dvjesto(i)));
end
nagib_gornjaka(end+1)=nagib_gornjaka(end);
nagib_donjaka(end+1)=nagib_donjaka(end);


%% Calculating and drawing the pressure coefficient Cp
%figure;
if nargin >=2
    Cpu = (2.*(nagib_gornjaka))./sqrt((Ma^2)-1);
Cpl = (2.*(nagib_donjaka)) ./sqrt((Ma^2)-1);
indx=find(Cpl<-1.5);
Cpl(indx)=Cpl(indx-1);  %Necessary to fix the sudden and false increase of value caused by the 2 points at the hinge
nagib_gornjaka(end+1)=nagib_gornjaka(end);
nagib_donjaka(end+1)=nagib_donjaka(end);
%plots the pressure coefficient throughout the length of the airfoil (use it for ansys comparison!)
%plot(x_gornjaka_sto_dvjesto,Cpu,'-'), grid on, hold on;
%plot(x_gornjaka_sto_dvjesto,Cpl,'-'), legend("Cp-gornjaka","Cp-donjaka");   

end
%used for calculating the slope of the airfoil chord in order to control the correct angle of attack of the free stream!
a=[x_gornjaka_sto_dvjesto(1),y_gornjaka_sto_dvjesto(1)];
b=[x_gornjaka_sto_dvjesto(end),y_gornjaka_sto_dvjesto(end)];          
slope=(b(2)-a(2))/(b(1)-a(1));
kut_nagiba = rad2deg(atan(slope));



end





