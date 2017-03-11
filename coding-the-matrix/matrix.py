
import numpy as np
import numpy.linalg as lin
import sympy as sym 

a1=np.array([[2,-5],[-1,3]])
b1=np.array([[3,5],[1,2]])
np.dot(a1,b1)
lin.inv(a1)
lin.inv(b1)

a2=np.array([[1,4,3],[2,5,6],[0,0,0]])
lin.det(a2)

a3=np.array([[1,0,0],[2,1,0],[0,0,1]])
b3=lin.inv(a3)
np.dot(a3,b3)

a4=np.array([[1,2,3],[2,5,3],[1,0,8]])
b4=np.identity(3)
c4=np.hstack((a4,b4))
d4=sym.Matrix(c4).rref()

a5=np.array([[1,-1,2],[-1,0,2],[-6,4,1]])
b5=np.identity(3)
c5=np.hstack((a5,b5))
d5=sym.Matrix(c5).rref()

import numpy as np
import numpy.linalg as lin
import sympy as sym 

a1=np.array([[2,-5],[-1,3]])
b1=np.array([[3,5],[1,2]])
np.dot(a1,b1)
lin.inv(a1)
lin.inv(b1)

a2=np.array([[1,4,3],[2,5,6],[0,0,0]])
lin.det(a2)

a3=np.array([[1,0,0],[2,1,0],[0,0,1]])
b3=lin.inv(a3)
np.dot(a3,b3)

a4=np.array([[1,2,3],[2,5,3],[1,0,8]])
b4=np.identity(3)
c4=np.hstack((a4,b4))
d4=sym.Matrix(c4).rref()

a5=np.array([[1,-1,2],[-1,0,2],[-6,4,11]])
b5=np.identity(3)
c5=np.hstack((a5,b5))
d5=sym.Matrix(c5).rref()

