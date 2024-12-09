%% Workspace
clear all
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);

% Define end-effector pose using roll-pitch-yaw angles
Tout = SE3.rpy([pi/2 -pi/6 -pi/4]);

% Initial joint angles
q0 = [0 0 0];

% Compute inverse kinematics
Ji = Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

% Compute forward kinematics for joint angles from inverse kinematics
Jf = Robot.fkine(Ji);

% Confirm that the computed forward kinematics matches the desired pose
disp('Desired Pose (Tout):');
disp(Tout);

disp('Computed Pose (Jf):');
disp(Jf);

% Workspace generation
conv = pi/180;
i = 0;
for q1 = -185*conv:10*conv:185*conv
    for q2 = -140*conv:10*conv:-5*conv
        for q3 = -0*conv:10*conv:155*conv
            T01 = trotz(q1) * transl(0, 0, L_1) * trotx(-pi/2);
            T12 = trotz(q2) * transl(L_2, 0, 0);
            T23 = trotz(q3) * transl(L_3, 0, 0);
            T03 = T01 * T12 * T23;
            i = i + 1;
            p = T03(1:3, 4);
            p1(i) = p(1);
            p2(i) = p(2);
            p3(i) = p(3);
        end
    end
end

% Plotting
figure(2)
plot((p2.^2 + p1.^2).^0.5, p3, 'b.');
xlabel('x')
ylabel('y')

figure(3)
plot((p1.^2 + p3.^2).^0.5, p2, 'b.');
xlabel('x')
ylabel('y')
