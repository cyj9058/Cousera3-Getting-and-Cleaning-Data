import numpy as np 
a1=np.array([1,2,3])
a2=np.array([[1,2,3]])
a3=np.array([[1],[2],[3]])

#attribute
a3.ndim
a3.shape
a3.size
a3.dtype
a3.itemsize
a3.data

a3.T

m1=np.matrix([1,2,3,4])
m1*m1.T
m1.dot(m1.T)

#데이터 타입설정
l=[1,2,3,4]
a=np.array(l,np.int)
a=np.array(l,np.float)
a=np.array(l,np.str)

#slicing 
l=[5,6,7,8]
a=np.array(l)
s=a[:2]
ss=a[:2].copy()

#조회 
data1=np.random.randn(7,4)
data1[:1].size

f=np.array([1,2,3])
a=f>2

f=np.arange(0,12)
f.reshape(3,4)


#data type
dt=np.dtype([('country','S20'),('density','i4'),('area','i4),('population')])
