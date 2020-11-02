%%% bj_oe.m; M file for comparing the OE criteria of BJ and OE models

function [THoe,ErrOE,THbj,ErrBJ] = bj_oe(Ao,Bo,N,n,sn,n_sim,Delay)

%
%    [THoe,ErrOE,THbj,ErrBJ] = bj_oe(Ao,Bo,N,n,sn,n_sim,Delay)
%
% This function compares the OE criterion of BJ model and of OE model 
%
%   Input arguments:
%	[Ao, Bo]:	Process polynomials
%	N:		Number of sumples to be simulated
%	n:		Order of identified model
%	sn:		noise-to-signal ratio
%	n_sim:		number of simulations
%	Delay:		Delay, optional
%
%   Output arguments:
%	THoe:		Parameter vector of OE model
%	ErrOE:		OE Error of OE model
%	THbj:		Parameter vector of bj model
%	ErrBJ:		OE Error of BJ model
%


THoe = [];
THbj = [];
ErrOE = [];
ErrBJ = [];

if exist('Delay') == 0
  Delay = 0;
end

for k = 1:n_sim
  U = gbngen(N,8,1);
  Yo = filter(Bo,Ao,U);
  V = filter(1,[1 -.95],randn(N,1));
  V = V/std(V)*sqrt(sn)*std(Yo);
  Y = Yo + V;
  thOE = oe([Y U],[n n Delay]);
  [a,boe,c,d,foe]=th2poly(thOE);
  yoe = filter(boe,foe,U);
  ErrOE = [ErrOE;cov(Yo-yoe)];
  THoe = [THoe; foe boe];

  thBJ = bj([Y U],[n 1 1 n Delay]);
  [a,bbj,c,d,fbj]=th2poly(thBJ);
  ybj = filter(bbj,fbj,U);
  ErrBJ = [ErrBJ;cov(Yo-ybj)];
  THbj = [THbj; fbj bbj];
end


