import os 
os.chdir("/Users/joyeongji/Dropbox/data")

import openpyxl as xl
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



revenue_stream=pd.Series([1,5])



def random_risk_generate(risk_type, ):
    if(risk_type=='normal' )

    
s1 = pd.Series([1, 2, 3])
s2 = pd.Series([4, 5, 6])
s3 = pd.Series([4, 5, 6], index=[3,4,5])
s1.append(s2)

revenue_stream=pd.Series(list(range(1,241)))    
    
    
    sp.stats.binom(N, theta)
