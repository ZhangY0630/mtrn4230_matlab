% Author: Raghav Hariharan (z5162972)
% 3/06/2022
% For MTRN4230 2022
% This is an example program demonstrating how to use the RTDE library to
% draw the digit 1 by tracing it.

clear all;

% Setting up the connection to the UR5e
% TCP Host and Port settings
host = '127.0.0.1'; % THIS IP ADDRESS MUST BE USED FOR THE VM
% host = '192.168.0.100'; % THIS IP ADDRESS MUST BE USED FOR THE REAL ROBOT
port = 30003;

% Calling the constructor of rtde to setup tcp connction
rtde = rtde(host,port);


% Creating some home and start points
home = [-588.53, -133.30, 371.91, 2.2214, -2.2214, 0.00];
% start = [-588.53, -133.30, 71.91, 2.2214, -2.2214, 0.00];
% start = [-567.53, -133.30, 71.91, 2.2214, -2.2214, 0.00];
start = [home(1)-150,home(2)+26,60,home(4:end)];
height = 27;
width = 17;

% numberList = [0,1,2,3,4,5,6,7,8,9];
numberList=[5,1,2,2,9,8,8];
disp(['Input number sequence is ',num2str(numberList)])
% this one for the translation
translation = [10,10,0,0,0,0];
start =translation+start;
rot = rotz(0);

% Actually performing the movement
poses = rtde.movej(home);
poses = cat(1,poses,rtde.movel(start));
gap = [0,5,0,0,0,0];



for i=1:length(numberList)
    poses = draw(poses,start,rtde,numberList(i),height,width,rot);
    widthDistance = [0,width,0,0,0,0] +[0,5,0,0,0,0];
%     lastpose = start + widthDistance;
    start = [widthDistance(1:3)*rot+start(1:3),start(4:6)];
end
% poses = draw(poses,startp,rtde,6,height,width);

rtde.movej(home);


% Plotting the trajectory taken by the UR5e
rtde.drawPath(poses);
axis equal;
rtde.close();
disp('Program Complete')
