clear all
clc
beta1=0;
beta2=0;
k1=1;
k2=1;

n=2*39;%total sites

t0=linspace(0,10,40);
y0=zeros(n,1);
y0(33)=0;
y0(37)=0;
y0(37)=0.5;
y0(39)=1;
y0(41)=1;
y0(43)=0.5;
[T,Y]=ode45(@(tt,y) array_SSH1(beta1,beta2,k1,k2,n,tt,y), t0, y0);


% jxfigure
figure(1) 
pcolor((1:n),t0,abs(Y).^2)
shading flat
label('x (\mum)','z (\mum)')
colorbar
front
% jxfont
% jxprint('fig3b_90')