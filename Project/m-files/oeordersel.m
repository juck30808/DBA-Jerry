%%% oeordersel.m; M file for output error model order selection %%%

function [] = oeordersel( )

% Create low-pass GBN with ETsw = 8
N = 1000;
N1 = 500;
U = gbngen(N,8);

% Simulate the process
Ao = [1 -1.5 0.7];
Bo = [0 1 0.5];
Yo = filter(Bo,Ao,U);

% Add output disturbances
v = filter(1,[1 -0.9],randn(N,1));
v001 = v/std(v)*sqrt(0.001)*std(Yo);
Y001 = Yo + v001;
v01 = v/std(v)*sqrt(0.01)*std(Yo);
Y01 = Yo + v01;
v10 = v/std(v)*sqrt(0.1)*std(Yo);
Y10 = Yo + v10;
v50 = v/std(v)*sqrt(0.5)*std(Yo);
Y50 = Yo + v50;

% Estimate OE models between orders 1 and 8
% and caculate output error loss functions

for k = 1:8
  THoe001 = oe([Y001(1:N1) U(1:N1)],[k k 1]);
  Error001 = Y001 - idsim(U,THoe001);
  V001_est(k) = cov(Error001(1:N1));
  V001_eval(k) = cov(Error001(N1+1:N));
  THoe01 = oe([Y01(1:N1) U(1:N1)],[k k 1]);
  Error01 = Y01 - idsim(U,THoe01);
  V01_est(k) = cov(Error01(1:N1));
  V01_eval(k) = cov(Error01(N1+1:N));
  THoe10 = oe([Y10(1:N1) U(1:N1)],[k k 1]);
  Error10 = Y10 - idsim(U,THoe10);
  V10_est(k) = cov(Error10(1:N1));
  V10_eval(k) = cov(Error10(N1+1:N));
  THoe50 = oe([Y50(1:N1) U(1:N1)],[k k 1]);
  Error50 = Y50 - idsim(U,THoe50);
  V50_est(k) = cov(Error50(1:N1));
  V50_eval(k) = cov(Error50(N1+1:N));
end

% Plot outpur error loss functions
figure;
subplot(221),plot(1:8,V001_eval,'-r',1:8,V001_est,'--b');
title('Order test, 0.1% noise');
xlabel('Model order')
subplot(222),plot(1:8,V01_eval,'-r',1:8,V01_est,'--b');
title('Order test, 1% noise');
xlabel('Model order')
subplot(223),plot(1:8,V10_eval,'-r',1:8,V10_est,'--b');
title('Order test, 10% noise');
xlabel('Model order')
subplot(224),plot(1:8,V50_eval,'-r',1:8,V50_est,'--b');
title('Order test, 50% noise');
xlabel('Model order')

