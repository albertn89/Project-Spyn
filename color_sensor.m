%{
ports:
color: 2
ultrasonic: 3
color: 2
touch: 1 & 4
left motor:  D1
right motor: A
crane motor: C
%}



% Set Color Sensor connected to Port 3 to Color Code Mode
brick.SetColorMode(2, 2);
  

brick.MoveMotor('AD', 40 );
while 1
    %Get the color sensor reading from Port 3
    col = brick.ColorCode(2);
% 0 No color (Unknown color) 
% 1 Black 
% 2 Blue 
% 3 Green 
% 4 Yellow 
% 5 Red 
% 6 White 
% 7 Brown
    if col == 5
        brick.StopMotor('AD');        
        break
    
    elseif col == 4
        brick.StopMotor('AD');        
        break
    
    elseif col == 3
        brick.StopMotor('AD');        
        break
    
    elseif col == 2
        brick.StopMotor('AD');        
        break
    end
end