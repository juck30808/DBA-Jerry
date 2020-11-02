function Fr = dfreq(Bp,Ap,W)

%   Fr = dfreq(Bp,Ap,W)
%
%  This function calculates frequency responses of a SISO discrete-time model.
%  Ap is the denominator polynomial, Bp is the numerator polynomial, vector W 
%  contains frequency in radians (between 0 and pi)
%

i = sqrt(-1);
Fr = polyval(Bp,exp(i*W))./polyval(Ap,exp(i*W));

