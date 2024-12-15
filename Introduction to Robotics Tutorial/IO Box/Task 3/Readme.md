# Button Features (Task 3)

The robot control system incorporates a set of **physical buttons** with specific functions to manage various operations efficiently. These buttons are designed to control the robot's actions, ensure safety, and handle errors during the task execution. Below is an overview of the button features:

- **🟢Green Latching Push Button**:  
  Starts the operation of the task by sending a signal to initiate the robot's programmed sequence.

- **🔴Red Latching Push Button**:  
  Pauses the operation temporarily until the button is released. The robot remains in a safe paused state during this time.

- **🟠Orange Latching Push Button**:  
  Resets the entire operation, bringing the robot back to its initial state and clearing all active tasks.

- **🔵Blue Non-Latching Push Button**:  
  Returns blocks and tokens to the feeder (Reverse operation). This is activated only while the button is pressed.

- **⚪White Non-Latching Push Button**:  
  Turns off the vacuum nozzle, releasing any object held by the robot. This is useful for object placement.

- **🚫Emergency Signal (Buzzer or Light)**:  
  Activates in case of an error during the operation. The robot stays in a paused state, and the signal alerts the operator to resolve the issue.

---

These buttons, combined with their clear functionality, provide an intuitive and efficient way to interact with the robot, ensuring safety and precision in task execution.
