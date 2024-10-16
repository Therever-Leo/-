clear
N=5;
input=[0;0;1;0;0];
IN=160;
dl=0.01;
H=[1,1,0,0,0;
   1,1,1,0,0;
   0,1,1,1,0;
   0,0,1,1,1;
   0,0,0,1,1;];
output=zeros(100,5);
output(1,:)=input';
for ii=1:1:IN-1
    output(ii+1,:)=output(ii,:)*(2*eye(5)-1i*H*dl)/(2*eye(5)+1i*H*dl);
end
imagesc(output.*conj(output));






clear
clc
N=5;
input=[0;0;1;0;0]';
NN=160;
dl=0.01;
H=[1,1,0,0,0;
   1,1,1,0,0;
   0,1,1,1,0;
   0,0,1,1,1;
   0,0,0,1,1];
output=zeros(5,100);
output(:,1) = input;
for ii=1:1:NN-1
    output(:,ii+1)=((1*eye(5)-(1i/2)*H*dl*dl*ii))/((1*eye(5)+(1i/2)*H*dl*dl*ii))*output(:,ii);
end
imagesc(output.*conj(output));





% 定义参数
lambda = 500e-9; % 波长，单位米
w0 = 1e-3; % 光斑半径，单位米
k = 2*pi/lambda; % 波数

% 创建坐标网格
x = linspace(-5e-3, 5e-3, 500);
y = x;
[X, Y] = meshgrid(x, y);

% 计算高斯光斑
r = sqrt(X.^2 + Y.^2); % 到中心的距离
I0 = 1; % 假设中心光强为1
GaussianSpot = I0 * exp(-2*r.^2/w0^2); % 高斯光斑光强分布

% 绘制光斑
figure;
imagesc(x, y, GaussianSpot);
colormap('jet'); % 使用jet颜色图
colorbar; % 显示颜色条
title('高斯光斑分布');
xlabel('X (米)');
ylabel('Y (米)');




% 定义参数
lambda = 500e-9; % 波长，单位米
k = 2*pi/lambda; % 波数
I0 = 1; % 假设中心光强为1

% 创建坐标网格
x = linspace(-5e-3, 5e-3, 500);
y = x;
[X, Y] = meshgrid(x, y);

% 定义几个高斯光斑的参数
centers = [-2e-3, 0, 2e-3]; % 高斯光斑的中心位置X坐标
radii = [1e-3, 0.8e-3, 1.2e-3]; % 高斯光斑的半径

% 初始化光强分布矩阵
GaussianSpots = zeros(size(X));

% 计算每个高斯光斑的光强分布并累加
for i = 1:length(centers)
    r = sqrt((X - centers(i)).^2 + Y.^2); % 到中心的距离
    GaussianSpots = GaussianSpots + I0 * exp(-2*r.^2/radii(i)^2); % 高斯光斑光强分布
end

% 绘制光斑
figure;
imagesc(x, y, GaussianSpots);
colormap('jet'); % 使用jet颜色图
colorbar; % 显示颜色条
title('多个高斯光斑分布');
xlabel('X (米)');
ylabel('Y (米)');