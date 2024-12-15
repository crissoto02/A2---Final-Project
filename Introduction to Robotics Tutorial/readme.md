# Task 1 - Pick & Place
[![Pick place](https://github.com/user-attachments/assets/9eb57180-01a2-48d8-8577-bc0b4de51f2a)](https://www.youtube.com/watch?v=5dpe79_5fy0)
## Purpose ⚙️🛠️
### Pick Tokens and Blocks from the feeder
1. Position the Robot: Move the robot to the feeder location with the help of pre-defined points
2. Grab the object: When the robot arm is above the token/block, activates the nozzle to grab the token/block to move to the next position
### Move to the fixture to calibrate the center of tokens and blocks
1. Position the Robot: Move the token/block to the fixture plate (pre-defined points), ensuring no collision with other components in the workspace
2. Turn Off the nozzle: Release the token/block in the fixture
3. Calibrate the piece: Align the token/block in the fixture with help of the robot
4. Prepare to the next position: Grab again the token/block in the calibrated center to move to the next position
### Insert into Tray holes
1. Position the Robot: Navigate the robot arm to the tray position (pre-defined points) with the calibrated block/token
2. Insert the piece: Locate the hole of the corresponding token/block and insert it slowly to avoid serious collisions
3. Leave the piece to Repeat Process: Release the token/block once is in position and repeat the process with the other tokens/blocks
## Components 🕹️🔧
- 1 Feeder
- 1 Fixture
- 1 Tray
- 3 Tokens
- 3 Blocks
- I/O Box
## Electrical System 💡🔋
[![Wiring Diagram](https://img.shields.io/badge/Wiring%20Diagram-blue?style=for-the-badge)](IO%20Box/Task%201%20&%202/Wiring%20Diagram.md)
[![Button Features](https://img.shields.io/badge/Button%20Features-red?style=for-the-badge)](IO%20Box/Task%201%20&%202/Readme.md)
[![Programming](https://img.shields.io/badge/Buttons%20Programming-green?style=for-the-badge)](IO%20Box/Task%201%20&%202/IO%20Box%20Programming.md)

This task utilizes an **I/O Box** consisting of three latching buttons, two non-latching buttons, and a buzzer to control and execute various operations seamlessly during the process. 

- The **latching buttons** allow for persistent commands such as starting, pausing, or resetting tasks.  
- The **non-latching buttons** provide real-time control of the vacuum nozzle for precise handling.  
- The **buzzer** acts as a safety feature, alerting operators to any errors or issues, ensuring smooth and secure task execution.  
## Robot Programming 🤖💻
```markdown
# Function Task 1 (Pick and Place)
Function Task1
	For t_position = 0 To 2
		picktoken()
		FixToken()
		placetoken()
	Next t_position
	For b_position = 0 To 2
		pickblock()
		FixBlock()
		placeblock()
	Next b_position
	Go start
Fend
```
[Complete Code](Task%201%20-%20Pick&Place.md)

# Task 2 - Stacking
[![stacking](https://github.com/user-attachments/assets/c8882de6-105d-4501-bef5-2a4f00fb6390)](https://www.youtube.com/watch?v=eQkZRfKHFlY)
## Purpose ⚙️🛠️
### Pick Tokens and Blocks from the feeder
1. Position the Robot: Move the robot to the feeder location with the help of pre-defined points
2. Grab the object: When the robot arm is above the token/block, activates the nozzle to grab the token/block to move to the next position
### Stack the blocks and tokens on top of each other
1. Position the Robot: Move the robot to the base location with the help of a pre-defined point
2. Stack the blocks and tokens: Alternate between blocks and tokens to stack on top of each other
## Components 🕹️🔧
- 1 Feeder
- 1 Base
- 10 Tokens
- 10 Blocks
- I/O Box
## Electrical System 💡🔋
[![Wiring Diagram](https://img.shields.io/badge/Wiring%20Diagram-blue?style=for-the-badge)](IO%20Box/Task%201%20&%202/Wiring%20Diagram.md)
[![Button Features](https://img.shields.io/badge/Button%20Features-red?style=for-the-badge)](IO%20Box/Task%201%20&%202/Readme.md)
[![Programming](https://img.shields.io/badge/Buttons%20Programming-green?style=for-the-badge)](IO%20Box/Task%201%20&%202/IO%20Box%20Programming.md)

This task utilizes an **I/O Box** consisting of three latching buttons, two non-latching buttons, and a buzzer to control and execute various operations seamlessly during the process. 

- The **latching buttons** allow for persistent commands such as starting, pausing, or resetting tasks.  
- The **non-latching buttons** provide real-time control of the vacuum nozzle for precise handling.  
- The **buzzer** acts as a safety feature, alerting operators to any errors or issues, ensuring smooth and secure task execution.  
## Robot Programming 🤖💻
```markdown
# Function Task 2 (Stacking)
Function Task2
  For i = 0 To 19
  	If (i Mod 2) = 0 Then
  		Pick_Block()
  	Else
  		Pick_Token()
  		counter = counter - 1
  	EndIf
  Next i
  Go start
Fend
```
[Complete Code](Task%202%20-%20Stacking.md)
# Task 3 - Integration
[![Integration](https://github.com/user-attachments/assets/4adac686-5717-468a-afd5-ee4216fa4fa5)](https://www.youtube.com/watch?v=irjXbaM0WYo)
## Purpose ⚙️🛠️
### Pick Tokens and Blocks from the feeder
1. Position the Robot: Move the robot to the feeder location with the help of pre-defined points
2. Use Sensor: Activate a pressure sensor to know how many blocks and tokens are in the feeder
3. Grab the object: When the robot arm is above the token/block, activates the nozzle to grab the token/block to move to the next position
### Move to the fixture to calibrate the center of tokens and blocks
1. Position the Robot: Move the token/block to the fixture plate (pre-defined points), ensuring no collision with other components in the workspace
2. Turn Off the nozzle: Release the token/block in the fixture
3. Calibrate the piece: Align the token/block in the fixture with help of the robot or using a cylinder
4. Prepare to the next position: Grab again the token/block in the calibrated center to move to the next position
### Insert into Tray holes
1. Position the Robot: Navigate the robot arm to the tray position (pre-defined points) with the calibrated block/token
2. Insert the piece: Locate the hole of the corresponding token/block and insert it slowly to avoid serious collisions
3. Leave the piece to Repeat Process: Release the token/block once is in position and repeat the process with the other tokens/blocks
### Return the blocks and tokens to the feeder (Reverse Function)
1. Position the Robot: Move the robot to the tray location
2. Use Sensor: Activate a pressure sensor to know is there are something in the tray position, if detect nothing will move to the next position
3. Perform inverse operations: If detect an object in the tray the robot will perform fixture and place operation leaving the block/token to the feeder again
## Components 🕹️🔧
- 1 Feeder
- 1 Fixture
- 1 Tray  ([3D CAD](3D%20CAD%20ASSETS/Tray%20-%20Task%203/Tray%20Model.stl))
- Pressure Sensor
- Cylinder
- Cylinder Holder ([3D CAD](3D%20CAD%20ASSETS/Holder%20Block%20-%20Task%203/Holder%20for%20Block%20Model.stl))
- 3 Tokens
- 3 Blocks
- I/O Box
## Electrical System 💡🔋
[![Wiring Diagram](https://img.shields.io/badge/Wiring%20Diagram-blue?style=for-the-badge)](IO%20Box/Task%203/IO%20Box%20Wiring%20Diagram.md)
[![Button Features](https://img.shields.io/badge/Button%20Features-red?style=for-the-badge)](IO%20Box/Task%203/Readme.md)
[![Programming](https://img.shields.io/badge/Buttons%20Programming-green?style=for-the-badge)](IO%20Box/Task%203/IO%20Box%20Programming.md)
[![HMI & GUI](https://img.shields.io/badge/HMI%20&%20GUI-yellow?style=for-the-badge)](HMI%20(task%203).md)

This task utilizes an **I/O Box** consisting of three latching buttons, two non-latching buttons, and a buzzer to control and execute various operations seamlessly during the process. 

- The **latching buttons** allow for persistent commands such as starting, pausing, or resetting tasks.  
- The **non-latching buttons** provide real-time control of the vacuum nozzle and control the Reverse function.  
- The **buzzer** acts as a safety feature, alerting operators to any errors or issues, ensuring smooth and secure task execution.
  
In addition to the physical buttons, the system also includes an **HMI (Human-Machine Interface)** and a **GUI (Graphical User Interface)**, allowing operators to control the buttons virtually. This dual interface ensures greater flexibility and ease of operation, enabling both physical and virtual interaction with the robot's control system.  
## Robot Programming 🤖💻
```markdown
# Function Task 3 (Integration)
Function task3
	CheckToken()
	CheckBlock()
	If worktoken = 1 And workblock = 1 Then
		On 13
		GoTo End
	EndIf
	If worktoken = 0 Then
		For tokenpos = findtoken To 2
 			PickToken()
 			FixToken()
 			PlaceToken()
	 	Next
	ElseIf worktoken = 1 Then
		GoTo Block
	EndIf
 	Block:
 	If workblock = 0 Then
 		For blockpos = findblock To 2
 			PickBlock()
 			FixBlock()
 			PlaceBlock()
	 	Next
	ElseIf workblock = 1 Then
	 	GoTo End
 	EndIf
 	End:
	Go start
	Off 13
Fend
```
```markdown
# Function Reverse (Return the blocks and tokens to the feeder)
Function Reverse
	findtoken = -1
	findblock = -1
	tokenpos = 0
	blockpos = 0
	For tokenpos = 0 To 2
		RevToken()
	Next
	For blockpos = 0 To 2
		RevBlock()
	Next
	Go start
Fend
```
[Complete Code](Task%203%20-%20Integration.md)
