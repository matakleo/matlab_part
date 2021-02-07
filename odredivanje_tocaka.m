koordinate_i_tocke;

for i = 1 : length(x_gornjaka)-1
    x_dodatni_gornjaka(i) = (x_gornjaka(i+1)+x_gornjaka(i))/2;
    y_dodatni_gornjaka(i) = (y_gornjaka(i+1)+y_gornjaka(i))/2;
    x_dodatni_camber(i) = (x_camber(i+1)+x_camber(i))/2;
    y_dodatni_camber(i) = (y_camber(i+1)+y_camber(i))/2;
    x_dodatni_donjaka(i) = (x_donjaka(i+1)+x_donjaka(i))/2;
    y_dodatni_donjaka(i) = (y_donjaka(i+1)+y_donjaka(i))/2;
    if i == length(x_gornjaka)-1
         x_dodatni_gornjaka(i+1) = x_gornjaka(i+1);
    y_dodatni_gornjaka(i+1) = y_gornjaka(i+1);
    x_dodatni_camber(i+1) = x_camber(i+1);
    y_dodatni_camber(i+1) = y_camber(i+1);
    x_dodatni_donjaka(i+1) = x_donjaka(i+1);
    y_dodatni_donjaka(i+1) = y_donjaka(i+1);
    end
        
end

for i=1 : length(x_dodatni_gornjaka)-1
 x_dodatni_gornjaka2(i) = (x_dodatni_gornjaka(i)+x_gornjaka(i))/2;
    y_dodatni_gornjaka2(i) = (y_dodatni_gornjaka(i)+y_gornjaka(i))/2;
    x_dodatni_camber2(i) = (x_dodatni_camber(i)+x_camber(i))/2;
    y_dodatni_camber2(i) = (y_dodatni_camber(i)+y_camber(i))/2;
    x_dodatni_donjaka2(i) = (x_dodatni_donjaka(i)+x_donjaka(i))/2;
    y_dodatni_donjaka2(i) = (y_dodatni_donjaka(i)+y_donjaka(i))/2;
    
    if i==length(x_dodatni_gornjaka)-1
        
        x_dodatni_gornjaka2(i+1) = x_dodatni_gornjaka(i+1);
    y_dodatni_gornjaka2(i+1) = y_dodatni_gornjaka(i+1);
    x_dodatni_camber2(i+1) = x_dodatni_camber(i+1);
    y_dodatni_camber2(i+1) = y_dodatni_camber(i+1);
    x_dodatni_donjaka2(i+1) = x_dodatni_donjaka(i+1);
    y_dodatni_donjaka2(i+1) = y_dodatni_donjaka(i+1);
        
        
        
    end
    
end

for i = 1 : length(x_gornjaka)-1
   
    x_dodatni_gornjaka3(i) = (x_dodatni_gornjaka(i)+x_gornjaka(i+1))/2;
    y_dodatni_gornjaka3(i) = (y_dodatni_gornjaka(i)+y_gornjaka(i+1))/2;
    x_dodatni_camber3(i) = (x_dodatni_camber(i)+x_camber(i+1))/2;
    y_dodatni_camber3(i) = (y_dodatni_camber(i)+y_camber(i+1))/2;
    x_dodatni_donjaka3(i) = (x_dodatni_donjaka(i)+x_donjaka(i+1))/2;
    y_dodatni_donjaka3(i) = (y_dodatni_donjaka(i)+y_donjaka(i+1))/2;
    
    if i==length(x_gornjaka)-1
         x_dodatni_gornjaka3(i+1) = x_gornjaka(i+1);
    y_dodatni_gornjaka3(i+1) = y_gornjaka(i+1);
    x_dodatni_camber3(i+1) = x_camber(i+1);
    y_dodatni_camber3(i+1) = y_camber(i+1);
    x_dodatni_donjaka3(i+1) = x_donjaka(i+1);
    y_dodatni_donjaka3(i+1) = y_donjaka(i+1);
    end
    
end

%% SPREMANJE KOORDINATA SVIH VEKTORA U JEDAN VEKTOR cca 100 tocaka

x_gornjaka_sto=[x_gornjaka;x_dodatni_gornjaka2;x_dodatni_gornjaka;x_dodatni_gornjaka3];
x_gornjaka_sto=x_gornjaka_sto(:);
y_gornjaka_sto=[y_gornjaka;y_dodatni_gornjaka2;y_dodatni_gornjaka;y_dodatni_gornjaka3];
y_gornjaka_sto=y_gornjaka_sto(:);


