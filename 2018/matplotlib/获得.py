import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

fig, ax = plt.subplots()
xdata, ydata = [], []
for i in range (0,45):
    xdata.append(0)
    ydata.append(0)
ln, = plt.plot([], [], 'ro', animated=True)
#frame=1
def init():
    ax.set_xlim(-1000, 1000)
    ax.set_ylim(-1000, 1000)
    return ln,

def update(frame):
    for number in range (0,45):
        xdata[number]=1000*(np.sin((frame/360*np.pi)+(number/90*np.pi)))
        ydata[number]=1000*(np.cos((frame/360*np.pi)+(number/90*np.pi)))
        

    ln.set_data(xdata, ydata)

    #print(xdata)
    return ln,

frames=np.linspace(0, 360, 361)

ani = FuncAnimation(fig, update, frames,init_func=init, blit=True)
plt.show()
