clear
clc
N=81;%波导数目
NN=2000;%步进次数
k1=0.8;
k2=0.8;%耦合系数
beta1=0;
beta2=0;%传播常数
dl=0.01;%步进大小

y=zeros(N,1);
y(38)=0.5;
y(39)=0.5;
y(40)=1;
y(41)=1;
y(42)=1;
y(43)=0.5;
y(44)=0.5;%基模

H=zeros(N,N);
offdiag1 = zeros(1,N);
offdiag1(1:2:N-1) = beta1;
offdiag1(2:2:N) = beta2;

offdiag2 = zeros(1,N-1);
offdiag2(1:2:N-1) = k1;
offdiag2(2:2:N-2) = k2;

H = zeros(N,N) + diag(offdiag1,0)+ diag(offdiag2,1) + diag(offdiag2,-1);

output=zeros(NN,N);
for ii=1:1:NN
    output(ii,:)=expm(-1*1i*H*ii*dl)*y;
end
figure;
imagesc(output.*conj(output));


N=4;%波导数目
NN=100;%步进次数
k1=0.8;
k2=0.8;%耦合系数
beta1=0;
beta2=0;%传播常数
dl=0.01;%步进大小
lambda = 500e-9; % 波长，单位米
w0=1e-3; % 光斑半径，单位米
k=2*pi/lambda; % 波数

centers = [-2e-3, 0, 2e-3]; % 高斯光斑的中心位置X坐标
radii = [1e-3, 0.8e-3, 1.2e-3]; % 高斯光斑的半径



x=linspace(-5e-3, 5e-3, 500);
y=x;
[X, Y]=meshgrid(x, y);
r = sqrt(X.^2 + Y.^2);%高斯分布参数
GaussianSpots = zeros(size(X));% 初始化光强分布矩阵

y=[1;0;0;0];%基模

H=[beta1,k1,0,0;
   k2,beta2,k1,0;
   0,k2,beta1,k1;
   0,0,k2,beta2];
output=zeros(NN,N);
for ii=1:1:NN
    output(ii,:)=expm(-1*1i*H*ii*dl)*y;
end

% 计算每个高斯光斑的光强分布并累加
for i = 1:length(centers)
    r = sqrt((X - centers(i)).^2 + Y.^2); % 到中心的距离
    GaussianSpots = GaussianSpots + output(i,1) * exp(-2*r.^2/radii(i)^2); % 高斯光斑光强分布
end

figure;
imagesc(output.*conj(output));
figure;
imagesc(x, y, GaussianSpots);