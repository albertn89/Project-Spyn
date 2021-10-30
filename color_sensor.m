%{
Port usage / description
color: 2
ultrasonic: 3
color: 2
touch: 1 & 4
left motor:  D1
right motor: A
crane motor: C
%}

% Color code guide for the reading from the color sensor
% 0 No color (Unknown color) 
% 1 Black 
% 2 Blue 
% 3 Green 
% 4 Yellow 
% 5 Red 
% 6 White 
% 7 Brown

% Set Color Sensor connected to Port 3 to Color Code Mode
brick.SetColorMode(2, 2);
  
% Moving the vehicle forward
brick.MoveMotor('AD', 40 );

% While true (the motor is moving)
while 1
    % Get the color sensor reading from Port 3
    col = brick.ColorCode(2);

    % If color is Red (code 5)
    if col == 5
        brick.StopMotor('AD');        
        break
    
    % If color is Yellow (code 4)
    elseif col == 4
        brick.StopMotor('AD');        
        break
    
    % If color is Green (code 3)
    elseif col == 3
        brick.StopMotor('AD');        
        break
    
    % If color is Blue (code 2)
    elseif col == 2
        brick.StopMotor('AD');        
        break
    end
end
