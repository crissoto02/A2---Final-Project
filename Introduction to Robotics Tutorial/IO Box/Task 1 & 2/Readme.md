# Implementation of an I/O Box for Robot Control (Task 1 & 2)

The **I/O Box** serves as the central interface for managing the robot's operations through various input and output functions. It provides a set of physical buttons and visual indicators to control, monitor, and respond to different task states. The design ensures user-friendly interaction, safety, and precise control over the robot’s actions during task execution.

---

## Key Features

1. **Input Buttons**:  
   - A set of latching and non-latching push buttons allow the operator to perform essential commands such as starting, pausing, and resetting operations.

2. **Emergency Handling**:  
   - An emergency signal light alerts the operator in case of errors, while the robot enters a safe pause state.

3. **Control of the Vacuum Nozzle**:  
   - Dedicated buttons enable direct control to activate or deactivate the vacuum nozzle during tasks.

---

## Button Implementation Details

- **🟢Green Latching Push Button**:  
  - **Function**: Starts the robot’s task operation.  
  - **Implementation**:  
    - Signal is sent to the robot controller to initiate the programmed task.  
    - State persists until manually turned off.

- **🔴Red Latching Push Button**:  
  - **Function**: Pauses the robot's operation.  
  - **Implementation**:  
    - Sends a pause signal to the robot controller.  
    - Robot enters a temporary stop state until the button is released.

- **🟠Orange Latching Push Button**:  
  - **Function**: Resets the entire operation.  
  - **Implementation**:  
    - Sends a reset signal to restart all robot systems and return the robot to its initial state.

- **🔵Blue Non-Latching Push Button**:  
  - **Function**: Turns on the vacuum nozzle.  
  - **Implementation**:  
    - Triggers an I/O signal to power the vacuum system and hold objects for pick-and-place operations.

- **⚪White Non-Latching Push Button**:  
  - **Function**: Turns off the vacuum nozzle.  
  - **Implementation**:  
    - Deactivates the vacuum system, releasing the held objects.

- **🚫Emergency Signal (Red Light)**:  
  - **Function**: Activates in case of an error during operation.  
  - **Implementation**:  
    - An error condition (e.g., hardware failure or safety breach) triggers the light.  
    - Robot transitions into a pause state, ensuring safety while awaiting further input.

---

## Design Considerations

- **Safety**:  
  - The system ensures that the robot halts operations in the event of an error, minimizing risks during emergencies.

- **Ease of Use**:  
  - Intuitive button layout and latching mechanisms provide clear control to operators.

- **Real-Time Feedback**:  
  - The emergency signal visually alerts the operator of issues for quick intervention.

---

## Benefits of the I/O Box

- Streamlines task management by providing direct physical controls.
- Enhances operational safety with emergency stop and error notification.
- Improves workflow efficiency with quick access to critical functions like nozzle control and reset.

This I/O Box implementation ensures robust, safe, and efficient operation of the robot across various tasks.
