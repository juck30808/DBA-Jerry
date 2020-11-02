%%% smmethod.m; M file for Steiglitz-McBride method %%%

function [Ap, Bp] = smmethod(U,Y,na,nb,Delay,iter)
%
%  function [Ap, Bp] = smmethod(U,Y,na,nb,Delay,iter)
%
%  This function estimates model using Steiglitz-McBride method.
%
%  Input arguments:
%    U:	     Vector of input signal	
%    Y:	     Vector of output signal	
%    na:     Degree of A polynomial (denominator)
%    nb:     Degree of B polynomial (numerator)
%    Delay:  Delay in samples
%    iter:   number of iterations
%
%  Output arguments:
%    Ap:     Parameter vector of A polynomial (denominator)
%    Bp:     Parameter vector of B polynomial (numerator)
%

Yf = Y; 
Uf = U;
for k = 1:iter
  THarx = arx([Yf Uf],[na nb Delay]);
  [Ap,Bp]=th2poly(THarx);
  Ap = fstab(Ap);
  Uf = filter(1,Ap,U);
  Yf = filter(1,Ap,Y);
end

