%%% gbnexercise.m; M file for GBN signal exercise %%%

% Create white noise GBN with N = 1000 and ETsw = 2 (psw = 1/2)
GBN1 = gbngen(1000,2);

% Create low-pass GBN with N = 1000 and ETsw = 10 (psw = 1/10)
GBN2 = gbngen(1000,10);

% Plot GBN1 and GBN2
figure;
subplot(211),plot(GBN1);
title('White noise GBN with ETsw = 2');
axis([0 500 -1.5 1.5]);
subplot(212),plot(GBN2);
title('Low-pass GBN with ETsw = 10');
axis([0 500 -1.5 1.5]);
xlabel('Samples')

% Create PRBS with M = 117 and Tclk = 8*T
PRBS2 = idinput(512,'PRBS',[6,1/8]);

% Calculate the spectra of GBN2 and PRBS2
w=[0:100]'/100*pi;
FIgbn2 = spa(GBN2,50,w);
FIgbn2 = FIgbn2.SpectrumData;
FIgbn2 = squeeze(FIgbn2);

FIprbs2 = spa(PRBS2,50,w);
FIprbs2 = FIprbs2.SpectrumData;
FIprbs2 = squeeze(FIprbs2);

% Plot the spectra of GBN2 and PRBS2
figure;
plot(w,FIgbn2,'-',w,FIprbs2,'--k');
xlabel('Frequency');
title('Spectra of low-pass GBN (solid) and low-pass PRBS (dashed)');
axis([0 pi 0 12]);

