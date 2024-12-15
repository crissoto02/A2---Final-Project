# Jacobian Matrix Calculation for a 3-DOF Robot Manipulator (Version 1)

This MATLAB script calculates the **Jacobian matrix** of a 3-DOF robotic manipulator using the **Robotics Toolbox**. The Jacobian provides insights into the relationship between joint velocities and end-effector velocities, which is essential for motion analysis and control.
```matlab
%Jacobian matrix
clear all
close all

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);

q=[0 pi pi/2];

J=jacob0(Robot,q)
```
---

## Code Breakdown

### 1. **Defining the Robot Parameters**

The script uses **Denavit-Hartenberg (DH) parameters** to model a 3-DOF robotic manipulator:

- `L_1 = 40`  
- `L_2 = 30`  
- `L_3 = 20`  

The three links are defined as follows:
```matlab
L(1) = Link([0 L_1 0 pi/2]); % Link 1: Prismatic joint along Z-axis
L(2) = Link([0 0 L_2 0]);    % Link 2: Rotational joint along X-axis
L(3) = Link([0 0 L_3 0]);    % Link 3: Rotational joint along X-axis
