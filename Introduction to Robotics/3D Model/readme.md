# Robotic Arm Structure of the Model

The robotic system consists of a **3-DOF robotic arm** mounted on a **mobile base with omnidirectional wheels**. Its primary purpose is for **clinical disinfection** using ultraviolet (UV) light. Below is a detailed explanation of its components and functionalities:


---

## 1. Robotic Arm
The robotic arm has **three rotational joints** that enable flexible movement:

- **Base Joint (Rotational around Z-axis):**  
  - Located at the bottom of the robotic arm.  
  - Allows the entire arm to rotate around the vertical axis.  
  - Provides a sweeping motion to cover a wide disinfection area.  

- **First Arm Joint (Rotational around Y-axis):**  
  - Connects the base to the first arm link.  
  - Enables the arm to **pivot vertically**, adjusting the height and orientation of the arm.

- **Second Arm Joint (Rotational around Y-axis):**  
  - Located at the top of the first arm link.  
  - Provides additional **vertical articulation** for the arm, improving precision in positioning.  

These three rotational joints allow the robotic arm to reach various angles and positions effectively for surface disinfection.
![Model](https://github.com/user-attachments/assets/38a6fe48-e6e5-41ad-bfb7-dd4118fd2de8)


---

## 2. Mobile Base with Omnidirectional Wheels
The robotic arm is mounted on a mobile base equipped with four omnidirectional Mecanum wheels:

- **Mobility**:  
  The wheels enable the robot to move in any direction (forward, backward, sideways, and diagonally) without rotating the base.  

- **Precision**:  
  Omnidirectional movement allows the robot to navigate tight spaces such as hospital rooms and position itself accurately for disinfection.  

- **Stability**:  
  The low-profile design of the base ensures that the robot remains stable while operating the robotic arm.

---

## 3. Ultraviolet (UV) Light System
The robotic arm is equipped with ultraviolet (UV) lights at its end-effector for clinical disinfection:

- **Functionality**:  
  - The UV lights emit UV-C light, which is highly effective at killing bacteria, viruses, and other pathogens on surfaces.  
  - The robotic arm can adjust its position and orientation to ensure comprehensive coverage of the targeted area.

- **Applications**:  
  - Suitable for disinfecting surfaces in hospitals, clinics, operating rooms, and other healthcare environments.

---

## Functionality
The robot combines **mobility, flexibility, and precision** to perform surface disinfection effectively:

1. The **mobile base** positions the robot in the desired location.  
2. The **robotic arm** adjusts its position and orientation to direct UV light to the required surfaces.  
3. The system ensures comprehensive disinfection, including hard-to-reach areas, by leveraging its flexibility and range of motion.  

This design makes the robot an ideal solution for maintaining sterile environments in healthcare and other critical facilities.

---
