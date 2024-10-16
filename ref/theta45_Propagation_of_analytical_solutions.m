clc
clear
theta=45*pi/180;

% 解传播微分方程组 
syms A1(z) A2(z) A3(z) c detabeta; %定义变量
eqn=[-1i*diff(A1,z)==c*exp(1i*theta)*A2+c*exp(-1i*theta)*A3,-1i*diff(A2,z)==c*exp(-1i*theta)*A1+c*A3,-1i*diff(A3,z)==c*exp(1i*theta)*A1+c*A2]; %定义方程组dy/dt=z，dz/dt=-y

cond=[A1(0)==1,A2(0)==0,A3(0)==0]; %定义初值，z=0时，基模打入；
[A1Sol A2Sol A3Sol]=dsolve(eqn,cond); %dsolve()为求解函数，将方程放入即可

simplified_A1Sol = simplify(A1Sol)% 化简 
simplified_A2Sol = simplify(A2Sol)
simplified_A3Sol = simplify(A3Sol)


%%验证
z=[0:0.1:5];
c=1;

figure
%%微分方程组的解析解
plot(z,exp(-3^(1/2)*c*z*1i)/3 + exp(3^(1/2)*c*z*1i)/3 + 1/3,'r-')
hold on
plot(z,- 2^(1/2)*(1/6 + 1i/6) + exp(3^(1/2)*c*z*1i)*(3^(1/2)/2 - 1i/2)*(2^(1/2)*3^(1/2)*(1/12 + 1i/12) + 2^(1/2)*(1/12 - 1i/12)) - 2^(1/2)*3^(1/2)*exp(-3^(1/2)*c*z*1i)*(3^(1/2)/2 + 1i/2)*(3^(1/2) - 3i)*(1/36 - 1i/36),'g-')
plot(z,- 2^(1/2)*(1/6 - 1i/6) + exp(3^(1/2)*c*z*1i)*(2^(1/2)*3^(1/2)*(1/12 + 1i/12) + 2^(1/2)*(1/12 - 1i/12)) + 2^(1/2)*3^(1/2)*exp(-3^(1/2)*c*z*1i)*(3^(1/2) - 3i)*(1/36 - 1i/36),'b-')
%%微分方程组的解析解 手动在化简
plot(z,2/3*cos(3^(1/2)*c*z)+ 1/3,'ro')
plot(z,2^(1/2)*(cos(pi/3-3^(1/2)*c*z)*(1+i)/3-(1+i)/6),'go')
plot(z,2^(1/2)*(cos(pi/3+3^(1/2)*c*z)*(1-i)/3-(1-i)/6),'bo')

%%振幅转变为光强
figure
plot(z,abs(2/3*cos(3^(1/2)*c*z)+ 1/3).^2,'ro')
hold on
plot(z,abs(2^(1/2)*(cos(pi/3-3^(1/2)*c*z)*(1+i)/3-(1+i)/6)).^2,'go')
plot(z,abs(2^(1/2)*(cos(pi/3+3^(1/2)*c*z)*(1-i)/3-(1-i)/6)).^2,'bo')
 legend('S','OAM+','OAM-')
 jxlabel('Z (\mum)','Intensity')


