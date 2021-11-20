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

 
while 1
    
    %brick.ResetMotorAngle('D');
    
    % Moving the motor forward
    brick.MoveMotor('A', 98);
    brick.MoveMotor('D', 100);
    %pause(0.5);
    
    % Reading sensor values
    col = brick.ColorCode(2);
    dist = brick.UltrasonicDist(3);
    touch = brick.TouchPressed(4);
    
    % Red
    if col == 5
        disp('Red');
        brick.StopMotor('AD', 'Brake');
        pause(2);
        brick.MoveMotor('A', 98);
        brick.MoveMotor('D', 100);
        pause(0.5);
        
    % Blue or Yellow
    elseif col == 2 || col == 4
        if col == 2
            disp('Blue');
        elseif col == 4
            disp('Yellow');
        end
        
        disp('Blue/Yellow');
        brick.StopMotor('AD', 'Brake');
        pause(0.5);
        run('kbcontrol');   % Open remote control
        brick.MoveMotor('A', 98);
        brick.MoveMotor('D', 100);
        
    % Green on start
    elseif col == 3
        pause(0.5);
        disp('Green');
        brick.StopMotor('AD', 'Brake');
        pause(1);
        brick.MoveMotor('A', 98);
        brick.MoveMotor('D', 100);
        pause(3);
        count = count + 1;
    end
    

    
    % Navigation System
    % No wall is present
    if dist > 30 
        % Get past the wall
        pause(0.1);
        brick.StopMotor('AD', 'Brake');
        %pause(1);
        
        % Turn right
        brick.MoveMotor('A', -98);
        brick.MoveMotor('D', 100);
        pause(1.11);
        brick.StopMotor('AD', 'Brake');
        %pause(1);
        
        % Going straight
        brick.MoveMotor('A', 98);
        brick.MoveMotor('D', 100);
        pause(2);
    end

    
    % If touch is true
    if touch
        pause(0.1);
        disp('Touched');
        brick.StopMotor('AD', 'Brake'); % Stop motor
        %pause(1);
        
        % Reverse
        brick.MoveMotor('A', -98);
        brick.MoveMotor('D', -100);
        pause(1);
        brick.StopMotor('AD', 'Brake');
        %pause(1);

        % If touch == 1 and there is wall, turn left
        if dist < 30
            % Turn left
            brick.MoveMotor('A', 98);
            brick.MoveMotor('D', -100);
            pause(1.11);
            brick.StopMotor('AD', 'Brake');
            %pause(1);
            brick.MoveMotor('A', 98);
            brick.MoveMotor('D', 100);
            pause(2);
            
        % else (no wall), turn right
        else
            brick.MoveMotor('A', -98);
            brick.MoveMotor('D', 100);
            pause(1.11);
            brick.StopMotor('D','Brake');
            %pause(1);
            brick.MoveMotor('A', 98);
            brick.MoveMotor('D', 100);
            pause(2);
        end
           
    end
    
    % Green on finish
    if col == 3 && count == 1
        pause(0.5);
        disp('Green');
        brick.StopMotor('AD', 'Brake');
        %run('kbcontrol');
        break;
    end
    
end