x_camber_sto=[x_camber;x_dodatni_camber2;x_dodatni_camber;x_dodatni_camber3];
x_camber_sto=x_camber_sto(:);
y_camber_sto=[y_camber;y_dodatni_camber2;y_dodatni_camber;y_dodatni_camber3];
y_camber_sto=y_camber_sto(:);

x_donjaka_sto=[x_donjaka;x_dodatni_donjaka2;x_dodatni_donjaka;x_dodatni_donjaka3];
x_donjaka_sto=x_donjaka_sto(:);
y_donjaka_sto=[y_donjaka;y_dodatni_donjaka2;y_dodatni_donjaka;y_dodatni_donjaka3];
y_donjaka_sto=y_donjaka_sto(:);

%plot(x_gornjaka_sto,y_gornjaka_sto,'-o',x_camber_sto,y_camber_sto,'-+',x_donjaka_sto,y_donjaka_sto,'-^')
%axis equal, grid on, legend('gornjaka','camber','donjaka')


%% DODATNE TOCKE

for i = 1 :length(x_gornjaka_sto)-1
    a=(x_gornjaka_sto(i+1)+x_gornjaka_sto(i))/2;
    x_gornjaka_dvjesto(i)=a;
    a=(y_gornjaka_sto(i+1)+y_gornjaka_sto(i))/2;
     y_gornjaka_dvjesto(i)=a;
     a=(x_camber_sto(i+1)+x_camber_sto(i))/2;
     x_camber_dvjesto(i)=a;
     a=(y_camber_sto(i+1)+y_camber_sto(i))/2;
      y_camber_dvjesto(i)=a;
      a=(x_donjaka_sto(i+1)+x_donjaka_sto(i))/2;
       x_donjaka_dvjesto(i)=a;
       a=(y_donjaka_sto(i+1)+y_donjaka_sto(i))/2;
      y_donjaka_dvjesto(i)=a;
      
      
      if i == length(x_gornjaka_sto)-1
          
          x_gornjaka_dvjesto(i+1)=x_gornjaka_sto(end);
          y_gornjaka_dvjesto(i+1)=y_gornjaka_sto(end);
          x_camber_dvjesto(i+1)=x_camber_sto(end);
          y_camber_dvjesto(i+1)=y_camber_sto(end);
          x_donjaka_dvjesto(i+1)=x_donjaka_sto(end);
          y_donjaka_dvjesto(i+1)=y_donjaka_dvjesto(end);
          
      end
      
      
end

%% slaganje svih tocaka u 1 vektor cca 200 tocaka

x_gornjaka_sto_dvjesto=[x_gornjaka_sto';x_gornjaka_dvjesto];
x_gornjaka_sto_dvjesto=x_gornjaka_sto_dvjesto(:);
x_gornjaka_sto_dvjesto(end-7:end)=linspace(4552,4580,8);
y_gornjaka_sto_dvjesto=[y_gornjaka_sto';y_gornjaka_dvjesto];
y_gornjaka_sto_dvjesto=y_gornjaka_sto_dvjesto(:);
y_gornjaka_sto_dvjesto(end-7:end)=linspace(1.8142,0,8);

x_camber_sto_dvjesto=[x_camber_sto';x_camber_dvjesto];
x_camber_sto_dvjesto=x_camber_sto_dvjesto(:);
x_camber_sto_dvjesto(end-7:end)=linspace(4552,4580,8);
y_camber_sto_dvjesto=[y_camber_sto';y_camber_dvjesto];
y_camber_sto_dvjesto=y_camber_sto_dvjesto(:);
y_camber_sto_dvjesto(end-7:end)=linspace(1.2110,0,8);

x_donjaka_sto_dvjesto=[x_donjaka_sto';x_donjaka_dvjesto];
x_donjaka_sto_dvjesto=x_donjaka_sto_dvjesto(:);
x_donjaka_sto_dvjesto(end-7:end)=linspace(4552,4580,8);
y_donjaka_sto_dvjesto=[y_donjaka_sto';y_donjaka_dvjesto];
y_donjaka_sto_dvjesto=y_donjaka_sto_dvjesto(:);
y_donjaka_sto_dvjesto(end-7:end)=linspace(0.6080,0,8);



% plot(x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto,'-*',x_camber_sto_dvjesto,y_camber_sto_dvjesto,'-^',x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,'-+')
% hold on, axis equal,grid on, legend('gornjaka','camber','donjaka')
% plot(x_gornjaka_sto,y_gornjaka_sto,'o',x_camber_sto,y_camber_sto,'.',x_donjaka_sto,y_donjaka_sto,'^')





