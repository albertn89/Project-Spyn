%!!!! IMPORTANT. For each session, just run the following line once
brick = ConnectBrick('BRAIN');
% Move both A,B motors at speed of 50 (Forward). Speed range from -100 ~ 100
brick.MoveMotor('AD', 50);
% Waite 1.5 secs
pause(1.5)
% Stop both Motors with Coast mode
brick.StopMotor('AD', 'Coast');        
 
% Waite 2 secs
pause(2)
 
% Move both A,B motors at speed of -50 (Backward). Speed range from -100 ~ 100
brick.MoveMotor('AD', -50);
% Waite 1.5 secs
pause(1.5)
% Stop both Motors with Break mode
brick.StopMotor('AD', 'Brake'); 
 
% Instead of giving Bluetooth device name, give the connection object name. In this case: brick
DisconnectBrick(brick);
