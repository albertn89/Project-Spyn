%{
ports:
Gyro: 1
Color: 2
Ultrasonic: 3
Touch:4
Left motor:  D1
Right motor: A
crane motor: C
%}



% Set Color Sensor connected to Port 3 to Color Code Mode

start_distance = brick.UltrasonicDist(4); 
brick.SetColorMode(2, 2);
  

brick.MoveMotor('AD', 50 );
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
    
   if brick.TouchPressed(3) || brick.TouchPressed(4)
        brick.StopMotor('AD', 'Brake');
        break;
    else
        brick.MoveMotor('AD',50);
        pause(1);
   end
    
        
   distance = brick.UltrasonicDist(4); 
% We are out of cube when current wall distance is much larger than original distance
if distance > 3*start_distance
pause(1)
brick.StopMotor('AD');        
break
else
brick.MoveMotor('AD',50);
pause(1)
end

end


