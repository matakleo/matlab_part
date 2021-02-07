
%% halfwidth
for i = 1 : length(y_gornjaka_sto_dvjesto)
    h(i)=(y_gornjaka_sto_dvjesto(i)-y_donjaka_sto_dvjesto(i))/2; 
end
%% promjena debljine, Alfa
for i = 1 : length(x_gornjaka_sto_dvjesto)-1
dhdx(i)=(h(i+1)-h(i))/(x_gornjaka_sto_dvjesto(i+1)-x_gornjaka_sto_dvjesto(i));

end
dhdx(208)=dhdx(207);
%% odre?ivanje theta kuta, tj. promjene nagiba površina
nagib_gornjaka=gradient(y_gornjaka_sto_dvjesto,x_gornjaka_sto_dvjesto);
nagib_camber=gradient(y_camber_sto_dvjesto,x_camber_sto_dvjesto);
nagib_donjaka=gradient(y_donjaka_sto_dvjesto,x_donjaka_sto_dvjesto);