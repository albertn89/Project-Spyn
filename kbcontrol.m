global key
%!!!! IMPORTANT. For each session, just run the following line once
brick = ConnectBrick('BRAIN');
%Initialize the keyboard key detection function in MATLAB
InitKeyboard();

% We choose to use a while loop the keep detecting input, and use switch
% statement to check which key is pressed
while 1 
    pause(0.1)
    switch key
        case 'uparrow'
            % code to make the robot do something….
            brick.MoveMotor('AD', 200 ); 
            pause(5)
            brick.StopAllMotors();

        case 'downarrow'
            disp('Down Arrow Pressed!');
            brick.MoveMotor('AD', -25 ); 
            pause(5)
            brick.StopAllMotors();
        
        case 'leftarrow'
            disp('Left Arrow Pressed!');
            brick.MoveMotor('D', 100 ); 
            brick.MoveMotor('A', -100 );
            pause(5)
            brick.StopAllMotors();
        
        case 'rightarrow'
            disp('Right Arrow Pressed!');
            brick.MoveMotor('A', 25 );
            brick.MoveMotor('D', -25 );
            pause(5)
            brick.StopAllMotors();
         case 'w'
            disp('Right Arrow Pressed!');
            brick.MoveMotor(1, 25 );
            pause(5)
            brick.StopAllMotors();
          case 's'
            disp('Right Arrow Pressed!');
            brick.MoveMotor(1, -25 );
            pause(5)
            brick.StopAllMotors();
        % When 'q' is pressed, we jump out of the while loop and leave the
        % remot control mode
        case 'q'
            break;
    end
end

%Close the keyboard key detection function in MATLAB
CloseKeyboard();
DisconnectBrick(brick);