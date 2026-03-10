%programma ODE pendolo semplice
%Uso metodi numerici ode45 kutta, simpson e altriper trovare
%T_periodo(theta, w); uso due approcci 1) differenziale funzione iniziale
% 2) taylor applicato all'integrale iperbolico, dopo riporto con python
%eq in latex | \frac{dy_1}{dt} = y_2 |\frac{dy_2}{dt} = -\frac{g}{l} \sin(y_1)
%\begin{pmatrix} \frac{dy_1}{dt} \\ \frac{dy_2}{dt} \end{pmatrix} = \begin{pmatrix} y_2 \\ -\frac{g}{l} \sin(y_1) \end{pmatrix}

%   NON LINEARE; NIENTE MATRICE COEFFICIenTI
%equazioni e poi matrice fatte in latez su 
%Simpson;s quadrature;
%Ricorda che lo script viene prima delle def delle funzioni in matlab

% initial_conditions = [angolo, velocità]; % Angolo iniziale e quindi
% pendolo fermo ==  velocità angolare = 0; cambia se decido che a un certo
% angolo è già in movimento il pendolo
% servono come starter/// risolutore della ode/// uso ode 45 Kutta_runge
%% primo blocco ODE;

g = 9.81; l = input('dammi l del cavo// rod del pendolo  =  ');
omega = -sqrt(g/l); % Definizione di omega

%eta0=input('angolo start a t0')
eta0=input('eta start, etanot');
R=deg2rad(eta0);
initial_conditions = [R, 0]; % Angolo iniziale e velocità angolare

% Risoluzione dell'ODE
[t, y] = ode45(@(t, y) pendulum_ode(t, y, omega), [0,100], initial_conditions);
%salva in out [t,y] matrice righe-colonne;; richiamo funzione e
%applico(start,intervallo,finish) time step e dopo initial conditions.

%calcolo il periodo con integrale numerico; giù tutti i passaggi

k = sin(eta0); % Calcola k come il seno di m_costante
K = ellipticK(k^2); % Passa k^2 a ellipticK
disp(K);

plot(t, y(:,1));
title('Angolo del Pendolo nel Tempo');
xlabel('Tempo (s)');
ylabel('Angolo (radianti)');

% Parametri del pendolo
l = input('Inserisci la lunghezza del pendolo: ');

% Preparazione della figura
figure;
axis equal;
grid on;
hold on;
xlim([-l, l]);
ylim([-l, l]);
title('Animazione del Pendolo');

% Elementi grafici
hPendolo = plot(0, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hAsta = line([0, 0], [0, -l], 'Color', 'b', 'LineWidth', 2);

% Loop di animazione
for k = 1:length(t)
    x = l * sin(y(k, 1));
    y_pos = -l * cos(y(k, 1));

    % Aggiornamento del pendolo e dell'asta
    set(hPendolo, 'XData', x, 'YData', y_pos);
    set(hAsta, 'XData', [0, x], 'YData', [0, y_pos]);

    drawnow; % Aggiorna il grafico
    pause(0.05); % Regola la velocità dell'animazione
end



% % METODO 2 con Integrale_NUMERICO, trovo il periodo del pendolo, dopo faccio il main
% %e il plot di entrambi per vedere le differenze
% %clear pulisce le variabili
% syms x fi_m fi
% f = (1 - x)^(-1/2); %uso funzione con x var sostitutiva
% n=input('ordine dello sviluppo ');
% fi_m_deg=input('angolo in gradi ° ,fallito, == ');
% 
% % Calcola l'espansione di Taylor di f attorno a x0 = 0 e taylor(f, x=serve a mettere x var symb per sostituire dopo) 
% Tt = taylor(f, x, 'Order', n); % fliplr(sym2poly(Tt)) serve a visualizzare la serie in ordine crescente sena modifiche
% 
% % Scemo chi legge-- era importante
% 
%  disp(Tt)
% 
%  %   Sostituisci x con sin(fi_m)^2 * sin(fi)^2
% %    x_iniziale_preSostituzione = sin(fi_m)^2 * sin(fi)^2;
%  %   fi_m=(fi_m_deg*2*pi)/360; devi metterlo prima di x_sostituto ma dopo la
% %    prima serie o si impalla; oppure non lo prende e tiene fi_m simbolico,
% 
% fi_m=(fi_m_deg*2*pi)/360;
% y=sin(fi_m); %casino per il valore numerico di sin fi_m
% x_sostituto = (y^2) * sin(fi)^2;
% 
% Taylor_sostituto = subs(Tt, x, x_sostituto); %scambia x con x_sostituto
% 
% disp(Taylor_sostituto); %show and tell
% % ORA FACCIAMO L?INTERGRALE ELLITTICO DI PRIMA SPECIE IN_COMPLETA con
% % integral, integral numeric
% 
% % METODO 1!  %{ Proviamo con integrazione simbolica%}
% 
% a = 0; % Limite inferiore di integrazione
% b = pi/2; % Limite superiore di integrazione
% 
% integral_value_symbolic = int(Taylor_sostituto, fi, a, b);
% 
% %funziona, non dà con char or str2num etc...
% disp(integral_value_symbolic); % symbolic
% %       &ì% Metodo 2, numerico
% f =matlabFunction(Taylor_sostituto) ; % la tua funzione integranda, espressa come funzione anonima
% 
% % a = ...; % Limite inferiore di integrazione
% % b = ...; % Limite superiore di integrazione
% integral_value_numeric = integral(f, a, b);
% 
% disp(integral_value_numeric);%%


%%abbiamo visto i passaggi completi con taylor e dopo integrale,
% ORa uso la funzione built in diretta
% FUNZIONE ELLITTICA PRIMA SPECIE completa di matlab = elliptick
% RIPORTO SU LA ELLIPTICK PER FARE IL PROGRAMMA COMPLETO
% k = sin(eta0); % Calcola k come il seno di m_costante
% K = ellipticK(k^2); % Passa k^2 a ellipticK
%disp(K); 

%Funzionew del pendolo;%ODEs% eta_ddot + sin(eta) = 0 ; 
function dydt = pendulum_ode(t, y, omega)
  %Mi serve zeros per inizializzare il vettore derivata dydt
  % {Dopo l'inizializzazione, i valori appropriati vengono assegnati a ciascun elemento di dydt. Per esempio:
  % dydt(1) = y(2); assegna il secondo elemento di y (che rappresenta dθ/dt; theta_dot;​ o la velocità angolare del pendolo) al primo elemento di dydt 
  % dydt(2) = -(g/l) * sin(y(1)); calcola il valore della seconda equazione differenziale (che rappresenta d2θ/dt2 o theta_ddot​) e lo assegna al secondo elemento di dydt. %}
    dydt = zeros(2,1); %crea un vettore di 0eri in colonna Dimensione(2x1)
    dydt(1) = y(2);                  % y1' = theta'
    dydt(2) = sin(y(1)) * omega;     % y2' = sin(theta) * omega
end