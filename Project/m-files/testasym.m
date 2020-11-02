
function [THasym,ErrASYM,BNDs,ERRfr,w] = testasym(Ao,Bo,N,nn,sn,n_sim,Delay)

%%%% testasym.m; M file for testing ASYM models
%
%   [THasym,ErrASYM,BNDs,ERRfr,w] = testasym(Ao,Bo,N,nn,sn,n_sim,Delay)
%
% This function compares the OE criterion of BJ model and of OE model 
%
%   Input arguments:
%	[Ao, Bo]:	Process polynomials
%	N:		Number of sumples to be simulated
%	nn:		[na nb] order of identified model
%	sn:		noise-to-signal ratio
%	n_sim:		number of simulations
%	Delay:		Delay, optional
%
%   Output arguments:
%	THasym:		Parameter vector of ASYM model
%	ErrASYM:		OE Error of ASYM model
%  BNDs:			Eroor bounds, 
%  ERRfr:		True frequency response error
%  w:				Frequency vector


THasym = [];
ErrASYM = [];
BNDs = [];
ERRfr = [];

if exist('Delay') == 0
  Delay = 0;
end

for k = 1:n_sim
  U = gbngen(N,8,1);
  Yo = filter(Bo,Ao,U);
  V = filter(1,[1 -.95],randn(N,1));
  V = V/std(V)*sqrt(sn)*std(Yo);
  Y = Yo + V;
  
  [Ap,Bp,BND,w] = sisoasym(U,Y,nn,Delay);
  yh = filter(Bp,Ap,U);
  ErrASYM = [ErrASYM;cov(Yo-yh)];
  THasym = [THasym; Ap Bp];
  BNDs = [BNDs BND];
  ERRfr = [ERRfr dfreq(Bo,Ao,w)-dfreq(Bp,Ap,w)]; 
end
