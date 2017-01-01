
# Vector is data list with function 
word={'on':1, 'Spain':1,'in':1, 'plain':1,'the':2,'mainly':1,'rain':1,'falls':1}
Jane={'age':30,'education level':16,'income':85000}
state={'China':1232321321,'India':1232131312,'US':231321312312,'Indonesia':2312312312,'Brazil':213213213213}
prob={1:1/6,2:1/6,3:1/6,4:1/6,5:1/6,6:1/6}

from plotting import plot
L = [[2, 2], [3, 2], [1.75, 1], [2, 1], [2.25, 1], [2.5, 1], [2.75, 1], [3, 1], [3.25, 1]]
plot(L)


# Addition of n-vectors is defined in terms of addition of corresponding entries
def add2(v,w):
    return [v[0]+w[0], v[1]+w[1]]
plot([add2(v, [1,2]) for v in L], 4)

# Vector as Arrow: Like complex numbers in the plane, n-vectors over R can be visualized as arrows in Rn.
# Scaline Vectors: Scalar  
def scalar_vector_mult(alpha, v):
    return [alpha*v[i] for i in range(len(v))]

plot([scalar_vector_mult(i/10, v) for i in range(11)], 5)



#Dictionary-based represnetation
class Vec:
    def __init__(self, labels,function):
        self.D = labels
        self.f = function

def setitem(v,d,val): v.f[d] = val

def getitem(v,d):
    if d in v.f:
        return v.f[d]
    else:
        return 0


D = {'memory', 'radio', 'sensor', 'CPU'}
rate = Vec(D, {'memory':0.06, 'radio':0.1, 'sensor':0.004, 'CPU':0.0025})
duration = Vec(D,{'memory':1.0, 'radio':0.2, 'sensor':0.5, 'CPU':1.0})


#2.14 Prblems
##2.14.1
v=[-1,3];u=[0,4]

def add3(x,y):
    return(x[0]+y[0],x[1]+y[1]);
def subtract3(x,y):
    return(xx[0]+y[0],x[1]+y[1])

v=[2,-1,5];u=[-1,1,1] 

def add1(x,y):
    return(x[0]+y[0],x[1]+y[1],x[2]+y[2])
def subtract1(x,y):
    return(x[0]-y[0],x[1]-y[1],x[2]-y[2])
def subtract2(x,y):
    return(2*x[0]-y[0],2*x[1]-y[1],2*x[2]-y[2])
def add2(x,y):
    return(x[0]+2*y[0],x[1]+2*y[1],x[2]+2*y[2])

