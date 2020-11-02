%%% testiv.m; M file for testing instrumental variable method %%%

function [ ] = testiv( )
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
THoec1=oe([Yc1 U],[2 2 1]);
[a,Boec1,c,d,Aoec1]=th2poly(THoec1);
THoec2=oe([Yc2 U],[2 2 1]);
[a,Boec2,c,d,Aoec2]=th2poly(THoec2);

THivw=iv4([Yw U],[2 2 1]);
[Aivw,Bivw]=th2poly(THivw);
THivc1=iv4([Yc1 U],[2 2 1]);
[Aivc1,Bivc1]=th2poly(THivc1);
THivc2=iv4([Yc2 U],[2 2 1]);
[Aivc2,Bivc2]=th2poly(THivc2);

% Calculate step responses and plot them
STPo=filter(Bo,Ao,ones(70,1));
STPoew=filter(Boew,Aoew,ones(70,1));
STPivw=filter(Bivw,Aivw,ones(70,1));
STPoec1=filter(Boec1,Aoec1,ones(70,1));
STPivc1=filter(Bivc1,Aivc1,ones(70,1));
STPoec2=filter(Boec2,Aoec2,ones(70,1));
STPivc2=filter(Bivc2,Aivc2,ones(70,1));
t=1:70;
figure;
subplot(311), plot(t,STPo,'-r',t,STPoew,'--b',t,STPivw,'-.k')
legend('true one','OE model','IV model')
title('Step responses, white noise case')
subplot(312), plot(t,STPo,'-r',t,STPoec1,'--b',t,STPivc1,'-.k')
legend('true one','OE model','IV model')
title('Step responses, wide band clored noise')
subplot(313), plot(t,STPo,'-r',t,STPoec2,'--b',t,STPivc2,'-.k')
legend('true one','OE model','IV model')
title('Step responses, narrow band clored noise')
xlabel('Samples')

