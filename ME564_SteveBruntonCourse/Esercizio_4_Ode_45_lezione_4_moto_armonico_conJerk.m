%esercizio 4 Ode 45 lezione 4 moto armonico e tentativo molla con jerk e
%dumping

%{d=0.15 attrito dumping molla 
% J=1 jerk, effetto derivata tripla
% m=2 massa 2 kg
% k=5 costante molla 
% w=sqrt(k/m)  %}

% d = input('attrito dumping molla: '); % attrito dumping molla
% J = input('Jerk: '); % jerk, effetto derivata tripla
% m = input('massa: '); % massa 2 kg
% k = input('costante molla: '); % costante molla
d = 0.75; %acciaio_acciao = 0.75-55 acciaio lubrificato = 0.11 // 0.05 acciaio aria=0.0001
%J=1;
m=2;
k=20; % 20-300 mpolti valori, random qui
w=sqrt(k/m)  

%matrice A con coefficienti da ricavare

%A=[0 1 0;0 0 1;-w*w*m/J -d/J -m/J];
%solo smorzato senza accelerazione
A=[0 1;-w*w -d/m];
dt=0.01; %intervallo temporale della simulazione
T=30; %fine del tempo simulazione T/dt = 1000 valori
x_0=input("posizione iniziale ");
v_0=input("velocità iniziale ");
%a_0=input("accelerazione iniziale ");
values_0=[x_0, v_0]; %a_0] ;
% values_0=[1.5; 1; 3.1]; %valori iniziali per trovare coefficienti (x, v, acc) 
%[posizione iniziale, velocità iniziale, accelerazione ini]

% compute better integral using built-in Matlab code
% 4th-order Runge Kutta 
% [TOUT,YOUT] = ODE45(ODEFUN,TSPAN,Y0)
[t,x_finale] = ode45( @(t,x) A*x, 0:dt:T, values_0); % t = t_out per fare grafico
% using function handle to define @(t,x) A*x... right-hand side
% of \dot{x} = Ax... ode45 wants us to include time in @(t,x), in 
% case there is time dependence.

hold on
plot(t,x_finale(:,1),'r') %posizione :,1 per fare i valori dello spostamento
xlabel('Time [s]')
ylabel('Position [m]')

figure("Name","velocità_tempo")
plot(t,x_finale(:,2),'k')
xlabel('time [S]')
ylabel('Velocity [m/s]')

%figure Name "accelerazione"
%plot(t,x_finale(:,3),'-o')
%xlabel('t [s]')
%ylabel('acc [m*m/s]')