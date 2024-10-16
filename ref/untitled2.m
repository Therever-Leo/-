%    OAM+
% S
%    OAM-
clear all
clc
N=3;%波导数
theta=1*pi/4;
c=2^0.5;
detabeta=2;
z0=linspace(0,3,300);
y0=zeros(N,1);
y0(1)=1;%第一根基模波导打入
[Z,Y]=ode45(@(zz,y) array_chiral_dymanics(c,theta,detabeta,zz,y), z0, y0);
figure(1)
plot(z0,abs(Y(1:300,1:1:N)).^2)


legend('S','OAM+','OAM-')
figure(2)
pcolor((1:1:N),z0(:),abs(Y(:,1:1:N)).^2)
shading flat
jxlabel('x (\mum)','z (\mum)')
jxcolorbar