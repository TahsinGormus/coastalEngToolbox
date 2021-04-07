#####
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

%reset -sf

type=1; # 1 for up-crossing, 2 for down-crossing

data=pd.read_excel('surfaceelevations.xlsx'); # First column is sampling time, followed by water level columns

row=np.size(data,0);
col=np.size(data,1);

time=data.iloc[:,0]; # sampling time

for i in range(1,col-1):
    
    dat=data.iloc[:,i]; # current data column
    flucs=dat-np.mean(dat); # fluctuations around the mean
    sgn=np.sign(flucs); # amplitude signs
    
    cross=np.zeros((row-1,1));
    
    for ii in range(0,row-2):
        if type==1: #up-crossing
            if sgn[ii]==-1 and sgn[ii+1]==+1:
                cross[ii]=1; # putting 1 for zero-cross locations
        elif type==2: #down-crossing
            if sgn[ii]==+1 and sgn[ii+1]==-1:
                cross[ii]=1; # putting 1 for zero-cross locations
            
    ind=[]; # zero-crossing indices
    
    for iii in range(0,row-1):
        if cross[iii]==1:
            ind.append(iii)
            
    n_waves=np.size(ind)-1; # number of waves
            
    ind_n=[];
    H=np.empty((n_waves,1)); # wave heights
    T=np.empty((n_waves,1)); # wave periods
    
    for n in range(0,n_waves):
        
        start=ind[n]+1; # start indice for the current wave
        end=ind[(n+1)]; # end indice for the current wave
        
        if end-start>1:
            flucs_n=dat[start:end];
            a_cre=np.nanmax(flucs_n); # max crest amplitude
            a_tro=np.nanmin(flucs_n); # min trough amplitude
            
            H[n]=a_cre+np.absolute(a_tro); # wave heights
            T[n]=time[end]-time[start]; # wave periods
            
    out=np.column_stack((H,T));
    np.savetxt('Column'+str(i)+'.txt',aa,header='(H,T)')
            
    plt.plot(H)
    plt.ylabel('H (m)')
    plt.xlabel('Wave no.')
    plt.title('Column '+str(i))
    plt.show()
    

    del [dat,flucs,sgn,cross,ind,H,T]


