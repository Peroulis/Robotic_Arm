function rot = rotation(th)

rot = [cos(th) -sin(th) 0 ;
       sin(th) cos(th)  0 ;
       0        0       1 ];