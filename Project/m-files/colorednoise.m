%%% colorednoise.m; M file for generating colored noise %%%

% Create white Gaussian noise, N = 1000
WIT = randn(1000,1);

% Create white noise GBN with N = 1000 and ETsw = 2 (psw = 1/2)
GBN1 = gbngen(1000,2);

% Filter the signals and normalize them
WITf = filter(1,[1 -0.9],WIT);
WITf = (WITf - mean(WITf))/std(WITf);
GBN1f = filter(1,[1 -0.9],GBN1);
GBN1f = (GBN1f - mean(GBN1f))/std(GBN1f);

% Calculate crest factors
FacWITf = max((WITf).^2)/cov(WITf);
FacGBN1f = max((GBN1f).^2)/cov(GBN1f);

% Plot the signals
figure;
subplot(211),plot(WITf);
title(['Filtered white noise, CrestFac = ',num2str(FacWITf)]);
axis([0 1000 -4 4]);
xlabel('Samples')
subplot(212),plot(GBN1f);
title(['Filtered white GBN, CrestFac = ',num2str(FacGBN1f)]);
axis([0 1000 -4 4]);
xlabel('Samples')

