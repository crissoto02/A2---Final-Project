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
In this task, the robot arm must efficiently pick 3 tokens and 3 blocks from a feeder within its workspace using its vacuum nozzle. After picking each token or block, the robot must:
1. Move to an alignment plate: The alignment plate ensures precise positioning and enhances performance.
2. Transfer to a tray: Once aligned, the robot must place the token or block in its corresponding position within a tray.
   
The task emphasizes efficiency, accuracy, and the ability to handle different object types (tokens and blocks).
### Task 2: Stacking
In this task, the robot must:

1. Collect 10 tokens and 10 blocks from the feeder using the vacuum nozzle.
2. Stack the tokens and blocks alternately (e.g., token-block-token-block) over a designated platform located in its workspace.

This task focuses on the robot's ability to stack objects in an organized and stable manner.
### Task 3: Integration
This task combines object detection, handling, calibration, and reverse operation. The robot must:

1. Detect the available objects: Determine the number of tokens and blocks in the feeder.
2. Pick and calibrate: Pick tokens and blocks using the vacuum nozzle. Tokens must be calibrated using the robot arm, while blocks are calibrated using a cylinder.
3. Position in the tray: Once calibrated, the robot must place the tokens and blocks in their designated tray positions.
4. Activate reverse function:
  - Detect which tray positions are occupied.
  - Pick the objects from the tray.
  - Return the tokens and blocks to the feeder.
  
This task tests the robot’s integration of multiple functionalities, including object detection, calibration, precise placement, and reverse operation.

