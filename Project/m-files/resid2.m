function [ ]=resid2(z,Yname)

%   RESID2(R,Yname)
%
%  Plot the residuals associated with a MISO model.
%

if exist('Yname') ~= 1, Yname = 'y'; end

[nz2,M1]=size(z);nz=sqrt(nz2);M=M1-2;N=z(1,M1-1);
ny=z(1,M1);nu=nz-ny;r=z(:,1:M);

nr=0:M-1;
ky=1;
ind=ky+(ky-1)*nz;
% ** Confidence interval for the autocovariance function **
sdre=2.58*(r(ind,1))/sqrt(N)*ones(M,1);

% nz==1,spin=111;else spin=210+plotind+1;

figure, subplot(nz,1,1)
plot(nr,r(ind,:)'/r(ind,1),nr,[ sdre -sdre]/r(ind,1),':r')
title(['Auto-corr. function of residuals of ',Yname])
% xlabel('lag')

%plotind=rem(plotind+1,2);
%if plotind==0,pause,newplot;end
%end

nr=-M+1:M-1;
% *** Compute confidence lines for the cross-covariance functions **
for ku=1:nu
  ind1=ky+(ny+ku-1)*nz;ind2=ny+ku+(ky-1)*nz;indy=ky+(ky-1)*nz;
  indu=(ny+ku)+(ny+ku-1)*nz;
   %corr 891007
   sdreu=2.58*sqrt(r(indy,1)*r(indu,1)+2*(r(indy,2:M)*r(indu,2:M)'))/sqrt(N)*ones(2*M-1,1); % corr 890927
%   spin=210+plotind+1;subplot(spin)
   subplot(nz,1,ku+1)
   plot(nr,[r(ind1,M:-1:1) r(ind2,2:M) ]'/(sqrt(r(indy,1)*r(indu,1))),...
        nr,[ sdreu -sdreu]/(sqrt(r(indy,1)*r(indu,1))),':r' )

   title(['Cross-corr. func. between u',int2str(ku),' and residuals of ',Yname])
end
   xlabel('lag')

% r(1,M+1:M+2)=[N,ny];
% set(gcf,'NextPlot','replace');

