function MJD = culTime(Y,M,D,h,N,S)
MJD = (-678987) + 367 * Y;
MJD = MJD - fix((7*(Y + fix((M + 9)/12)))/4);
MJD = MJD + fix((275 * M)/9);
MJD = MJD + D + ((h-8)/24) + (N/1440) + (S/86400);
end