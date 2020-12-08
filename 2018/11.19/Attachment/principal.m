stdr=std(x);
[n,m]=size(x);
sddata=x./stdr(ones(n,1),:);
[p,princ,egenvalue]=princomp(sddata);
per=100*egenvalue/sum(egenvalue);