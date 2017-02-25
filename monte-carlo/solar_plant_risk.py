import os 
os.chdir("/Users/joyeongji/Dropbox/data")
import numpy as np
import pandas as pd 
import scipy as sp 
import scipy.stats as st

solar_risk=pd.read_excel("power-plant-risk-analysis.xlsx",sheetname='risk-evaluation')

#capa=99
#year=20
#smp=100
#rec=100
#runtime=3.3
#efficiency=1

def revenue(capa,year,smp,rec,runtime,efficiency):
    time=1
    revenue_stream=pd.Series(list(range(1,year*12+1)))   
    while time<=year*12:
        revenue_stream[time]=capa*(smp+rec)*runtime*efficiency
        time +=1
        efficiency *=0.999     
    return(revenue_stream)

schedule_risk=solar_risk[solar_risk['factor']=='schedule']
capex_risk=solar_risk[solar_risk['factor']=='capex']
revenue_risk=solar_risk[solar_risk['factor']=='revenue']

risk=revenue_risk
size=100
  
def random_generate(risk,size):
    col=0
    random_data=pd.DataFrame(columns=list(risk['risk']))
    while  col< risk.shape[0]: 
        if risk.iloc[col]['distribution']=='normal':
            val1=st.norm.rvs(risk[col:col+1]['mean'],risk[col:col+1]['variance'],size)
            random_data[random_data.columns[col]]=val1
        elif risk.iloc[col]['distribution']=='discrete':
            val2=st.binom.rvs(n=100,p=risk[col:col+1]['probability'],size=size)/100
            random_data[random_data.columns[col]]=val2  
        col+=1
    return(random_data)
