function th = InverseKinematics
    % Call for the inverse problem
    % Initializes angles (0)
    % Input when asked the final tip position
    
    clc
    th1_old = 0; th2_old = 0; th3_old = 0 ;% old angles
    
    a = 3 ; b = 2;
    
    figure(1)
    clf(1,'reset')
    hold on
% INITIAL ROBOTIC ARM - FIRST-SECOND LINK
    line([0 3 0],[0 0 0],[0 0 0],'color','k','linewidth',5) % first link
    line([2 5 5],[0 0 0],[0 0 0],'color','b','linewidth',5) % second link
    grid
% initial configuration frame
    th0 = 0 ;
    rot = rotation(th0)* [ 1 0 0 ;0 1 0 ; 0 0 1]; % no rotation of the initial frame
    DrawAxis(0,0,0,rot) %initial configuration frame  
    
    pressEnd = false;
    while (pressEnd == false)
        prompt = 'Input x \n';
        x = input(prompt);           
        clc
        prompt = 'Input y \n';
        y = input(prompt);     
        clc
        prompt = 'Input z \n';
        z = input(prompt);     
        clc                     
        if ( (x^2 + y^2) < (a-b)^2 || (x^2 + y^2) > (a+b)^2) && ((y^2 + z^2) < (a-b)^2 || (y^2 + z^2) > (a+b)^2)
            disp('FIRST CONDITION \n');
            pause;
            continue;
        elseif ((x^2 + z^2) < (a-b)^2 || (x^2 + z^2) > (a+b)^2) && ( (x^2 + y^2) < (a-b)^2 || (x^2 + y^2) > (a+b)^2)
            disp('SECOND CONDITION \n');
            pause;
            continue;
        elseif ((y^2 + z^2) < (a-b)^2 || (y^2 + z^2) > (a+b)^2) && ( (x^2 + y^2) < (a-b)^2 || (x^2 + y^2) > (a+b)^2)
            disp('THIRD CONDITION \n');
            pause;
            continue;
        end
  
        th1 = atan2(y,x);
        D =((+x^2 + y^2 + z^2 - a^2 - b^2)/(2*a*b))
        th3 = atan2(sqrt(abs(1 - D^2)),D);
        %th3 = acos(D);
        th2 = atan2(z,(sqrt(x^2 + y^2))) - atan2(b*sin(real(th3)),a + b*cos(real(th3)));
        th3 = th3 + th2;
        [th1_old,th2_old,th3_old] = RoboticArm(real(th1),real(th2),real(th3),th1_old,th2_old,th3_old);
        
        thReal = [radtodeg(real(th1)) radtodeg(real(th2)) radtodeg(real(th3))];
        thIm = [radtodeg(imag(th1)) radtodeg(imag(th2)) radtodeg(imag(th3))];
        th = [thReal ; thIm];
        final_transformation
    end
end
