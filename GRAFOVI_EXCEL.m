%% Graphs %%
% For comparison and graph presentation of the correlation/difference of ansys 2d
% viscous flow results with matlab analytical results obtained by linear theory of
% supersonic thin airfoils.
% The difference increases as the curvatore of the airfoil changes - which
% was predicted. However, a fine case of correlation can be observed when
% plotting lift and drag coefficients for small curvatore airfoils.
%% position 0 %%
[~,~,~,~,~,~,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(0,1.5,0);
Cl_ansys_0 = [-0.005222859, 0.056804269, 0.11903936, 0.18156644, 0.24429288, 0.30849276];
Cd_ansys_0 = [0.019456115, 0.020138468, 0.023002949, 0.028068126, 0.035370786, 0.045233395];

Cl_matlab_0 = [0, 0.062442798, 0.124885595, 0.187328393, 0.24977119, 0.312213988];
Cd_matlab_0 = [0.009563416, 0.010653248, 0.013922745, 0.019371907, 0.027000734, 0.036809226];

subplot(2,1,1);
plot(Cd_matlab_0, Cl_matlab_0, '-*', Cd_ansys_0,Cl_ansys_0,'-+')
grid on, xlabel('Cd'),ylabel('Cl'), title('Cl-Cd. AoA: 0:5');
legend('matlab','ansys')


subplot(2,1,2); 
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
axis equal, grid on;
%% position 1 %%
[~,~,~,~,~,~,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(1,1.5,0);
Cl_ansys_1 = -1.*[-0.022849154, 0.039700681, 0.10580457, 0.16969293, 0.23565157, 0.30289535];
Cd_ansys_1 = [0.077690256, 0.075487552, 0.077247965, 0.080624781, 0.085636467, 0.092876207];

Cl_matlab_1 = [-0.268479053, -0.206036255, -0.143593457, -0.08115066, -0.018707862, 0.043734935];
Cd_matlab_1 = [0.0467418, 0.038459945, 0.032357756, 0.028435231, 0.026692371, 0.027129176];

subplot(2,1,1);
plot(Cd_matlab_1, Cl_matlab_1, '-*', Cd_ansys_1,Cl_ansys_1,'-+')
grid on, xlabel('Cd'),ylabel('Cl'), title('Cl-Cd. AoA: 0:5');
legend('matlab','ansys')

subplot(2,1,2); 
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
axis equal, grid on;

%% position 2 %%

[~,~,~,~,~,~,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(2,1.5,0);

Cl_matlab_2 = [-0.108700422, -0.046257624, 0.016185173, 0.078627971, 0.141070768, 0.203513566];
Cd_matlab_2 = [0.017794437, 0.015089909, 0.014565046, 0.016219847, 0.020054314, 0.026068445];

Cl_ansys_2 = [0.012682362, 0.069229522, 0.12796708, 0.1888109, 0.25250585, 0.31953528];
Cd_ansys_2 = [0.13271302, 0.13313463, 0.13561194, 0.1400729, 0.14665757, 0.15545818];



subplot(2,1,1);
plot(Cd_matlab_2, Cl_matlab_2, '-*', Cd_ansys_2,Cl_ansys_2,'-+')
grid on, xlabel('Cd'),ylabel('Cl'), title('Cl-Cd. AoA: 0:5');
legend('matlab','ansys')

subplot(2,1,2); 
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
axis equal, grid on;




%% position 3 %%

[~,~,~,~,~,~,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(3,1.5,0);

Cl_matlab_3 = [0.006269257, 0.068712054, 0.131154852, 0.19359765, 0.256040447, 0.318483245];
Cd_matlab_3 = [0.009049612, 0.010358283, 0.013846619, 0.019514619, 0.027362284, 0.037389614];

Cl_ansys_3=[0.000474562, 0.062318255, 0.1243754, 0.18690064, 0.24985749, 0.31357322];
Cd_ansys_3=[0.016405375, 0.017479149, 0.020739073, 0.02621923, 0.033999146, 0.044096417];


subplot(2,1,1);
plot(Cd_matlab_3, Cl_matlab_3, '-*', Cd_ansys_3,Cl_ansys_3,'-+')
grid on, xlabel('Cd'),ylabel('Cl'), title('Cl-Cd. AoA: 0:5');
legend('matlab','ansys')

subplot(2,1,2); 
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
axis equal, grid on;

%% position 4 %%

[~,~,~,~,~,~,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(4,1.5,0);

Cl_matlab_4 = [0.223907384, 0.286350181, 0.348792979, 0.411235776, 0.473678574, 0.536121372];
Cd_matlab_4 = [0.152085532, 0.160991206, 0.172076545, 0.18534155, 0.200786219, 0.218410553];

Cl_ansys_4 = [0.041665529, 0.095628686, 0.14944706, 0.20377204, 0.26298208, 0.32109514];
Cd_ansys_4 = [0.11530039, 0.1179839, 0.12366793, 0.13038118, 0.13860303, 0.14932956];


subplot(2,1,1);
plot(Cd_matlab_4, Cl_matlab_4, '-*', Cd_ansys_4,Cl_ansys_4,'-+')
grid on, xlabel('Cd'),ylabel('Cl'), title('Cl-Cd. AoA: 0:5');
legend('matlab','ansys')

subplot(2,1,2); 
plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-')
axis equal, grid on;










