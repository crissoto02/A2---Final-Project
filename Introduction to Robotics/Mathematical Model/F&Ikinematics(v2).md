# Kinematics MATLAB GUI for a 3-DOF Robotic Manipulator (Version 2)

This MATLAB program provides a **Graphical User Interface (GUI)** to simulate and analyze the motion of a **3-DOF robotic arm**. It calculates the robot's movements using forward and inverse kinematics, generates smooth motion trajectories, and displays the results visually.

---

## Key Features

1. **Forward Kinematics**:
   - Calculates the position of the robot's end-effector (`X`, `Y`, `Z`) based on user-provided joint angles (`Theta_1`, `Theta_2`, `Theta_3`).
   - Visualizes the robot's configuration in 3D space.

2. **Inverse Kinematics**:
   - Computes the required joint angles (`Theta_1`, `Theta_2`, `Theta_3`) to reach a user-specified end-effector position (`X`, `Y`, `Z`).
   - Displays the calculated configuration of the robot.

3. **Trajectory Generation**:
   - Creates a smooth motion path for the robot to move from one configuration to another.
   - Visualizes the robot's motion and plots the path of the end-effector in 3D space.

4. **User-Friendly Interface**:
   - Input fields for joint angles and Cartesian coordinates.
   - Buttons to calculate forward and inverse kinematics.
   - Real-time visualization of robot movement and end-effector paths.
---

## How It Works

### **Forward Kinematics**
- Users input joint angles, and the program calculates where the end-effector is located in 3D space.
- The results are displayed in Cartesian coordinates (X, Y, Z), and the robot's configuration is plotted.

### **Inverse Kinematics**
- Users input the desired position of the end-effector in 3D space.
- The program calculates the joint angles needed to achieve that position and displays them in the GUI.
- The calculated configuration is plotted to verify the result.

### **Trajectory Generation**
- The program computes a smooth motion path between an initial and target configuration.
- It visualizes the robot’s movement along the trajectory and plots the end-effector's path as a 3D curve.
---

## Visualizations
1. **Robot Configuration**:
   - The robot’s position is updated in real time based on user inputs.
2. **End-Effector Trajectory**:
   - The program plots a smooth 3D curve showing the motion of the end-effector.
---
```matlab
function varargout = kinematics(varargin)
% KINEMATICS MATLAB code for kinematics.fig
% Begin initialization code 
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kinematics_OpeningFcn, ...
                   'gui_OutputFcn',  @kinematics_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code 

% --- Executes just before kinematics is made visible.
function kinematics_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for kinematics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = kinematics_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function Theta_1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Theta_2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Theta_3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btn_forward.
function btn_forward_Callback(hObject, eventdata, handles)

Th_1= str2double(handles.Theta_1.String);
Th_2= str2double(handles.Theta_2.String);
Th_3= str2double(handles.Theta_3.String);
L_1=40;
L_2=30;
L_3=20;
L(1)= Link([0 L_1 0 pi/2]);
L(2)= Link([0 0 L_2 0]);
L(3)= Link([0 0 L_3 0]);

Robot=SerialLink(L);
Robot.name='kinematics';
%Robot.plot([Th_1 Th_2 Th_3]);
 
Tout = Robot.fkine([Th_1 Th_2 Th_3]);
Tout_t = Tout.t;
handles.Pos_X.String= num2str(floor(Tout_t(1)));
handles.Pos_Y.String= num2str(floor(Tout_t(2)));
handles.Pos_Z.String= num2str(floor(Tout_t(3)));
%-------------------------------

% Desired end-effector pose
Tout = SE3(Th_1,Th_2,Th_3);
%Tout = SE3(20, 20 , 60);

% Compute inverse kinematics
q0 = [0 0 0];
Ji = Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

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

%------------------------------

function Pos_X_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Pos_Y_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Pos_Z_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

PX = str2double(handles.Pos_X.String);
PY = str2double(handles.Pos_Y.String);
PZ = str2double(handles.Pos_Z.String);

L_1 = 40;
L_2 = 30;
L_3 = 20;

L(1)= Link([0 L_1 0 pi/2]);
L(2)= Link([0 0 L_2 0]);
L(3)= Link([0 0 L_3 0]);

Robot=SerialLink(L);
Robot.name='kinematics';

Tout = SE3(PX, PY, PZ); 

J= Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

handles.Theta_1.String = num2str(floor(J(1)));
handles.Theta_2.String = num2str(floor(J(2)));
handles.Theta_3.String = num2str(floor(J(3)));

Robot.plot(J*pi/180);

   
