%%% foe_fpe.m; M file for comparing FOE and FPE

function [FOEbj,FPEbj,TOEbj] = foe_fpe(Ao,Bo,N,sn,n_sim,Delay)

%
%    [FOEbj,FPEbj,TOEbj] = foe_fpe(Ao,Bo,N,sn,n_sim,Delay)
%
% This function compares the FOE and FPE criterion of BJ model 
%
%   Input arguments:
%	[Ao, Bo]:	Process model polynomials
%	N:		Number of sumples to be simulated
%	sn:		noise-to-signal ratio
%	n_sim:		number of simulations
%	Delay:		Delay, optional
%
%   Output arguments:
%	FOEbj:		FOE Error of the BJ models
%	FPEbj:		FPE of the BJ models
%	TOEbj:		True (noise-free) OE of BJ models
%

FOEbj = []; 
FPEbj = []; 
TOEbj = [];

if exist('Delay') == 0
  Delay = 0;
end

for k = 1:n_sim
  U = gbngen(N,10);
  Yo = filter(Bo,Ao,U);
  V = filter([1],[1 -.9],randn(N,1));
  V = V/std(V)*sqrt(sn)*std(Yo);
  Y = Yo + V;

  FOEtem = zeros(1,10);
  FPEtem = zeros(1,10);
  TOEtem = zeros(1,10);

  for n = 1:10
    thBJ = bj([Y U],[n n n n Delay]);
    ybj = idsim(U,thBJ);
    FOEtem(n) = (N+4*n)/(N-4*n)*cov(Y-ybj);
    FPEtem(n) = thBJ(2,1);
    TOEtem(n) = cov(Yo-ybj);
  end

  FOEbj = [FOEbj;FOEtem];
  FPEbj = [FPEbj;FPEtem];
  TOEbj = [TOEbj;TOEtem];

end

