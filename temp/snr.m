F=5;

c=299792458;                #speed of light n vacuum (m/s)
pt=1;
Te=1e4;
k=1.38064852e-23;
G=10;
f=3e9;
lam=c/f;
sig=100;
B=1e6;
R=128;
snr_db=mag2db(pt*(db2mag(G)/2)^2*lam*lam*sig/((4*pi)^3*k*Te*B*db2mag(F)*R^4))
