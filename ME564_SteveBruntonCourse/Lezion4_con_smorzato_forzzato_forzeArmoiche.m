%esercizio 4 Ode 45 lezione 4_2 moto con smorzamento forzato e froza
%armonica
%dumping

%{d=0.15 attrito dumping molla 
% J=1 jerk, effetto derivata tripla
% m=2 massa 2 kg
% k=5 costante molla 
% w=sqrt(k/m)  %}

% d = input('attrito dumping molla: '); % attrito dumping molla
% m = input('massa: '); % massa 2 kg
% k = input('costante molla: '); % costante molla
d = input("input smorzamento"); %0.50; %acciaio_acciao = 0.75-55 acciaio lubrificato = 0.11 // 0.05 acciaio aria=0.0001
%zeta=d/(2*sqrt(k*m))
m=2;
k=20; % 20-300 mpolti valori, random qui
w_n = sqrt(k/m) % Frequenza angolare naturale del sistema
w_f = input("w della forza"); % Imposta una frequenza angolare diversa per la forza esterna

% Ora usa w_f nella forza esterna
%[t, x_finale] = ode45(@(t, x) A*x + [0; F_0*cos(w_f*t)/m], 0:dt:T, values_0);


F_0=input("forza iniziale armonica, se F=w battimento  [N]  ");
%matrice A con coefficienti da ricavare
%F_1=F_0/m;
%A=[0 1 0;0 0 1;-w*w*m/J -d/J -m/J];
%solo smorzato senza accelerazione
A=[0 1;-w_n^2 -d/m];
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
[t,x_finale] = ode45( @(t,x) A*x + [0; F_0*cos(w_f*t)/m], 0:dt:T, values_0); % t = t_out per fare grafico
% using function handle to define @(t,x) A*x... right-hand side
% of \dot{x} = Ax... ode45 wants us to include time in @(t,x), in 
% case there is time dependence.

hold on
plot(t,x_finale(:,1),'r') %posizione :,1 per fare i valori dello spostamento
xlabel('Time [s]')
ylabel('Position [m]')

%figure("Name","velocità_tempo")
%plot(t,x_finale(:,2),'k')
%xlabel('time [S]')
%ylabel('Velocity [m/s]')

%figure Name "accelerazione"
%plot(t,x_finale(:,3),'-o')
%xlabel('t [s]')
%ylabel('acc [m*m/s]')

v_finale = x_finale(:, 2);

% Definisci il percorso completo del file
fullFilePath = 'C:\Users\riccardo vvent\Documents\Python\Animazioni_matlab_Datas\simulazione_molla_dumping_forzaArmonica_data_2.csv';

% Esegui la tua simulazione (ad esempio con ode45)
% [t, x_finale] = ode45(...);

% Salva i dati nel percorso specificato
csvwrite(fullFilePath, [t, x_finale, v_finale]);