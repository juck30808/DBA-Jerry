%%% prbssignal.m; M file for generating PRBS signals %%%

% Create PRBS with M = 511 and Tclk = T
PRBS1 = idinput(512,'PRBS',[8,1]);

% Create PRBS with M = 117 and Tclk = 8*T
PRBS2 = idinput(512,'PRBS',[6,1/8]);

% Calculate the spectra
w=[0:100]'/100*pi;
FI1 = spa(PRBS1,50,w);
FI1 = FI1.SpectrumData;
FI1 = squeeze(FI1);
FI2 = spa(PRBS2,50,w);
FI2 = FI2.SpectrumData;
FI2 = squeeze(FI2);

% Plot PRBS1 and its spectrum
figure;
subplot(211),plot(PRBS1);
title('PRBS with M = 511, Tclk = T');
xlabel('Samples');
axis([0 520 -1.5 1.5]);
subplot(212),plot(w,FI1);
ylabel('Spectrum');
xlabel('Frequency');
axis([0 pi 0 2]);

% Plot PRBS2 and its spectrum
figure;
subplot(211),plot(PRBS2);
title('PRBS with M = 63, Tclk = 8*T');
xlabel('Samples');
axis([0 520 -1.5 1.5]);
subplot(212),plot(w,FI2);
ylabel('Spectrum');
xlabel('Frequency');
axis([0 pi 0 10]);

