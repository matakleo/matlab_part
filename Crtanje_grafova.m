%%Script used for drawing various graphs, such as the airfoil polar, drag
%%distribution, lift distribution. Changes are made by varying the mach number
%%and by varying the angle of attack



%% Main plotting section, used for the polar
napadni_kut=0:5;  %Angle of Attack

b=cell(1,5);
for Ma = 1.5
figure;
for i = 0:4
    
    [dhdx,nagib_camber,nagib_gornjaka,nagib_donjaka,Cpu,Cpl,x_donjaka_sto_dvjesto,...
        y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=promjena_zakrivljenosti(i,Ma);
    
    Cl = 4.*deg2rad(napadni_kut)./sqrt(Ma.^2-1);
    Cd = 4.*(deg2rad(napadni_kut).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
    
    plot(Cd,Cl),hold on, grid on,title(sprintf('Cl v Cd @ Ma = %2.2f',Ma)), xlabel('Cd'),ylabel('Cl');
    hold on
    
end

 b=["Starting postition";"Take off during groud roll";"Take off after liftoff";"Reflexed for high speed cruise";"Max manoeuvre configuration"];
  legend(b,'Location','east');
  
%% this is used to showcase drag coefficient dependency on the AoA
 figure;
for i = 0:4
    [dhdx,nagib_camber]=promjena_zakrivljenosti(i,Ma,0);
Cd=4.*(deg2rad(napadni_kut).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
plot(napadni_kut,Cd), grid on, title(sprintf('Cd vs AoA @ Ma = %2.2f',Ma)), xlabel('AoA'),ylabel('Cd');
hold on
end

legend(b,'Location','west');
%% Used to demonstrate the lift coefficient dependency on the AoA

 for i = 0 : 4
    [dhdx,nagib_camber]=promjena_zakrivljenosti(i,Ma,0);
Cl = 4.*deg2rad(napadni_kut)./sqrt(Ma.^2-1);
plot(napadni_kut,Cl), grid on, title(sprintf('Cl vs AoA @ Ma = %2.2f',Ma)),xlabel('AoA'),ylabel('Cl');
hold on
end
 legend(b,'Location','northwest');
end
 
 
 %% promjenjivi MA   Cl _ Cd graf
 %% PROMJENA POLARE SVAKE POJEDINE KONFIGURACIJE PRI PROMJENI MACH BROJA
 formatSpec = 'Ma = %2.2f';
 i=0;
 %b=cell(1,length([Ma]));
        %%naziv_grafa=cell(1,4);
 for c = 0 :4
 [dhdx,nagib_camber]=promjena_zakrivljenosti(c,1.5,0);
 figure;
 for Ma = [1.3 2 3]
         i=i+1;
      Cl = 4.*deg2rad(napadni_kut)./sqrt(Ma.^2-1);
      Cd = 4.*(deg2rad(napadni_kut).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
     b(1,i)={sprintf(formatSpec,Ma)};
plot(Cd,Cl),hold on, grid on,xlabel('Cd'),ylabel('Cl');
if c== 0
    title('Cl - Cd - Starting position');
elseif c == 1
   title('Cl - Cd - Take off during groud roll')
elseif c == 2
    title('Cl - Cd - Take off after liftoff')
elseif c ==3
    title('Cl - Cd - Reflexed for high speed cruise')
elseif c ==4
    title('Cl - Cd - Max manoeuvre configuration')
end
hold on
 end
 
 %legend(b,'Location','northwest');
 end

 
 %% Promjenjivi Ma, Cd v AoA graf
 %% OTPOR SVAKE POJEDINE KONFIGURACIJE NA ZASEBNOM GRAFU, NA PRVOJ SECTION SU SVI PRIKAZANI U ISTOM GRAFU..
 formatSpec = 'Ma = %2.2f';
 i=0;
 b=cell(1,length([Ma]));
 naziv_grafa=cell(1,4);
 for c = 0 :4
 [dhdx,nagib_camber]=promjena_zakrivljenosti(c,1.5,0);
  for Ma = 1.5
         i=i+1;
      Cd = 4.*(deg2rad(napadni_kut).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
     b(1,i)={sprintf(formatSpec,Ma)};
plot(napadni_kut,Cd),hold on, grid on,xlabel('AoA'),ylabel('Cd');
if c==0
    title('Cd - AoA Starting position')
elseif c == 1
   title('Cd - AoA Take off during groud roll')
elseif c == 2
    title('Cd - AoA Take off after liftoff')
elseif c ==3
    title('Cd - AoA Reflexed for high speed cruise')
else
    title('Cd - AoA Max manoeuvre configuration')
end
hold on
 end
 
% legend(b,'Location','northwest');
 end
 
 
 %% Cd v Ma graph, Displays the linear decrease of the drag based on the Ma number
 
 formatSpec = 'AoA = %2.2f';
 i=0;
 Ma=[1.5:3];
%b=cell(1,4);
 for c = 0 :4
 [dhdx,nagib_camber]=promjena_zakrivljenosti(c);
 for napadni_kut =0:10
         i=i+1;
      Cd = 4.*(deg2rad(napadni_kut).^2+mean(dhdx)^2+mean(nagib_camber)^2)./sqrt(Ma.^2-1);
       Cl = 4.*deg2rad(napadni_kut)./sqrt(Ma.^2-1);
     b(1,i)={sprintf(formatSpec,napadni_kut)};
plot(Ma,Cd),hold on, grid on,xlabel('Ma'),ylabel('Cd');
if c == 0
   title('Cd - Ma Starting position')
elseif c == 1
   title('Cd - Ma Take off during groud roll/Landing at wheel spin up')
elseif c == 2
    title('Cd - Ma Take off after liftoff/Approach Config')
elseif c ==3
    title('Cd - Ma Reflexed for high speed cruise')
else
    title('Cd - Ma Max manoeuvre configuration')
end
hold on
 end
 i=0;
    legend(b,'Location','northwest');
 end


