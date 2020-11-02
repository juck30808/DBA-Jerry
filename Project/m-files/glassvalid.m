%%% glassvalid.m; model validation for the glass tube process %%%

% Load dada
load glassdata2
N = length(Uval);
iter = 30;

% Model estimation and residual analysis
TH1oe6 = oe([Yest(:,1) Uest],[6 6 6 6 1 1],iter); 
TH2oe4 = oe([Yest(:,2) Uest],[4 4 4 4 1 1],iter); 
TH1oe14 = oe([Yest(:,1) Uest],[14 14 14 14 1 1],iter); 
TH2oe15 = oe([Yest(:,2) Uest],[15 15 15 15 1 1],iter); 

TH1bj7 = bj([Yest(:,1) Uest],[7 7 7 7 7 7 1 1],iter); 
TH2bj4 = bj([Yest(:,2) Uest],[4 4 4 4 4 4 1 1],iter);
TH1bj14 = bj([Yest(:,1) Uest],[14 14 4 4 14 14 1 1],40); 
TH2bj19 = bj([Yest(:,2) Uest],[19 19 4 4 19 19 1 1],40); 

disp('Press "Enter"')
[E1oe6,R1oe6]=resid([Yval(:,1) Uval],TH1oe6);
disp('Press "Enter"')
[E2oe4,R2oe4]=resid([Yval(:,2) Uval],TH2oe4);
disp('Press "Enter"')
[E1oe14,R1oe14]=resid([Yval(:,1) Uval],TH1oe14);
disp('Press "Enter"')
[E2oe15,R2oe15]=resid([Yval(:,2) Uval],TH2oe15);
disp('Press "Enter"')
[E1bj7,R1bj7]=resid([Yval(:,1),Uval], TH1bj7);
disp('Press "Enter"')
[E2bj4,R2bj4]=resid([Yval(:,2),Uval], TH2bj4);
disp('Press "Enter"')
[E1bj14,R1bj14]=resid([Yval(:,1),Uval], TH1bj14);
disp('Press "Enter"')
[E2bj19,R2bj19]=resid([Yval(:,2),Uval], TH2bj19);

% Simulations and plots

% Simulation with low order model
Y1oe6 = idsim(Uval,TH1oe6);
Err1oe6 = 100*cov(Yval(:,1)-Y1oe6)/cov(Yval(:,1));
Y2oe4 = idsim(Uval,TH2oe4);
Err2oe4 = 100*cov(Yval(:,2)-Y2oe4)/cov(Yval(:,2));
Y1bj7 = idsim(Uval,TH1bj7);
Err1bj7 = 100*cov(Yval(:,1)-Y1bj7)/cov(Yval(:,1));
Y2bj4 = idsim(Uval,TH2bj4);
Err2bj4 = 100*cov(Yval(:,2)-Y2bj4)/cov(Yval(:,2));

% Simulation using high order model
Y1oe14 = idsim(Uval,TH1oe14);
Err1oe14 = 100*cov(Yval(:,1)-Y1oe14)/cov(Yval(:,1));
Y2oe15 = idsim(Uval,TH2oe15);
Err2oe15 = 100*cov(Yval(:,2)-Y2oe15)/cov(Yval(:,2));
Y1bj14 = idsim(Uval,TH1bj14);
Err1bj14 = 100*cov(Yval(:,1)-Y1bj14)/cov(Yval(:,1));
Y2bj19 = idsim(Uval,TH2bj19);
Err2bj19 = 100*cov(Yval(:,2)-Y2bj19)/cov(Yval(:,2));

% Calculate step responses
STP1 = [ones(100,1) zeros(100,1)];
STP2 = [zeros(100,1) ones(100,1)];
STP11oe6 = idsim(STP1,TH1oe6);
STP12oe6 = idsim(STP2,TH1oe6);
STP21oe4 = idsim(STP1,TH2oe4);
STP22oe4 = idsim(STP2,TH2oe4);
STP11oe14 = idsim(STP1,TH1oe14);
STP12oe14 = idsim(STP2,TH1oe14);
STP21oe15 = idsim(STP1,TH2oe15);
STP22oe15 = idsim(STP2,TH2oe15);
STP11bj7 = idsim(STP1,TH1bj7);
STP12bj7 = idsim(STP2,TH1bj7);
STP21bj4 = idsim(STP1,TH2bj4);
STP22bj4 = idsim(STP2,TH2bj4);
STP11bj14 = idsim(STP1,TH1bj14);
STP12bj14 = idsim(STP2,TH1bj14);
STP21bj19 = idsim(STP1,TH2bj19);
STP22bj19 = idsim(STP2,TH2bj19);

resid2(R1oe6,'y1, OE, deg 6');
resid2(R2oe4,'y2, OE, deg 4');
resid2(R1oe14,'y1, OE, deg 14');
resid2(R2oe15,'y2, OE, deg 15');
resid2(R1bj7,'y1, BJ, deg. 7');
resid2(R2bj4,'y2, BJ, deg. 4');
resid2(R1bj7,'y1, BJ, deg. 14');
resid2(R2bj19,'y2, BJ, deg. 19');

tt=1:N;
figure,
subplot(211),plot(tt,Yval(:,1),'-b',tt,Y1oe6,'--r',tt,Y1oe14,'-.k');
title(['Fit of OE models, fresh data, errors ',num2str(Err1oe6),'%, ',num2str(Err1oe14),'%'])
ylabel('Thickness')
subplot(212),plot(tt,Yval(:,2),'-b',tt,Y2oe4,'--r',tt,Y2oe15,'-.k');
title(['Fit of OE models, fresh data, errors ',num2str(Err2oe4),'%, ',num2str(Err2oe15),'%'])
ylabel('Diameter'),xlabel('Samples')

figure,
subplot(211),plot(tt,Yval(:,1),'-b',tt,Y1bj7,'--r',tt,Y1bj14,'-.k');
title(['Fit of BJ models, fresh data, errors ',num2str(Err1bj7),'%, ',num2str(Err1bj14),'%'])
ylabel('Thickness')
subplot(212),plot(tt,Yval(:,2),'-b',tt,Y2bj4,'--r',tt,Y2bj19,'-.k');
title(['Fit of BJ models, fresh data, errors ',num2str(Err2bj4),'%, ',num2str(Err2bj19),'%'])
ylabel('Diameter'),xlabel('Samples')

t=1:100;
figure
subplot(221),plot(t,STP11oe6,'-b',t,STP11oe14,'--k',t,STP11bj7,'-.b',t,STP11bj14,':r')
title('Pressure'),ylabel('Thickness')
subplot(222),plot(t,STP12oe6,'-b',t,STP12oe14,'--k',t,STP12bj7,'-.b',t,STP12bj14,':r')
title('Draw speed')
subplot(223),plot(t,STP21oe4,'-b',t,STP21oe15,'--k',t,STP21bj4,'-.b',t,STP21bj19,':r')
ylabel('Diameter'),xlabel('Samples')
subplot(224),plot(t,STP22oe4,'-b',t,STP22oe15,'--k',t,STP22bj4,'-.b',t,STP22bj19,':r')
xlabel('Samples')

