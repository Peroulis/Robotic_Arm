function H = homogeneous(rot, pos)

% Homogeneous transformation
% Input the individual rotation and position

H = [ rot pos ; 0 0 0 1];
end
