import matplotlib.pyplot as plt 
import matplotlib_venn as v
a=v.venn2(subsets=[set([1,2]),set([2,3,4,5])],set_labels=('A','B'))
plt.title("Venn diagram")
plt.show()

a=v.venn3(subsets=(1,1,0,1,0,0,0),set_labels=('A','B','C'))
a.get_label_by_id('100').set_text('First')

#부분집합
v.venn2(subsets=[set([2,3]),set([2,3,4,5])],set_labels=('A','B'))

#집합의 원소 조회 
s=set([1,2,3])

for i in s: 
    print(i) 
