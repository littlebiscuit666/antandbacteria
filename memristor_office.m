% 1.basic parameter
clear;clc;
k0=1*10^4;
R1 = 100;R2 = 10000;
% I = 0.1,0.15,0.2mA
I = 1*10^(-4);
% w = 5, 3,10,100rad/s
w = 5;   
% c = 0 , 0.2, 0.4 
c = 0;
% 2.time
delta = 0.0001; t = [0:delta:2*pi/w];
%% 3. it,x,M,V
it = I*sin(w*t);
%it = 2*I*sin(w*t)+1.5*I*cos(2*w*t);
N = size(t);N = N(2);
intit=it;
for k=2:N
    intit(k)=it(k)+intit(k-1);
end
intit = delta *intit;
x = c+k0*intit;
M = R1 + R2*(1-x);
V = M.*it;
plot(it,V);
%% show result
figure(2)
subplot(2,2,1);plot(t,it);
subplot(2,2,2);plot(t,x);
subplot(2,2,3);plot(t,M);
subplot(2,2,4);plot(t,V);

%% 2.basic parameter