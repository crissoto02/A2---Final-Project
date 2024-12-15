# MATLAB Code for Robotic Arm Trajectory Simulation

This MATLAB script models a **3-DOF robotic manipulator** using the **Robotics Toolbox** and performs a simulation of its trajectory from an initial joint configuration to a target configuration. The script calculates both **forward kinematics** and **inverse kinematics** while visualizing the robot's motion and trajectory in 3D space.

---

## Key Features

1. **Robot Model Definition**  
   - The robotic manipulator is defined using **Denavit-Hartenberg (DH) parameters**:
     - `L_1 = 40` cm (Link 1 length).  
     - `L_2 = 30` cm (Link 2 length).  
     - `L_3 = 20` cm (Link 3 length).  
   - The links are combined to form the robot using the `SerialLink` object from the Robotics Toolbox.

2. **Kinematics**  
   - **Forward Kinematics (`fkine`)**:  
     Computes the end-effector pose for a given set of joint angles.  
   - **Inverse Kinematics (`ikine`)**:  
     Computes the joint angles needed to achieve a desired end-effector pose.  
   - The desired pose (`Tout`) is defined as `[pi/2, -pi/6, -pi/4]` in radians.

3. **Trajectory Generation**  
   - A smooth trajectory is generated from the initial joint configuration (`q0 = [0, 0, 0]`) to the target joint configuration (`Tout`).  
   - The `jtraj` function creates a joint-space trajectory over a specified time vector (`time = 0:0.15:3` seconds).

4. **3D Visualization**  
   - The robot's motion is animated using the `plot` function.  
   - The end-effector's trajectory is extracted and plotted in 3D space (`plot3`) for visualization.

---

```matlab
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
q0 = [0 pi/2 0];
Ji = Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

% Modify Ji to include a 90-degree rotation of the base
Ji(1) = pi; % Base ends at 90 degrees
Ji(2) = 0;    % Second link ends at 0 degrees
Ji(3) = -pi/2;    % End-effector orientation ends at 0 degrees

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

% Maximum Reach (straight configuration)
max_reach = L_1 + L_2 + L_3;
disp(['Maximum Reach of the Robot: ', num2str(max_reach), ' units']);

% Define joint angle ranges (full range for demonstration)
theta1_range = linspace(-pi, pi, 50); % Base rotation (joint 1)
theta2_range = linspace(-pi/2, pi/2, 50); % Second link (joint 2)
theta3_range = linspace(-pi/2, pi/2, 50); % Third link (joint 3)

% Generate all combinations of joint angles
[Theta1, Theta2, Theta3] = ndgrid(theta1_range, theta2_range, theta3_range);

% Initialize arrays for workspace points
X_workspace = [];
Y_workspace = [];
Z_workspace = [];

% Compute forward kinematics for all joint combinations
for i = 1:numel(Theta1)
    % Joint angles
    q = [Theta1(i), Theta2(i), Theta3(i)];
    
    % Forward kinematics
    T = Robot.fkine(q);
    pos = transl(T); % Extract position [X, Y, Z]
    
    % Store positions
    X_workspace = [X_workspace; pos(1)];
    Y_workspace = [Y_workspace; pos(2)];
    Z_workspace = [Z_workspace; pos(3)];
end

% Plot the workspace
figure;
scatter3(X_workspace, Y_workspace, Z_workspace, 1, 'b.'); % Use small dots for dense plotting
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('Robot Workspace');
grid on;
axis equal;
```
