% start = [-588.53, -133.30, 71.91, 2.2214, -2.2214, 0.00];
% Play around with these values for movec. 
function poses=draw(poses,startpoint,rtde,num,height,width,rot)
    switch num
        case 1
            point0 = [-height+3,0,0,0,0,0];
            point1 = [point0(1)-3,point0(2)+width/2,point0(3:end)];
            point2 = [point1(1)+height,point1(2:end)];
            point3 = [point2(1),point2(2)-width/2,point2(3:end)];
            point4 = [point3(1),point3(2)+width,point3(3:end)];
        
        
            
        
%             poses = cat(1,poses,rtde.movel(startpoint));
            poses = cat(1,poses,rtde.movej([point0(1:3)*rot+startpoint(1:3),startpoint(4:end)]));
            poses = cat(1,poses,rtde.movel([point1(1:3)*rot+startpoint(1:3),startpoint(4:end)]));
            poses = cat(1,poses,rtde.movel([point2(1:3)*rot+startpoint(1:3),startpoint(4:end)]));
            poses = cat(1,poses,rtde.movel([point3(1:3)*rot+startpoint(1:3),startpoint(4:end)]));
            poses = cat(1,poses,rtde.movel([point4(1:3)*rot+startpoint(1:3),startpoint(4:end)]));
        case 2
            % Play around with these values for movec. 
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0;      % Blend radius
            point0 = [-height+2,0,0,0,0,0];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height,width/2,0,0,0,0];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height/4*3,width,0,0,0,0];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [0,0,0,0,0,0];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point3 = [0,width,0,0,0,0];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movec(arc1,point1,'pose',a,v,r));
            poses = cat(1,poses,rtde.movej(point2));
            poses = cat(1,poses,rtde.movel(point3));
        case 3
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0;      % Blend radius
            point0 = [-height+2,zeros(1,5)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height,width/2,zeros(1,4)];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height/2,width/2,zeros(1,4)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [0,width/2,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [-2,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movec(arc1,point1,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc2,point2,'pose',a,v,r));
        case 4
            point0 = [-height,width-5,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-8,zeros(1,5)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [-8,width,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];

            point3 = [-height,width-5,zeros(1,4)];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point4 = [0,width-5,zeros(1,4)];
            point4 = [point4(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movel(point1));
            poses = cat(1,poses,rtde.movel(point2));
            poses = cat(1,poses,rtde.movel(point3));
            poses = cat(1,poses,rtde.movel(point4));
        case 5
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0.0005;      % Blend radius
            point0 = [-height,width,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height,zeros(1,5)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [-height/2,zeros(1,5)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [-height/2,width-2,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point3 = [zeros(1,6)];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movel(point1));
            poses = cat(1,poses,rtde.movel(point2));
            poses = cat(1,poses,rtde.movec(arc2,point3,'pose',a,v,r));
%         case 6 has problems
        case 6 
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0.001;      % Blend radius
            point0 = [-height+2,width,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height,width/2,zeros(1,4)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height/2,zeros(1,5)];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [0,width/2,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [-height/4,width,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point3 =  [-height/3,zeros(1,5)];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];

            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movej(point1));
            poses = cat(1,poses,rtde.movec(arc1,point2,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc2,point3,'pose',a,v,r));
        case 7
            point0 = [-height,zeros(1,5)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height,+width,zeros(1,4)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [zeros(1,6)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movel(point1));
            poses = cat(1,poses,rtde.movel(point2));
        case 8
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0.001;      % Blend radius

            point0 = [-height,width/2,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height/4*3,2,zeros(1,4)];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height/2,width/2,zeros(1,4)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [-height/4,width,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [0,width/2,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc3 = [-height/4,zeros(1,5)];
            arc3 = [arc3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point3 = [-height/2,width/2,zeros(1,4)];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc4 = [-height/4*3,width-2,zeros(1,4)];
            arc4 = [arc4(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point4 = [-height,width/2,zeros(1,4)];
            point4 = [point4(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            
            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movec(arc1,point1,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc2,point2,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc3,point3,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc4,point4,'pose',a,v,r));

        case 9
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0.001;      % Blend radius
            point0 = [-height/4*3,width,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height,width/2,zeros(1,4)];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [-height/4*3,zeros(1,5)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [-height/2,width/2,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [-height/4*3,width,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point3 = [-height/2+3,width,zeros(1,4)];
            point3 = [point3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc3 = [0,width/2,zeros(1,4)];
            arc3 = [arc3(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point4 = [-3,zeros(1,5)];
            point4 = [point4(1:3)*rot+startpoint(1:3),startpoint(4:end)];

            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movec(arc1,point1,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc2,point2,'pose',a,v,r));
            poses = cat(1,poses,rtde.movel(point3));
            poses = cat(1,poses,rtde.movec(arc3,point4,'pose',a,v,r));
        case 0
            a = 0.1;    % Tool Acceleration
            v = 0.01;   % Tool Velocity
            r = 0.001;      % Blend radius

            point0 = [-height,+width/2,zeros(1,4)];
            point0 = [point0(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc1 = [-height/2,zeros(1,5)];
            arc1 = [arc1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point1 = [0,width/2,zeros(1,4)];
            point1 = [point1(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            arc2 = [-height/2,width,zeros(1,4)];
            arc2 = [arc2(1:3)*rot+startpoint(1:3),startpoint(4:end)];
            point2 = [-height,+width/2,zeros(1,4)];
            point2 = [point2(1:3)*rot+startpoint(1:3),startpoint(4:end)];

            poses = cat(1,poses,rtde.movej(point0));
            poses = cat(1,poses,rtde.movec(arc1,point1,'pose',a,v,r));
            poses = cat(1,poses,rtde.movec(arc2,point2,'pose',a,v,r));
    end
end