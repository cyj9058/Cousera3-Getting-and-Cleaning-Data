import os 
os.chdir("/Users/joyeongji/Dropbox/data")
import numpy as np
import pandas as pd 
import scipy as sp 

solar_risk=pd.read_excel("power-plant-risk-analysis.xlsx",sheetname='risk-evaluation')
solar_risk['type']

capa=99
year=20
smp=100
rec=100
runtime=3.3
efficiency=1

def revenue(capa,year,smp,rec,runtime,efficiency):
    time=1
    revenue_stream=pd.Series(list(range(1,year*12+1)))   
    while time<=year*12: 
        revenue_stream[time]=capa*(smp+rec)*runtime*efficiency
        time +=1
        efficiency *=0.999     
    return(revenue_stream)
