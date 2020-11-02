
%  
%    [Ap,Bp,BND,w] = sisoasym(U,Y,nn,Delay) 
% 
%  This function estimates SISO discrete-time model using ASYM. Open loop version 
%
%  Input arguments:
%    U:		Input data vector
%    Y:		Output data vector
%    nn:	[na nb], model order
%    Delay:	Delay in samples
%
%  Output arguments:
%    Ap:	Denominator parameters in discrete-time
%    Bp:	Numeritor parameters, delay included
%    BND:	Upper error bound of frequency response
%    w:		Frequency points for BND, in logrithm scale
%
%  Copyright (c) 2001-2005, Yucai Zhu

