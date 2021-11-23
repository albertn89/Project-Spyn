%{
ports:
Gyro: 1
Color: 2
Ultrasonic: 3
Touch:4
Left motor:  D
Right motor: A
crane motor: C
%}

%{
0 No color (Unknown color) 
1 Black 
2 Blue 
3 Green 
4 Yellow 
5 Red 
6 White 
7 Brown
%}

global key

% Set Color Sensor connected to Port 3 to Color Code Mode
%start_distance = brick.UltrasonicDist(3); 
brick.SetColorMode(2, 2);
%brick.ResetMotorAngle('AD');
brick.GyroCalibrate(1);
count = 0;

% Turning time
tp = 1.48;

fl = 100;
fr = 97;
bl = -100;
br = -97;
 
while 1
    
    %brick.ResetMotorAngle('D');
    pause(0.1);
    % Moving the motor forward
    brick.MoveMotor('A', fr);
    brick.MoveMotor('D', fl);
    %pause(0.5);
    
    % Reading sensor values
    col = brick.ColorCode(2);
    dist = brick.UltrasonicDist(3);
    touch = brick.TouchPressed(4);
    
    %touch = brick.TouchPressed(1);
    
    % Red
    if col == 5
        pause(0.5)
        disp('Red');
        brick.StopMotor('AD', 'Brake');
        pause(2);
        brick.MoveMotor('A', fr);
        brick.MoveMotor('D', fl);
        pause(0.5);
        
    % Blue or Yellow
    elseif col == 2 || col == 4
        if col == 2
            disp('Blue');
        elseif col == 4
            disp('Yellow');
        end
        
        %disp('Blue/Yellow');
        brick.StopMotor('AD', 'Brake');
        pause(0.5);
        run('kbcontrol');   % Open remote control
        brick.MoveMotor('A', fr);
        brick.MoveMotor('D', fl);
        pause(1);
        
    % Green on start
    elseif col == 3
        pause(0.5);
        disp('Green');
        brick.StopMotor('AD', 'Brake');
        pause(1);
        run('kbcontrol');
        brick.MoveMotor('A', fr);
        brick.MoveMotor('D', fl);
        pause(4);
        %count = count + 1;
    else
        brick.MoveMotor('A', fr);
        brick.MoveMotor('D', fl);
    end
    

    
    % Navigation System
    % No wall is present
    if dist > 60 
        % Get past the wall
        pause(0.08);
        brick.StopMotor('AD', 'Brake');
        pause(1);
        
        % Turn right
        brick.MoveMotor('A', br);
        brick.MoveMotor('D', fl);
        pause(tp);
        brick.StopMotor('AD', 'Brake');
        pause(1);
        
        % Going straight
        brick.MoveMotor('A', fr);
        brick.MoveMotor('D', fl);
        pause(1.2);
    end
    
    % If touch is true
    if touch
        pause(0.1);
        disp('Touched');
        brick.StopMotor('AD', 'Brake'); % Stop motor
        pause(1);
        
        % Reverse
        brick.MoveMotor('A', br);
        brick.MoveMotor('D', bl);
        pause(0.45);
        brick.StopMotor('AD', 'Brake');
        pause(1);

        % If touch == 1 and there is wall, turn left
        if dist < 35
            % Turn left
            brick.MoveMotor('A', fr);
            brick.MoveMotor('D', bl);
            pause(tp);
            brick.StopMotor('AD', 'Brake');
            pause(1);
            brick.MoveMotor('A', fr);
            brick.MoveMotor('D', fl);
            pause(2);
            
        % else (no wall), turn right
        else
            brick.MoveMotor('A', br);
            brick.MoveMotor('D', fl);
            pause(tp);
            brick.StopMotor('D','Brake');
            pause(1);
            brick.MoveMotor('A', fr);
            brick.MoveMotor('D', fl);
            pause(2);
        end
        
    end
    
    switch key
        case 'k'
            disp('Terminate!');
            break;
    end

end

