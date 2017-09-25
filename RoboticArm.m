function RoboticArm
    % FINAL PLOT OF THE ROBOTIC ARM

    th0 = 0 ; th1 = 0; th2 = 0; th3 = 0 ; % new angles
    th1_old = 0; th2_old = 0; th3_old = 0 ;% old angles
    
    pitch = 25; % for the animation pitch
    figure(2)
    clf(2,'reset')
    hold on
% INITIAL ROBOTIC ARM - FIRST-SECOND LINK
    line([0 3 0],[0 0 0],[0 0 0],'color','k','linewidth',5) % first link
    line([2 5 5],[0 0 0],[0 0 0],'color','b','linewidth',5) % second link
    grid
% initial configuration frame
    rot = rotation(th0)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % no rotation of the initial frame
    DrawAxis(0,0,0,rot) %initial configuration frame   
    pussEnd = false;
    
    % ANIMATION FOR FORWARD KINEMATICS
    while (pussEnd ~= true)
           
           th2_2 = th2;
           th3_2 = th3;
           turn = 0;
    %  move throught th1
           if th1-th1_old ~= 0
             for th1 = linspace(th1_old,th1,pitch);
                       th2 = th2_old ; th3 = th3_old;
                       for_kin % call the forward kinematics function to calculate the homogeneous transformations
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
                        pause(1/60)
                        hold off
             end
           end
           grid
           th2 = th2_2;
    %  move throught th2
           if th2-th2_old ~= 0
                for th2 = linspace(th2_old,th2,pitch);
                    th3 = th3_old;
                    for_kin % call of the forward kinematics function to calculate the homogeneous transformations
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
                    pause(1/60)
                    hold off
                end
           end
           th3 = th3_2;
    %  move throught th3
           if th3-th3_old ~= 0
               for th3 = linspace(th3_old,th3,pitch);
                    for_kin % call of the forward kinematics function to calculate the homogeneous transformations
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
                    pause(1/60)
                    hold off
               end
           end
           
           prompt = 'Input th1 \n';
           th1_old = th1;
           th1 = input(prompt);           
           clc
           prompt = 'Input th2 \n';
           th2_old = th2;
           th2 = input(prompt);     
           clc           
           prompt = 'Input th3 \n';
           th3_old = th3;
           th3 = input(prompt);
           clc
    end
end











