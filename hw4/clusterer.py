from time import time
import numpy as np
import pylab

from sklearn import metrics
from sklearn.metrics.pairwise import euclidean_distances
from scipy import cluster
X = np.genfromtxt('clusters_input.csv', delimiter=',')
dissE = euclidean_distances(X, X, squared=True)

Z = cluster.hierarchy.linkage(X, method='weighted', metric='minkowski')

c = cluster.hierarchy.fcluster(Z, 9, criterion='maxclust')

pylab.scatter(X[:,0],X[:,1], c=c)
pylab.savefig("minkowski.png")

for i in range(len(c)):
    print(str(c[i]))
