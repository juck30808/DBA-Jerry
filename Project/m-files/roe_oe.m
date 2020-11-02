function [THoe,THroe] = roe_oe(Ao,Bo,N,n,sn,n_sim,Delay)
%%% roe_oe.m; M file for comparing ROE and OE models %%%
%
%    [THoe,THroe] = roe_oe(Ao,Bo,N,n,sn,n_sim,Delay)
%
% This function compares the accuracies of recursive OE model and 
% of off-line OE model 
%
%   Input arguments:
%	[Ao, Bo]:	Process polynomials
%	N:		Number of sumples to be simulated
%	n:		Order of identified model
%	sn:		noise-to-signal ratio
%	n_sim:		number of simulations
%
%   Output arguments:
%	THoe:		Parameter vector of OE model
%	THroe:		Parameter vector of recursive OE model
%

THoe = [];
THroe = [];
ErrOE = [];
ErrROE = [];
if exist('Delay') == 0
  Delay = 0;
end

for k = 1:n_sim
  U = gbngen(N,8,1);
  Yo = filter(Bo,Ao,U);
  V = filter(1,[1 -.9],randn(N,1));
  V = V/std(V)*sqrt(sn)*std(Yo);
  Y = Yo + V;
  thOE = oe([Y U],[n n Delay]);
  [a,boe,c,d,foe]=th2poly(thOE);
  yoe = filter(boe,foe,U);
  ErrOE = [ErrOE;cov(Yo-yoe)];
  THoe = [THoe;foe boe];

  thROE = roe([Y U],[n n Delay],'ff',1);
  broe = [zeros(1,Delay) thROE(N,1:n)];
  froe = [1 thROE(N,n+1:2*n)];
  yroe = filter(broe,froe,U);
  ErrROE = [ErrROE;cov(Yo-yroe)];
  THroe = [THroe; froe broe];
end

