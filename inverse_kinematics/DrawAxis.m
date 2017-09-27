function DrawAxis(originX, originY, originZ,rot)
% make a new quiver3 giving the individual origin

quiver3(originX,originY,originZ,rot(1,1),rot(1,2),rot(1,3))   % x vector of the tip
hold on
xlabel('x')
ylabel('y')
zlabel('z')
lim = 5;
xlim([-lim lim])
ylim([-lim lim])
zlim([-lim lim])
view([25 25])
daspect([1 1 1])
quiver3(originX,originY,originZ,rot(2,1),rot(2,2),rot(2,3))   % y vector
quiver3(originX,originY,originZ,rot(3,1),rot(3,2),rot(3,3))  % z vector

