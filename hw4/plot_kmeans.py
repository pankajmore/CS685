from time import time
import numpy as np
import pylab as pl

from sklearn import metrics
from sklearn.cluster import KMeans
from sklearn.metrics.pairwise import euclidean_distances

X = np.genfromtxt('clusters_input.csv', delimiter=',')
dissE = euclidean_distances(X, X, squared=True)
n_digits = 10

results = {}
for k in range(2,21):
    estimator =  KMeans(n_clusters=k, init='k-means++', n_init=30, max_iter=300, tol=0.0001, precompute_distances=True, verbose=0, random_state=None, copy_x=True, n_jobs=8, k=None)
    estimator.fit(X)
    results[k] = metrics.silhouette_score(dissE, estimator.labels_, metric='precomputed', sample_size=None, random_state=None)
    print(k,results[k])






