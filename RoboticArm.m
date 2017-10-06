function RoboticArm
    % FINAL PLOT OF THE ROBOTIC ARM
    % Takes no input arguments
    % Initialize angles
    
    th0 = 0 ; th1 = 0; th2 = 0; th3 = 0 ; % new angles
    th1_old = 0; th2_old = 0; th3_old = 0 ;% previous angles; zero for the first turn
    
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
                       turn = LoopAnimation(th1,th2,th3,turn);
             end
           end
           grid
           th2 = th2_2;
    %  move throught th2
           if th2-th2_old ~= 0
                for th2 = linspace(th2_old,th2,pitch);
                    th3 = th3_old;
                    turn = LoopAnimation(th1,th2,th3,turn);
                end
           end
           th3 = th3_2;
    %  move throught th3
           if th3-th3_old ~= 0
               for th3 = linspace(th3_old,th3,pitch);
                   turn = LoopAnimation(th1,th2,th3,turn);
               end
           end
           
    %pussEnd = true; % for later use
    % next move_input angles by use
    
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
