%
%   Determination of Wave Heights in Surf Zone with Goda (2000) Method
%
%   Tahsin Gormus
%   April 2016, Istanbul
%   Update: August 2020
%

prompt1='Diffraction coefficient Kd= ';
Kd=input(prompt1);
prompt2='Refraction coefficient Kr= ';
Kr=input(prompt2);
prompt3='Deep sea wave height (m) H= ';
H=Kd*Kr*input(prompt3);
prompt4='Wave period (sec) T= ';
T=input(prompt4);
prompt5='Water depth (m) for wave height to be calculated: ';
d=input(prompt5);
prompt6='Bottom slope m= ';
m=input(prompt6);
L0=1.5613*T^2;
dl0=d/L0;
syms x
kd=2*pi*d/x;
eqn=x-L0*(exp(4*kd)-1)/(exp(4*kd)+1)==0;
L=vpasolve(eqn,x);
L=abs(double(L));
n=0.5*(1+(2*2*pi*d/L)/sinh(2*2*pi*d/L));
Ksreg=((0.5*L0/T)/(n*L/T))^0.5;
Ksnl=Ksreg+(0.0015*(dl0^-2.87)*((H/L0).^1.27));
B0s=0.028*((H/L0)^-0.38)*exp(20*m^1.5);
B1s=0.52*exp(4.2*m);
Bmaxs=max(0.92,0.32*((H/L0)^-0.29)*exp(2.4*m));
B0m=0.052*((H/L0)^-0.38)*exp(20*m^1.5);
B1m=0.63*exp(3.8*m);
Bmaxm=max(1.65,0.53*((H/L0)^-0.29)*exp(2.4*m));
S=[B0s*H+B1s*d;Bmaxs*H;Ksnl*H];
M=[B0m*H+B1m*d;Bmaxm*H;1.8*Ksnl*H];
if dl0>=0.2
    Hs=Ksnl*H;
    Hmax=1.8*Ksnl*H;
elseif dl0<0.2
    Hs=min(S);
    Hmax=min(M);
end
d1='Significant wave height';
d2='Maximum wave height';
fprintf('%s is %f meters.\n',d1,Hs)
fprintf('%s is %f meters.\n',d2,Hmax)
