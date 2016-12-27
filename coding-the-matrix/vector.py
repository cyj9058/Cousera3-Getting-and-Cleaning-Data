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
