%
%   Determination of Wave Heigths and Periods With Zero-Crossing Method
%
%   Tahsin Gormus
%   December 2015, Istanbul
%   Update: August 2020
%

disp('Load your surface level column data...')

[file,path]=uigetfile;
iwl=importdata(string(strcat(path,file)));

pr1='Write 1 for Zero-Up Crossing and 2 for Zero-Down Crossing: ';
sel=input(pr1);

pr2='Please write the interval between two data points in seconds: ';
interval=input(pr2);

t=linspace(interval,length(iwl)*interval,length(iwl));
n=iwl-mean(iwl);
k=1:(length(n)-1);

if sel==1
    p=find(sign(n(k))==-1 & sign(n(k+1))==1);
elseif sel==2
    p=find(sign(n(k))==1 & sign(n(k+1))==-1);
else
    disp('You havent selected the method properly.');
end

Periods=NaN(length(p)-1,1);
maxpos=NaN(length(p)-1,1);
maxneg=NaN(length(p)-1,1);

for z=1:length(p)-1
    Periods(z,1)=interval*(p(z+1)-p(z));
    maxpos(z,1)=max(n(p(z)+1:p(z+1)));
    maxneg(z,1)=min(n(p(z)+1:p(z+1)));
end
Heights=maxpos-maxneg;
    
if sign(n(end))~=0
    Results(:,1)=Heights(1:end-1);
    Results(:,2)=Periods(1:end-1);
end

dlmwrite('Results.txt',Results)

SortedH=sort(Heights,'descend');
Hs=mean(SortedH(1:round(numel(Heights)/3)));

fprintf('!!Results have been saved to Results.txt (H,T),\nTotal number of waves are %i and significant wave height is: %f',size(Results,1),Hs);
