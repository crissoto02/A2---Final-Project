```matlab
clear all
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1)= Link([0 L_1 0 pi/2]);
L(2)= Link([0 0 L_2 0]);
L(3)= Link([0 0 L_3 0]);

Robot=SerialLink(L);

Tout=[pi/2 -pi/6 -pi/4];
q0=[0 0 0];
Jf=Robot.fkine(Tout);
Ji=Robot.ikine(Tout,'mask', [1 1 1 0 0 0]);


time= 0:0.15:3;
Q=jtraj(q0, Tout, time);
Tr=fkine(Robot,Q);

for i=1:1:length(time)
    T=Tr(i);
    trs=transl(T);
    xx(i)=trs(1);
    yy(i)=trs(2);
    zz(i)=trs(3);
end

plot(Robot,Q);
hold on 
plot3(xx,yy,zz,'Color',[0 1 0],'LineWidth',2)
```
# Overview: MATLAB Code for Robotic Arm Trajectory Simulation

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

## Code Breakdown

### 1. **Robot Definition**
The robot is defined using DH parameters for its three links:
```matlab
L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
```
### 2. **Kinematics**
