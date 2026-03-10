%Programma 2 maase 2 molle differenziale grado 4 con eig
%Funzione massa 1
%&{ x'''' = -x''(w_2^2+w_1^2+w2_1^2) -x(w_1^2 * w_2^2) 
%}
%clear all, close all, clc
t=0:0.01:50;
m1=1.5;
%m2=2
%m2=0.3
%m2=5
%m2=3;
%m2=10
m2=0.01
%m2 valori da tenere come riferimento per altri studi
k1=15;
%k2= tengo come riferimento sempre per altri casi
%k2=10
%k2=0.5
%k2=20
%k2=30
k2=5;
w1=sqrt(k1/m1);
w2=sqrt(k2/m2);
w2_1=sqrt(k2/m1);
%w1_2=k1/m2
%ho segnato tutti i valori di A
A=[0 1 0 0
    0 0 1 0
    0 0 0 1
    -(w1^2)*(w2^2) 0 -(w1*w1 + w2*w2 +w2_1^2) 0];
%Condizioni_iniziali= initial_
%x(0)
%v(0)
%a(0)
%J(0)
v0=input("velocità iniziale massa 1  ");
a0=input("accelerazione iniziale massa 1  ");
J0=input("Strappo/jerk iniziale massa 1  ");
initial_=[5 v0 a0 J0];
V_0=initial_.'; %trasposta del vettore condizioni iniziali || A*x right hand side
%ode 45 output a sinistra
[t,out]=ode45(@(t,x) A*x, t, V_0);

%{hold on
%plot(t,out(:,1),"r--"))
%plot(t,out(:,2),"b--")
%plot(t,out(:,3),"w--")% }
eig(A);
[T,D]=eig(A);

hold on 
plot(t,out(:,1),"r-")
%plot(t,out(:,2),"g--")
%plot(t,out(:,3),"c--")