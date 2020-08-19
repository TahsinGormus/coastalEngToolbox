%
%   Finding deep sea wave height from significant wave height at a specific
%   depth with Goda (2000) Method
%
%   Tahsin Gormus
%   Feb 2017, Istanbul
%   Update: August 2020
%

prompt1='Diffraction coefficient Kd= ';
Kd=input(prompt1);
prompt2='Refraction coefficient Kr= ';
Kr=input(prompt2);
prompt3='Significant wave height Hs= ';
Hs=input(prompt3);
prompt4='Wave period T= ';
T=input(prompt4);
prompt5='Water depth for the given wave height d= ';
d=input(prompt5);
prompt6='Bottom slope m= ';
m=input(prompt6);
interval=0.0001;
H0t=(Kd*Kr)*[interval:interval:100*Hs];
L0=1.5613*T^2;
dl0=d/L0;
syms x
kd=2*pi*d/x;
eqn=x-L0*(exp(4*kd)-1)/(exp(4*kd)+1)==0;
L=vpasolve(eqn,x);
L=abs(double(L));
n=0.5*(1+(2*2*pi*d/L)/sinh(2*2*pi*d/L));
Ksreg=((0.5*L0/T)/(n*L/T))^0.5;
Ksnl=Ksreg+(0.0015*(dl0^-2.87)*((H0t/L0).^1.27));
B0s=0.028*((H0t/L0).^-0.38)*exp(20*m^1.5);
B1s=0.52*exp(4.2*m);
Bmaxs=max(0.92,0.32*((H0t/L0).^-0.29)*exp(2.4*m));
S=[B0s.*H0t+B1s*d;Bmaxs.*H0t;Ksnl.*H0t];
SS=1:length(H0t);
Smin=min(S(:,SS));
if dl0>=0.2
    Hst=Ksnl.*H0t;
elseif dl0<0.2
    Hst=Smin;
end
R=H0t((abs(Hst-Hs))<interval);
H0=mean(R)/(Kd*Kr);
d='Deep sea wave height';
fprintf('%s is %f meters.\n',d,H0);
