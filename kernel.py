import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline
f = open('iris.txt')
data = []
y=[]
for i in f.read().split():
    data.append([float(j)for j in i.split(',')[:-1]])
    y.append(i.split(',')[-1])
    
data = np.array(data) # 原始数据
n = data.shape[0] # 样本个数
m = data.shape[1] # 样本维数
def k(x1,x2):
    return x1.dot(x2)**2
km=np.zeros([n,n])
for i in range(n):
    for j in range(n):
        km[i][j]=k(data[i],data[j])
s=np.zeros([1,n])
for i in range(n):
    s=s+km[i]
mean = s/n
kms=np.zeros([n,n])
for i in range(n):
    kms[i]=km[i]-mean
kmn=np.zeros([n,n])
for j in range(n):
    biggest=kms[0][j]
    little=kms[0][j]
    for i in range(n):
        if kms[i][j]>biggest:
            biggest=kms[i][j]
        if kms[i][j]<little:
            little=kms[i][j]
    for i in range(n):     
        kmn[i][j]=(kms[i][j]-little)/(biggest-little)   
kmn