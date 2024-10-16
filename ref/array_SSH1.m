function dy=array_SSH1(beta_1,beta_2,k_1,k_2,N,tt,y)

H=zeros(N,N);
offdiag1 = zeros(1,N);
offdiag1(1:2:N-1) = beta_1;
offdiag1(2:2:N) = beta_2;

offdiag2 = zeros(1,N-1);
offdiag2(1:2:N-1) = k_1;
offdiag2(2:2:N-2) = k_2;

H = zeros(N,N) + diag(offdiag1,0)+ diag(offdiag2,1) + diag(offdiag2,-1);
%diag(v,k) 将向量 v 的元素放置在第 k 条对角线上。k=0 表示主对角线，k>0 位于主对角线上方，k<0 位于主对角线下方。


dy=1i*H*y;
return