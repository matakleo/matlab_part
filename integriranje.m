[dhdx,nagib_camber,nagib_gornjaka,nagib_donjaka,Cpu,Cpl,x_donjaka_sto_dvjesto,y_donjaka_sto_dvjesto,x_gornjaka_sto_dvjesto,y_gornjaka_sto_dvjesto]=...
    promjena_zakrivljenosti(4,1.5,0);

dx = diff(x_gornjaka_sto_dvjesto);
%The loop calculates the drag and lift coefficients for tiny parts of the
%surfaces, based on the differences in pressure coefficients of the top and
%bottom surfaces. Analytical approach via integrating and summing the small
%parts into a larger whole.
for i = 1 : length(x_gornjaka_sto_dvjesto)-1    
    
    l(i) = ( Cpl(i) - Cpu(i)) * dx(i);
    d(i) = (-Cpl(i)*nagib_donjaka(i)+Cpu(i)*nagib_gornjaka(i)) * dx(i);
    
end
% figure;
% plot(x_gornjaka_sto_dvjesto(1:207),L,x_gornjaka_sto_dvjesto(1:207),D), grid on, legend('Uzgon','Otpor');   %put 0 as the third function argument, if plotting!
cl=sum(l)/4580
cd=sum(d)/4580  %promjeni u koordinate file
% omjer=cl/cd




