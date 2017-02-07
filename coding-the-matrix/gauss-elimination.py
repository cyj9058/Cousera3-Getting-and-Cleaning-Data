## 첨가행렬을 변환시켜 보자 
import numpy as np
import numpy.linalg as lin
import sympy as sym

a=np.array([[1,2,3],[2,-1,1],[3,0,1]])
b=np.array([[9],[8],[3]])
c=np.hstack((a,b))
d=sym.Matrix(c).rref()


#연습문제1 
a1=np.array([[1,3,-1],[2,5,1],[1,1,1]])
b1=np.array([[1],[5],[3]])
c1=np.hstack((a1,b1))
d1=sym.Matrix(c1).rref()


a2=np.array([[1,3,-2,0,2,0],[2,6,-5,-2,4,-3],[0,0,5,10,0,15], [2,6,0,8,4,18]])
b2=np.array([[0],[-1],[5],[6]])
c2=np.hstack((a2,b2))
d2=sym.Matrix(c2).rref()
