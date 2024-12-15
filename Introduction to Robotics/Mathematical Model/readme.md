# Overview: Kinematics MATLAB GUI Code

This project implements a **Graphical User Interface (GUI)** in MATLAB for performing forward and inverse kinematics calculations on a **3-DOF robotic manipulator**. The program allows users to input joint angles or desired position coordinates and visualize the resulting robot configuration.

---

## Key Functionalities

1. **Forward Kinematics**  
   - **Input**: Users provide joint angles (`Theta_1`, `Theta_2`, `Theta_3`) in degrees.  
   - **Computation**: Using the **Denavit-Hartenberg (DH)** parameters, the program calculates the robot's end-effector position using forward kinematics equations.  
   - **Output**: The computed Cartesian coordinates (`X`, `Y`, `Z`) of the end-effector are displayed in the GUI.  
   - **Visualization**: The robot's configuration is visualized using the **SerialLink** object and the `plot` function.

2. **Inverse Kinematics**  
   - **Input**: Users provide desired end-effector Cartesian coordinates (`Pos_X`, `Pos_Y`, `Pos_Z`).  
   - **Computation**: The program calculates the corresponding joint angles (`Theta_1`, `Theta_2`, `Theta_3`) using the **inverse kinematics** function `ikine` with constraints on translation only.  
   - **Output**: The joint angles are displayed in the GUI.  
   - **Visualization**: The resulting robot configuration is visualized to ensure accuracy.

3. **GUI Interaction**  
   - **Editable Fields**: Users can input values for joint angles or end-effector positions through text boxes.  
   - **Buttons**:
     - **Forward Kinematics**: Calculates and displays the end-effector position.  
     - **Inverse Kinematics**: Calculates and displays the joint angles based on input positions.  
   - **Real-Time Visualization**: The robot’s movement and configuration are shown using the `plot` function.

---

## Code Structure

1. **Initialization**:  
   - The GUI is initialized with the `kinematics_OpeningFcn` function, setting up default properties and linking user inputs with handles.

2. **Forward Kinematics**:  
   - The `btn_forward_Callback` function reads joint angles (`Theta_1`, `Theta_2`, `Theta_3`), calculates the end-effector position using the DH method, and displays the result.

3. **Inverse Kinematics**:  
   - The `pushbutton2_Callback` function reads desired positions (`Pos_X`, `Pos_Y`, `Pos_Z`), computes the corresponding joint angles using `ikine`, and updates the GUI fields.

4. **Visualization**:  
   - Robot visualization is performed using the `SerialLink` and `plot` functions from the **Robotics Toolbox** for MATLAB.

---

## Dependencies

- **MATLAB Robotics Toolbox**: Required for the `Link`, `SerialLink`, `fkine`, and `ikine` functions.  
- **GUI Development Environment**: Created using **GUIDE** (MATLAB's GUI tool).  

---

## Features Summary

- **Input**: Joint angles or Cartesian positions.  
- **Output**: Corresponding Cartesian positions or joint angles.  
- **Visualization**: 3D robot visualization for accurate representation.  
- **User-Friendly Interface**: Simple GUI for easy interaction and testing.

---
