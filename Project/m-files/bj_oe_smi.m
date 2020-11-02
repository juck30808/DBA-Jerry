
function [THoe,ErrOE,THbj,ErrBJ,THSMI,ErrSMI] = bj_oe_SMI(Ao,Bo,N,n,sn,n_sim,Delay)

%%%% bj_oe_SMI.m; M file for comparing the OE criteria of BJ, OE and SMI models
%
%   [THoe,ErrOE,THbj,ErrBJ,THSMI,ErrSMI] = bj_oe_SMI(Ao,Bo,N,n,sn,n_sim,Delay)
%
% This function compares the OE criterion of BJ model, OE model and SMI model
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
%	THbj:		Parameter vector of BJ model
%	ErrBJ:		OE Error of BJ model
%	THSMI:		Parameter vector of SMI model
%	ErrSMI:	OE Error of SMI model
%



THoe = [];
THbj = [];
THSMI = [];
ErrOE = [];
ErrBJ = [];
ErrSMI = [];

if exist('Delay') == 0
  Delay = 0;
end

for k = 1:n_sim
   
  % Simulation
  U = gbngen(N,8,1);
  Yo = filter(Bo,Ao,U);
  V = filter(1,[1 -.95],randn(N,1));
  V = V/std(V)*sqrt(sn)*std(Yo);
  Y = Yo + V;
  
  % Estimate output error model
  thOE = oe([Y U],[n+1 n Delay],15);
  [a,boe,c,d,foe] = th2poly(thOE);
  yoe = filter(boe,foe,U);
  ErrOE = [ErrOE;cov(Yo-yoe)];
  THoe = [THoe; foe boe];

  % Estimate Box-Jenkins model
  thBJ = bj([Y U],[n+1 1 1 n Delay],15);
  [a,bbj,c,d,fbj] = th2poly(thBJ);
  ybj = filter(bbj,fbj,U);
  ErrBJ = [ErrBJ;cov(Yo-ybj)];
  THbj = [THbj; fbj bbj];
  
  % Estimate SMI model
  Ud = [zeros(Delay,1);U(1:N-Delay)];  % Add delay
  [A,B,C,D] = moesp(Ud,Y,n);
  [bSMI,aSMI] = ss2tf(A,B,C,D,1);
  ySMI = filter(bSMI,aSMI,Ud);
  ErrSMI = [ErrSMI;cov(Yo-ySMI)];
  THSMI = [THSMI; aSMI bSMI];
end
