clear all 
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);

% Desired end-effector pose
Tout = SE3.rpy([pi/2, pi/6, pi/4]).T;

% Compute inverse kinematics
q0 = [0 0 0];
Ji = Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

% Trajectory generation from q0 to Ji
time = 0:0.15:3;
Q = jtraj(q0, Ji, time);

% Forward kinematics along the trajectory
Tr = Robot.fkine(Q);

% Extract trajectory points
for i = 1:length(time)
    T = Tr(i);
    trs = transl(T);
    xx(i) = trs(1);
    yy(i) = trs(2);
    zz(i) = trs(3);
end

% Plot results
plot(Robot, Q);
hold on 
plot3(xx, yy, zz, 'Color', [0 1 0], 'LineWidth', 2);