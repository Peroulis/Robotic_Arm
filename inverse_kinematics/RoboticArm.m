function [th1_old,th2_old,th3_old] =  RoboticArm(th1,th2,th3,th1_old,th2_old,th3_old)
    % FINAL PLOT OF THE ROBOTIC ARM
    
    th0 = 0;
    pitch = 25; % for the animation pitch
    
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
           pussEnd = true;
           th1_old = th1;
           th2_old = th2;
           th3_old = th3;
    end
end
