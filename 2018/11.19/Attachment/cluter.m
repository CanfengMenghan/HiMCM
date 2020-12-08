d=pdist(A,'Mahal');
z= linkage(d);
H=dendrogram(z,293)
T=cluster(z,30);