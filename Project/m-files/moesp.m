function [A,B,C,D,x0] = moesp(U,Y,n);
%
%%% M file moesp.m
%
% This function estimate state space model using subapce method MOESP.
%
%   Inputs arguments:
%      U:		Input vector or matrix (column wise)
%      Y:		Output vector or matrix (column wise)
%      n:		Order of the model
%
%   Output arguments:
%      [A,B,C,D]: 	State space model
%      x0:		Initial state
%

s = n+1;
%[S,R]=dordpo(U,Y,s);
%[A,C]=dmodpo(R,n);
[S,R]=dordpi(U,Y,s);
[A,C]=dmodpi(R,n);
[B,D]=dac2bd(A,C,U,Y);
x0=dinit(A,B,C,D,U,Y);

