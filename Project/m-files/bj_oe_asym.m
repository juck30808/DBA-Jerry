
function [THoe,ErrOE,THbj,ErrBJ,THasym,ErrASYM] = bj_oe_asym(Ao,Bo,N,n,sn,n_sim,Delay)

%%%% bj_oe_asym.m; M file for comparing the OE criteria of BJ, OE and ASYM models
%
%   [THoe,ErrOE,THbj,ErrBJ,THasym,ErrASYM] = bj_oe_asym(Ao,Bo,N,n,sn,n_sim,Delay)
%
% This function compares the OE criterion of BJ model, OE model and ASYM model
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
%	THasym:		Parameter vector of ASYM model
%	ErrASYM:	OE Error of ASYM model
%



THoe = [];
THbj = [];
THasym = [];
ErrOE = [];
ErrBJ = [];
ErrASYM = [];


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
  thOE = oe([Y U],[n n Delay],15);
  [a,boe,c,d,foe] = th2poly(thOE);
  yoe = filter(boe,foe,U);
  ErrOE = [ErrOE;cov(Yo-yoe)];
  THoe = [THoe; foe boe];

  % Estimate Box-Jenkins model
  thBJ = bj([Y U],[n n n n Delay],15);
  [a,bbj,c,d,fbj] = th2poly(thBJ);
  ybj = filter(bbj,fbj,U);
  ErrBJ = [ErrBJ;cov(Yo-ybj)];
  THbj = [THbj; fbj bbj];
  
  % Estimate ASYM model
  [Aasym,Basym] = asymest(U,Y,[n n],Delay);
  yasym = filter([zeros(1,Delay) Basym],Aasym,U);
  ErrASYM = [ErrASYM;cov(Yo-yasym)];
  THasym = [THasym; Aasym Basym];

end
