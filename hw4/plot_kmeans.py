from time import time
import numpy as np
import pylab as pl

from sklearn import metrics
from sklearn.cluster import KMeans

data = np.genfromtxt('clusters_input.csv', delimiter=',')

n_digits = 10

def bench_k_means(km, name, data):
    km.fit(data)
    print(name, (time() - t0), estimator.inertia_,len(estimator.cluster_centers_),
         metrics.silhouette_score(data, estimator.labels_,
                                  metric='euclidean')
         )

results = {}
for k in range(2,21):
    estimator =  KMeans(n_clusters=k, init='k-means++', n_init=10, max_iter=300, tol=0.0001, precompute_distances=True, verbose=0, random_state=None, copy_x=True, n_jobs=8, k=None)
    estimator.fit(data)
    results[k] = metrics.silhouette_score(data, estimator.labels_, metric='precomputed', sample_size=None, random_state=None)
    print(k,results[k])
print(k)





