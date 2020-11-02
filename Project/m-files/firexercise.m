%%% firexercise.m; M file for FIR model estimation %%%

function [] = firexercise( )

% Create low-pass GBN with N = 500, 400 and ETsw = 8
U_est = gbngen(500,8);
U_eval = gbngen(400,8);

% Simulate the process
Ao = [1 -1.5 0.7];
Bo = [0 1 0.5];
Yo_est = filter(Bo,Ao,U_est);
Yo_eval = filter(Bo,Ao,U_eval);

% Add 5% output disturbance
v_est = filter(1,[1 -0.9],randn(500,1));
v_est = v_est/std(v_est)*sqrt(0.05)*std(Yo_est);
Y_est = Yo_est + v_est;
v_eval = filter(1,[1 -0.9],randn(400,1));
v_eval = v_eval/std(v_eval)*sqrt(0.05)*std(Yo_eval);
Y_eval = Yo_eval + v_eval;

% Estimate FIR models with n = 4, 20
THfir4 = arx([Y_est U_est],[0 4 1]);
THfir20 = arx([Y_est U_est],[0 20 1]);

% Simulation of the models
Yh_est4 = idsim(U_est,THfir4);
Yh_est20 = idsim(U_est,THfir20);
Yh_eval4 = idsim(U_eval,THfir4);
Yh_eval20 = idsim(U_eval,THfir20);

% Calculate step responses
STPo = filter(Bo,Ao,ones(50,1));
STP4 = idsim(ones(50,1),THfir4);
STP20 = idsim(ones(50,1),THfir20);

% Plot model fit
t_est=1:500;
t_eval=1:400;
figure;
subplot(221),plot(t_est,Y_est,'-r',t_est,Yh_est4,'--b');
title('4th order FIR, est. data');
axis([0 500 -20 20])
subplot(222),plot(t_eval,Y_eval,'-r',t_eval,Yh_eval4,'--b');
title('4th order FIR, eval. data');
axis([0 400 -20 20])
subplot(223),plot(t_est,Y_est,'-r',t_est,Yh_est20,'--b');
title('20th order FIR, est. data');
axis([0 500 -20 20])
xlabel('Samples')
subplot(224),plot(t_eval,Y_eval,'-r',t_eval,Yh_eval20,'--b');
title('20th order FIR, eval. data');
axis([0 400 -20 20])
xlabel('Samples')

% Plot step responses
figure;
subplot(211),plot(1:50,STPo,'-r',1:50,STP4,'--b');
title('Step responses of the process (solid) and of 4th order FIR');
subplot(212),plot(1:50,STPo,'-r',1:50,STP20,'--b');
title('Step responses of the process (solid) and of 20th order FIR');
xlabel('Samples')

