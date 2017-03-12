import pandas as pd 

#Series는 value와 index로 나뉜다. 
obj=pd.Series([4,7,-5,3],index=['a','b','c','d'])
obj.values
obj.index 
obj['a']

#Dataframe index와 column으로 나뉨, 그리고 series는 세로 결합되는것 
data={'state':['Ohio','Ohio','Ohio','Nevada','Nevada'],
      'year':[2000,2001,2002,2001,2002],
      'pop':[1.5,1.7,3.6,2.4,2.9]}

frame=pd.DataFrame(data)

#colum이 해당데이터를 호출할 수 있는 근거가 된다. 
frame.state;
frame['year']

#행의 값은 아래와 같이 파악한다. 
frame2=pd.DataFrame(data,columns=['year','state','pop','debt'],
                    index=['one','two','three','four','five'])

#숫자와 문자계열 인덱스가 모두 통용됨. 
frame2.ix['three']
frame2.ix[2]

#인덱스  loc은 문자이고,iloc은 숫자임.  
frame.loc[0]
frame.iloc[0]

frame.shape
