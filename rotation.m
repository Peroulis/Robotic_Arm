function rot = rotation(th)
% Rotate the link origin by th
% Input argument th
% Called by final_transformation

rot = [cos(th) -sin(th) 0 ;
       sin(th) cos(th)  0 ;
       0        0       1 ];
