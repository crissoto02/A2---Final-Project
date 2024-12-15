# A2-Final Project 👩‍💻👩‍🔧👨‍💻👨‍🔧
In this section, you can see general details about two projects performed in the Robotics Lab by group A2. For more information, 
please click on the links of "Introduction to Robotics" and "Introduction to Robotics Tutorial".
### Members
- Sofía Agüero - Robot Programming
- Maia Jarolin - Electrical Task
- Moisés Melgarejo - Mechanical Task
- Cristhian Sotomayor - Project Management
## [INTRODUCTION TO ROBOTICS](Introduction%20to%20Robotics/)
This project addresses the inefficiencies in manual disinfection and the associated workload on healthcare workers by designing a robotic arm equipped with UVC lights for clinical environments. 
The proposed solution aims to prevent cross-infection between patients while improving overall hygiene. This system benefits both patients, by reducing infection risks, and workers, by automating a 
time-intensive task.

The primary goal is to ensure effective disinfection of clinical rooms, including surfaces such as beds, furniture, and overbed tables. The robotic arm incorporates UVC lights distributed along its 
structure, allowing for better reach and improved light angles to ensure thorough disinfection of all surfaces. Unlike conventional UVC systems, which are typically rigid and stationary, this design 
integrates an articulated robotic arm to maximize flexibility and coverage. 

The project leverages MATLAB and Simulink for mathematical modeling and simulation to validate the arm’s functionality and optimize its performance. Expected outcomes include improved hygiene 
standards and more efficient disinfection processes in healthcare settings. By introducing an overactuated robotic arm for UVC disinfection, this project innovatively combines robotics and healthcare 
to create a scalable and effective solution for infection control.

## [INTRODUCTION TO ROBOTICS TUTORIAL](Introduction%20to%20Robotics%20Tutorial/)
In this project, three tasks were performed in the Epson Lab.
The three tasks use an I/O Box to control the robot and the Task 3 uses tools designed and fabricated in 3D printer.

For more details about coding, electrical connection and manufactured pieces used in the task, access to the link in the title "Introcution to Robotics Tutorial"
### Task 1: Pick and Place
The goal of this task is to pick **3 tokens** and **3 blocks** from a feeder using the robot's vacuum nozzle and transfer them to a tray. The process involves:

1. **Picking**: The robot collects the tokens and blocks from a feeder located within its workspace.
2. **Alignment**: After picking each token or block, the robot moves to an **alignment plate** to ensure proper positioning for the next step.
3. **Placement**: Once aligned, the robot transfers the token or block to its corresponding position in a tray.

This task focuses on **efficiency**, **precision**, and handling **multiple object types**.
### Task 2: Stacking
In this task, the robot must stack **10 tokens** and **10 blocks** alternately on a platform within its workspace. The process involves:

1. **Collecting**: The robot picks tokens and blocks from the feeder using its vacuum nozzle.
2. **Stacking**: The robot alternates between tokens and blocks (e.g., token-block-token-block) to build a stable stack on the designated platform.

This task tests the robot's **stacking ability**, ensuring both **stability** and **organization**.
### Task 3: Integration
This task combines **object detection**, **calibration**, and a **reverse operation** to demonstrate the robot's integration of multiple functionalities. The steps are:

1. **Object Detection**: The robot detects the number of tokens and blocks available in the feeder.
2. **Calibration**:
   - Tokens are calibrated using the robot arm.
   - Blocks are calibrated using a cylinder.
3. **Placement**: After calibration, the robot transfers the tokens and blocks to their designated positions in a tray.
4. **Reverse Function**:
   - The robot detects which tray positions are occupied.
   - It picks the objects from the tray and returns them to the feeder.
     
This task tests the robot’s integration of multiple functionalities, including object detection, calibration, precise placement, and reverse operation.

