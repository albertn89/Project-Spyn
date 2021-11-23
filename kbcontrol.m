global key
%!!!! IMPORTANT. For each session, just run the following line once
%brick = ConnectBrick('BRAIN');
%Initialize the keyboard key detection function in MATLAB
InitKeyboard();

% We choose to use a while loop the keep detecting input, and use switch
% statement to check which key is pressed
while 1 
    pause(0.1)
    switch key
        case 'uparrow'
            disp('Up Arrow Pressed!');
            brick.MoveMotor('A', 66.5 ); 
            brick.MoveMotor('D', 70 ); 

        case 'downarrow'
            disp('Down Arrow Pressed!');
            brick.MoveMotor('A', -66.5 ); 
            brick.MoveMotor('D', -70 );
        
        case 'leftarrow'
            disp('Left Arrow Pressed!'); 
            brick.MoveMotor('A', 66.5 );
            brick.MoveMotor('D', -70 );
        
        case 'rightarrow'
            disp('Right Arrow Pressed!');
            brick.MoveMotor('A', -66.5 );
            brick.MoveMotor('D', 70);
            
        case 'w'
            disp('w Pressed!');
            brick.MoveMotor('C', 60 );
            %brick.StopAllMotors();
            
        case 's'
            disp('s Pressed!');
            brick.MoveMotor('C', -60 );
            %brick.StopAllMotors();
        % When 'q' is pressed, we jump out of the while loop and leave the
        % remote control mode
        case 'p'
            break;
            
        otherwise
            brick.StopAllMotors('Brake');
    end
end

%Close the keyboard key detection function in MATLAB
CloseKeyboard();
%DisconnectBrick(brick);
