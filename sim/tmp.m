% The sampling frequency in Hz.
Fsam = 1500;

% Nyquist frequency, in Hz.
% The Nyquist frequency is half your sampling frequency.
Fnyq = Fsam/2;

% The cut-off frequency of your Low pass filter in Hz.
% This frequency must be greater than 0 and less than Fnyq.
Fc=1/2;

% Create a first-order Butterworth low pass.
% The returned vectors are of legth n.
% Thus a first order filter is created with n = 2.
[b,a]=butter(2, Fc/Fnyq);

% clear unused variables
clear("Fnyq", "Fc");


% Create a 5 seconds signal with 3 components:
% a 1 Hz and a 200 Hz sinusoidal component and some gaussian noise.
t=0:1/Fsam:5;
input=sin(2*pi*t) + sin(2*pi*200*t) + randn(size(t));

% Apply the filter to the input signal and plot input and output.
output=filter(b,a,input);
plot(t, [input; output])



