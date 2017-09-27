function turn = LoopAnimation (th1,th2,th3,turn) %#ok<*INUSD
hold off
    final_transformation % call the forward kinematics function to calculate the homogeneous transformations
    clc
    turn = turn + 1
% configuration frame of the 1st joint
    rot = rotation(th1)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % rotation by th1
    x = 0; y = 0 ; z = 0; % origin of the 1st link
    DrawAxis(x,y,z,rot) % configuration frame with th1
% configuration frame for the 2nd angle
    origin = FIRST_TRANSFORMATION;
    rot = [origin(1,1) origin(1,2) origin(1,3);     %rotation by th2
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];
            DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % configuration frame with th2
% ROBOTIC ARM - FIRST LINK
    line([0 origin(1,4) 0],[0 origin(2,4) 0],[0 origin(3,4) 0],'color','k','linewidth',5) % first link
% configuration frame for the second joint
    origin = FINAL_TRANSFORMATION; 
    rot = [origin(1,1) origin(1,2) origin(1,3);     %rotation by th3
            origin(2,1) origin(2,2) origin(2,3);
            origin(3,1) origin(3,2) origin(3,3)];  
    DrawAxis(origin(1,4),origin(2,4),origin(3,4),rot) % configuration frame with th4
% ROBOTIC ARM - SECOND LINK
    line([FIRST_TRANSFORMATION(1,4) origin(1,4) origin(1,4)],[FIRST_TRANSFORMATION(2,4) ...
        origin(2,4) origin(2,4)],[FIRST_TRANSFORMATION(3,4) origin(3,4) origin(3,4)], ...
            'color','b','linewidth',5) % second link
    pause(1/100)
    %hold off

end