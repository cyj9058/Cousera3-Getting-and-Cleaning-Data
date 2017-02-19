import random
import matplotlib
import matplotlib.pyplot as plt



def rollDice():
    roll=random.randint(1,100)    
    if roll ==100: 
        print(roll,'roll was 100, you lose. What are the odds?! Play again!')
        return False 
    elif roll<=50:
        print(roll,'roll was 1-50, you lose.')
        return False 
    elif 100>roll>50:
        print(roll,'roll was 51-99, you win! *pretty lights flash* (play more!)')
        return True
        
def simple_bettor(funds,wager,wager_count):
    value=funds
    wager=wager
    
    wX=[]
    vY=[]
    
    currentWager=0
    while currentWager < wager_count: 
        if rollDice():
            value +=wager 
            wX.append(currentWager)
            vY.append(value)
        else: 
            value -=wager
            wX.append(currentWager)
            vY.append(value)
        currentWager +=1
        print('Funds:',value)
    
    plt.plot(wX,vY)

   
# start this off @ 1, then add, and increase 50 to 500, then 1000    
x= 0
while x < 100:
    simple_bettor(10000,100,100000)
    x += 1


plt.ylabel('Account Value')
plt.xlabel('Wager Count')
plt.show()  
