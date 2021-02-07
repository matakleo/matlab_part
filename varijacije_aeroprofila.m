koordinate_i_tocke
odredivanje_tocaka
Rezanje_tocaka


% theta1 kut otklona prednjeg dijela aeroprofila
% theta2 kuta otklona stražnjeg dijela aeroprofila
% standardne pozicije su : theta 1 [-2 15 -2 25 15 -2]
%                          theta 2 [ 20 20 -2 0 20 20]
theta1 = deg2rad(0) ;
theta2 = -deg2rad(0);


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


z=[cos(theta1) -sin(theta1);sin(theta1),cos(theta1)];
rotacija_lef_gornjaka= z*m2lef_gornjaka+centar_gornjaka;
rotacija_lef_srednjaka= z*m2lef_srednjaka+centar_gornjaka;
rotacija_lef_donjaka = z*m2lef_donjaka+centar_gornjaka;

xlef_gornjaka_rotiran = rotacija_lef_gornjaka(1,:);
ylef_gornjaka_rotiran = rotacija_lef_gornjaka(2,:);
xlef_srednjaka_rotiran=rotacija_lef_srednjaka(1,:);
ylef_srednjaka_rotiran=rotacija_lef_srednjaka(2,:);
xlef_donjaka_rotiran=rotacija_lef_donjaka(1,:);
ylef_donjaka_rotiran=rotacija_lef_donjaka(2,:);

% plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'r',x_camber_sto_dvjesto,y_camber_sto_dvjesto,'g',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'b'); 
% hold on;
% fill(xlef_gornjaka_rotiran,ylef_gornjaka_rotiran,'r',xlef_donjaka_rotiran,ylef_donjaka_rotiran,'b');


%% stražnji dio



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


z=[cos(theta2) -sin(theta2);sin(theta2),cos(theta2)];
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

%% stavljanje svega ponovo u jedan vektor

x_gornjaka_sto_dvjesto=[xlef_gornjaka_rotiran,xsredina_gornjaka',xtef_gornjaka_rotiran];
y_gornjaka_sto_dvjesto=[ylef_gornjaka_rotiran,ysredina_gornjaka',ytef_gornjaka_rotiran];

x_camber_sto_dvjesto = [xlef_srednjaka_rotiran,xsredina_srednjaka',xtef_srednjaka_rotiran];
y_camber_sto_dvjesto = [ylef_srednjaka_rotiran,ysredina_srednjaka',ytef_srednjaka_rotiran];

x_donjaka_sto_dvjesto = [xlef_donjaka_rotiran,xsredina_donjaka',xtef_donjaka_rotiran];
y_donjaka_sto_dvjesto = [ylef_donjaka_rotiran,ysredina_donjaka',ytef_donjaka_rotiran];

% plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_camber_sto_dvjesto,y_camber_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
% hold on; axis equal; grid on;
