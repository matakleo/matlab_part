%% %% Script used for dividing the coordinate vector into 3 parts: leading
%% %% edge flap, middle section and trailing edge flap
%%
%% 
%% The complete variables x_sto_dvjesto and y_sto_dvjesto get separeted into 9 new variable parts. 
%%
%%  xlef_gornjaka,        ylef_gornjaka              ||  Upper surface leading edge   ||      
%%  xsredina_gornjaka ,   ysredina_gornjaka          ||  Upper surface middle section ||      
%%  xtef_gornjaka,        ytef_gornjaka              ||  Upper surface trailing edge  ||      
%%
%%  xlef_srednjaka,       ylef_srednjaka             || Camberline leading edge       ||
%%  xsredina_srednjaka,   ysredina_srednjaka         ||  Camberline middle section    ||
%%  xtef_srednjaka,       ytef_srednjaka             ||  Camberline trailing edge     ||
%%
%%  xlef_donjaka,         ylef_donjaka               ||  lower surface leading edge   ||
%%  xsredina_donjaka,     ysredina_donjaka           ||  lower surface middle section ||
%%  xtef_donjaka,         ytef_donjaka               ||  lower surface trailing edge  ||
%%

prednji_dio_duzina = 700;       %% Lengths of the leading and trailing moveable parts - as per F-16 opearating manual
straznji_dio_duzina=920;

odredivanje_tocaka;         % A script which multiplies the amount of coordinate data points from 25 to over 200 for each surface,
                            % based on numerical interpolation
%% Upper surface 
        xlef_gornjaka = x_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto<=prednji_dio_duzina);
        ylef_gornjaka = y_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto<=prednji_dio_duzina);
  
        xsredina_gornjaka = x_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto<=(max(x_gornjaka_sto_dvjesto)...
                            -straznji_dio_duzina) & x_gornjaka_sto_dvjesto>=prednji_dio_duzina);
        ysredina_gornjaka= y_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto<=(max(x_gornjaka_sto_dvjesto)...
                            -straznji_dio_duzina)& x_gornjaka_sto_dvjesto>=prednji_dio_duzina);
    
        xtef_gornjaka = x_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto>=(max(x_gornjaka_sto_dvjesto)-straznji_dio_duzina));
        ytef_gornjaka= y_gornjaka_sto_dvjesto(x_gornjaka_sto_dvjesto>=(max(x_gornjaka_sto_dvjesto)-straznji_dio_duzina));
       
    
% plot(xlef_gornjaka,ylef_gornjaka,xsredina_gornjaka,ysredina_gornjaka,xtef_gornjaka,ytef_gornjaka);
% for graphical presentation of the upper surface and it's movable parts,
% remove the comment sign.

%% Camberline


        xlef_srednjaka = x_camber_sto_dvjesto(x_camber_sto_dvjesto<=prednji_dio_duzina);
        ylef_srednjaka = y_camber_sto_dvjesto(x_camber_sto_dvjesto<=prednji_dio_duzina);
  
        xsredina_srednjaka = x_camber_sto_dvjesto(x_camber_sto_dvjesto<=(max(x_camber_sto_dvjesto)...
                            -straznji_dio_duzina) & x_camber_sto_dvjesto>=prednji_dio_duzina);
        ysredina_srednjaka=  y_camber_sto_dvjesto(x_camber_sto_dvjesto<=(max(x_camber_sto_dvjesto)...
                            -straznji_dio_duzina)& x_camber_sto_dvjesto>=prednji_dio_duzina);
    
        xtef_srednjaka = x_camber_sto_dvjesto(x_camber_sto_dvjesto>=(max(x_camber_sto_dvjesto)-straznji_dio_duzina));
        ytef_srednjaka=  y_camber_sto_dvjesto(x_camber_sto_dvjesto>=(max(x_camber_sto_dvjesto)-straznji_dio_duzina));
       
%     
% plot(xlef_srednjaka,ylef_srednjaka,xsredina_srednjaka,ysredina_srednjaka,xtef_srednjaka,ytef_srednjaka);
% for graphical presentation of the camberline and it's movable parts,
% remove the comment sign.
%% lower surface

    xlef_donjaka = x_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto<=prednji_dio_duzina);
        ylef_donjaka = y_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto<=prednji_dio_duzina);
  
        xsredina_donjaka = x_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto<=(max(x_donjaka_sto_dvjesto)...
                            -straznji_dio_duzina) &x_donjaka_sto_dvjesto>=prednji_dio_duzina);
        ysredina_donjaka= y_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto<=(max(x_donjaka_sto_dvjesto)...
                            -straznji_dio_duzina)& x_donjaka_sto_dvjesto>=prednji_dio_duzina);
    
        xtef_donjaka = x_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto>=(max(x_donjaka_sto_dvjesto)-straznji_dio_duzina));
        ytef_donjaka= y_donjaka_sto_dvjesto(x_donjaka_sto_dvjesto>=(max(x_donjaka_sto_dvjesto)-straznji_dio_duzina));
%        

    
% plot(xlef_donjaka,ylef_donjaka,xsredina_donjaka,ysredina_donjaka,xtef_donjaka,ytef_donjaka);
% for graphical presentation of the lower surface and it's movable parts,
% remove the comment sign.
