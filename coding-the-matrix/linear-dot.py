import numpy as np 
import numpy.linalg as lin

a=np.array([[1,0],[0,1]])
b=np.array([[4,1],[2,2]])

np.dot(a,b) #dot 
np.cross(a,b) #cross product
np.inner(a,b)#inner product 
np.outer(a,b)
np.tensordot(a,b)
np.trace(a)

#공차 
x=np.linspace(1,100,20)
cd=x[1]-x[0]


#등차수열
x=np.linspace(1,10,10)
y=np.linspace(1,10,10)
z=sorted(y,reverse=True)

np.sum((x+z)/2)


import numpy as np 
import numpy.linalg as lin

a=np.array([[1,0],[0,1]])
b=np.array([[4,1],[2,2]])

np.dot(a,b) #dot 
np.cross(a,b) #cross product
np.inner(a,b)#inner product 
np.outer(a,b).shape
ts=np.tensordot(a,b,axes=0)
ts.shape
ts[0][0][0,0]
