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
start_distance = brick.UltrasonicDist(3); 
brick.SetColorMode(2, 2);
 
while 1
    brick.ResetMotorAngle('A');
    brick.ResetMotorAngle('D');
    
    % Moving the motor forward
    brick.MoveMotor('A', 86);
   brick.MoveMotor('D', 88);
   %brick.MoveMotorAngleAbs('AD', 50, 360); 
   pause(0.5);
    
    % Reading sensor values
    dist = brick.UltrasonicDist(1);
    col = brick.ColorCode(2);
    touch = brick.TouchPressed(4);
    
    if col == 5
        disp('Red');
        brick.StopMotor('AD', 'Brake');
        pause(2);
        brick.MoveMotor('A', 46);
        brick.MoveMotor('D', 50);
        pause(0.5);
        
    elseif col == 2 || col == 4
        disp('Blue/Yellow');
        brick.StopMotor('AD', 'Brake');
        pause(1);
        run('kbcontrol');
        brick.MoveMotor('A', 46);
        brick.MoveMotor('D', 50);
    elseif col == 3
        disp('Green');
        brick.StopMotor('AD', 'Brake');
        pause(2);
        brick.MoveMotor('A', 46);
        brick.MoveMotor('D', 50);
        pause(1);     
    end
    

    
    % Navigation System
   
    if dist > 30 
        pause(0.5);
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', 20);
        pause(2.3); %turning time
         brick.StopMotor('A', 'Brake');
        brick.MoveMotor('A', 46); 
        brick.MoveMotor('D', 50);
        pause(2);
    end
    
    if touch
        pause(0.3);
        disp('Touched');
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', -40);
        brick.MoveMotor('D', -42);
        pause(2);
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', 60)
        brick.MoveMotor('D', -62);
        pause(2);
        brick.StopMotor('AD', 'Brake');
        brick.MoveMotor('A', 46);
        brick.MoveMotor('D', 50);
        brick.StopMotor('AD', 'Brake');
        pause(2);
    
        if dist < 30
            brick.MoveMotor('A', 60)
            brick.MoveMotor('D', -62);
            pause(1.6);
            brick.StopMotor('AD', 'Brake');
            brick.MoveMotor('A', 46);
            brick.MoveMotor('D', 50);
            pause(2);
            
        else
            brick.MoveMotor('A', 60)
            brick.MoveMotor('D', -62);
            pause(2);
            brick.StopMotor('D','Brake');
            brick.MoveMotor('A', 46);
            brick.MoveMotor('D', 50);
        end
           
    end
        
end

