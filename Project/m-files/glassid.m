%%% glassid.m; identification exercise of the glass tube drawing process %%%
function [ERRvaloe,FPEoe,FOEoe,ERRvalbj,FPEbj,...
                            FOEbj,ERRvalabc,FPEabc,FOEabc] = glassid();

% Load dada
load glassdata2

ERRvaloe = [];FPEoe = [];FOEoe = [];
ERRvalbj = [];FPEbj = [];FOEbj = [];
ERRvalabc = [];FPEabc = [];FOEabc = [];
N = length(Uest);
ords = 1:20;
iter = 30;

% Loop with increasing order
for n = ords
 
  % Model estimation
  TH1oe = oe([Yest(:,1) Uest],[n n n n 1 1],iter); 
  TH2oe = oe([Yest(:,2) Uest],[n n n n 1 1],iter); 
  TH1bj = bj([Yest(:,1) Uest],[n n n n n n 1 1],iter); 
  TH2bj = bj([Yest(:,2) Uest],[n n n n n n 1 1],iter); 
  TH1abc = armax([Yest(:,1) Uest],[n n n n 1 1],iter); 
  TH2abc = armax([Yest(:,2) Uest],[n n n n 1 1],iter); 

  % Get FPE
  FPEbj = [FPEbj;TH1bj(2,1) TH2bj(2,1)];
  FPEoe = [FPEoe;TH1oe(2,1) TH2oe(2,1)];
  FPEabc = [FPEabc;TH1abc(2,1) TH2abc(2,1)];

  % Calculate FOE
  fact = (N+3*n)/(N-3*n);
  Ye1oe = idsim(Uest,TH1oe);
  Ye2oe = idsim(Uest,TH2oe);
  FOEoe = [FOEoe; fact*cov(Yest(:,1)-Ye1oe) fact*cov(Yest(:,2)-Ye2oe)];
  Ye1bj = idsim(Uest,TH1bj);
  Ye2bj = idsim(Uest,TH2bj);
  FOEbj = [FOEbj; fact*cov(Yest(:,1)-Ye1bj) fact*cov(Yest(:,2)-Ye2bj)];
  Ye1abc = idsim(Uest,TH1abc);
  Ye2abc = idsim(Uest,TH2abc);
  FOEabc = [FOEabc; fact*cov(Yest(:,1)-Ye1abc) fact*cov(Yest(:,2)-Ye2abc)];

  % Calculate OE criterion using validation data
  Y1oe = idsim(Uval,TH1oe);
  Y2oe = idsim(Uval,TH2oe);
  Y1bj = idsim(Uval,TH1bj);
  Y2bj = idsim(Uval,TH2bj);
  Y1abc = idsim(Uval,TH1abc);
  Y2abc = idsim(Uval,TH2abc);
  Erroe = [cov(Y1oe-Yval(:,1))/cov(Yval(:,1)) cov(Y2oe-Yval(:,2))/cov(Yval(:,2))];
  ERRvaloe = [ERRvaloe;Erroe];
  Errbj = [cov(Y1bj-Yval(:,1))/cov(Yval(:,1)) cov(Y2bj-Yval(:,2))/cov(Yval(:,2))];
  ERRvalbj = [ERRvalbj;Errbj];
  Errabc=[cov(Y1abc-Yval(:,1))/cov(Yval(:,1)) cov(Y2abc-Yval(:,2))/cov(Yval(:,2))];
  ERRvalabc = [ERRvalabc;Errabc];
  disp(['n = ',num2str(n)])
end

% Plot error criteria 
figure
subplot(321),plot(ords,ERRvaloe(:,1))
title('Output error method, y1')
ylabel('OE, val. data')
subplot(322),plot(ords,ERRvaloe(:,2))
title('Output error method, y2')
subplot(323),plot(ords,FOEoe(:,1))
ylabel('FOE')
subplot(324),plot(ords,FOEoe(:,2))
subplot(325),plot(ords,FPEoe(:,1))
ylabel('FPE'),xlabel('Model degree')
subplot(326),plot(ords,FPEoe(:,2))
xlabel('Model degree')

figure
subplot(321),plot(ords,ERRvalbj(:,1))
title('Box-Jenkins method, y1')
ylabel('OE, val. data')
subplot(322),plot(ords,ERRvalbj(:,2))
title('Box-Jenkins method, y2')
subplot(323),plot(ords,FOEbj(:,1))
ylabel('FOE')
subplot(324),plot(ords,FOEbj(:,2))
subplot(325),plot(ords,FPEbj(:,1))
ylabel('FPE'),xlabel('Model degree')
subplot(326),plot(ords,FPEbj(:,2))
xlabel('Model degree')

figure
subplot(321),plot(ords,ERRvalabc(:,1))
title('ARMAX model, y1')
ylabel('OE, val. data')
subplot(322),plot(ords,ERRvalabc(:,2))
title('ARMAX model, y2')
subplot(323),plot(ords,FOEabc(:,1))
ylabel('FOE')
subplot(324),plot(ords,FOEabc(:,2))
subplot(325),plot(ords,FPEabc(:,1))
ylabel('FPE'),xlabel('Model degree')
subplot(326),plot(ords,FPEabc(:,2))
xlabel('Model degree')

