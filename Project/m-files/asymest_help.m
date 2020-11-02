%  
%    [Ap,Bp] = asymest(U,Y,nn,Delay) 
% 
%  This function estimates discrete-time model using ASYM
%
%  Input arguments:
%    U:		Input data vector, zero mean
%    Y:		Output data vector, zero mean
%    nn:	[na nb], model order
%    Delay:	Delay in samples
%
%  Output arguments:
%    Ap:	Denominator parameters in discrete-time
%    Bp:	Numeritor parameters, delay included
%
%  Copyright (c) 2001-2005, Yucai Zhu

