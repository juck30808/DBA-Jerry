%%% testoebj.m; M file for testing output error and Box-Jenkins methods %%%

function [ ] = testoebj( )
% Simulate the process using GBN signal with Tsw = 8
Ao = [1 -1.5 0.7];
Bo = [0 1 0.5];
U = gbngen(500,8);
Yo = filter(Bo,Ao,U);

% Add disturbances
Vw = randn(500,1);
Vc1=filter(1,[1 -0.6],randn(500,1));
Vc2=filter(1,[1 -0.9],randn(500,1));
Vw=Vw/std(Vw)*std(Yo)*sqrt(0.1);
Vc1=Vc1/std(Vc1)*std(Yo)*sqrt(0.1);
Vc2=Vc2/std(Vc2)*std(Yo)*sqrt(0.1);
Yw=Yo+Vw;
Yc1=Yo+Vc1;
Yc2=Yo+Vc2;

% Estimate the models
THoew=oe([Yw U],[2 2 1]);
[a,Boew,c,d,Aoew]=th2poly(THoew);
[Abjw,Bbjw]=bj_sm(U,Yw,2,2,1,20);
THoec1=oe([Yc1 U],[2 2 1]);
[a,Boec1,c,d,Aoec1]=th2poly(THoec1);
[Abjc1,Bbjc1]=bj_sm(U,Yc1,2,2,1,20);
THoec2=oe([Yc2 U],[2 2 1]);
[a,Boec2,c,d,Aoec2]=th2poly(THoec2);
[Abjc2,Bbjc2]=bj_sm(U,Yc2,2,2,1,20);

% Calculate step responses and plot them
STPo=filter(Bo,Ao,ones(70,1));
STPoew=filter(Boew,Aoew,ones(70,1));
STPbjw=filter(Bbjw,Abjw,ones(70,1));
STPoec1=filter(Boec1,Aoec1,ones(70,1));
STPbjc1=filter(Bbjc1,Abjc1,ones(70,1));
STPoec2=filter(Boec2,Aoec2,ones(70,1));
STPbjc2=filter(Bbjc2,Abjc2,ones(70,1));
t=1:70;
figure;
subplot(311), plot(t,STPo,'-r',t,STPoew,'--b',t,STPbjw,'-.k')
legend('true one','OE model','BJ model')
title('Step responses, white noise case')
subplot(312), plot(t,STPo,'-r',t,STPoec1,'--b',t,STPbjc1,'-.k')
legend('true one','OE model','BJ model')
title('Step responses, wide band clored noise')
subplot(313), plot(t,STPo,'-r',t,STPoec2,'--b',t,STPbjc2,'-.k')
legend('true one','OE model','BJ model')
title('Step responses, narrow band clored noise')
xlabel('Samples')

