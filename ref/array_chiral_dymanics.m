function dy=array_chiral_dymanics(c,theta,detabeta,zz,y)

HOBC=[0,c/sqrt(2)*exp(1i*theta),c/sqrt(2)*exp(-1i*theta);
    c/sqrt(2)*exp(-1i*theta),0,detabeta/2;
    c/sqrt(2)*exp(1i*theta),detabeta/2,0;];

 
dy=1i*HOBC*y;
return