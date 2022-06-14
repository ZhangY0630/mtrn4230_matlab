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
start = [-567.53, -133.30, 71.91, 2.2214, -2.2214, 0.00];

height = 31;
width = 10;


% Actually performing the movement
poses = rtde.movej(home);
poses = cat(1,poses,rtde.movel(start));
poses = draw(poses,start,rtde,4,height,width);
% gap = [0,5,0,0,0,0];
% lastpose = start + [0,width,0,0,0,0];
% % lastpose = [lastpose(1:3)*1000,lastpose(4:end)];
% startp = lastpose+gap;
% poses = draw(poses,startp,rtde,2);

rtde.movej(home);


% Plotting the trajectory taken by the UR5e
rtde.drawPath(poses);

rtde.close();
