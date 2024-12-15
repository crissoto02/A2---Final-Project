# Kinematics MATLAB GUI for a 3-DOF Robotic Manipulator

This MATLAB project implements a **Graphical User Interface (GUI)** using **GUIDE** to analyze and visualize the kinematics of a **3-DOF robotic manipulator**. It supports both **forward kinematics** and **inverse kinematics** computations, enabling users to input joint angles or desired end-effector positions and visualize the results in real time.

---
```matlab
function varargout = kinematics(varargin)
% KINEMATICS MATLAB code for kinematics.fig
%      KINEMATICS, by itself, creates a new KINEMATICS or raises the existing
%      singleton*.
%
%      H = KINEMATICS returns the handle to a new KINEMATICS or the handle to
%      the existing singleton*.
%
%      KINEMATICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KINEMATICS.M with the given input arguments.
%
%      KINEMATICS('Property','Value',...) creates a new KINEMATICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kinematics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kinematics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kinematics

% Last Modified by GUIDE v2.5 02-Dec-2024 15:48:02

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before kinematics is made visible.
function kinematics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kinematics (see VARARGIN)

% Choose default command line output for kinematics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kinematics wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kinematics_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_1 as text
%        str2double(get(hObject,'String')) returns contents of Theta_1 as a double


% --- Executes during object creation, after setting all properties.
function Theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_2 as text
%        str2double(get(hObject,'String')) returns contents of Theta_2 as a double


% --- Executes during object creation, after setting all properties.
function Theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Theta_3 as text
%        str2double(get(hObject,'String')) returns contents of Theta_3 as a double


% --- Executes during object creation, after setting all properties.
function Theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_forward.
function btn_forward_Callback(hObject, eventdata, handles)
% hObject    handle to btn_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Th_1= str2double(handles.Theta_1.String)*pi/180;
Th_2= str2double(handles.Theta_2.String)*pi/180;
Th_3= str2double(handles.Theta_3.String)*pi/180;
L_1=40;
L_2=30;
L_3=20;
L(1)= Link([0 L_1 0 pi/2]);
L(2)= Link([0 0 L_2 0]);
L(3)= Link([0 0 L_3 0]);

Robot=SerialLink(L);
Robot.name='kinematics';
Robot.plot([Th_1 Th_2 Th_3]);

Tout = Robot.fkine([Th_1 Th_2 Th_3]);
Tout_t = Tout.t;
handles.Pos_X.String= num2str(floor(Tout_t(1)));
handles.Pos_Y.String= num2str(floor(Tout_t(2)));
handles.Pos_Z.String= num2str(floor(Tout_t(3)));



function Pos_X_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_X as text
%        str2double(get(hObject,'String')) returns contents of Pos_X as a double


% --- Executes during object creation, after setting all properties.
function Pos_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Y_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Y as text
%        str2double(get(hObject,'String')) returns contents of Pos_Y as a double


% --- Executes during object creation, after setting all properties.
function Pos_Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pos_Z_Callback(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pos_Z as text
%        str2double(get(hObject,'String')) returns contents of Pos_Z as a double


% --- Executes during object creation, after setting all properties.
function Pos_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pos_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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



%J= Robot.ikine(Tout, [0 0 0], [1 1 1 0 0 0 ])*180/pi;
%handles.Theta_1.String = num2str(floor(J(1)));
%handles.Theta_2.String = num2str(floor(J(2)));
%handles.Theta_3.String = num2str(floor(J(3)));
J= Robot.ikine(Tout, 'mask', [1 1 1 0 0 0]);

handles.Theta_1.String = num2str(floor(J(1)));
handles.Theta_2.String = num2str(floor(J(2)));
handles.Theta_3.String = num2str(floor(J(3)));

Robot.plot(J*pi/180);
   

%analizar pq me da errores
%mapea cuando esta competamente estirado
```

## Features

1. **Forward Kinematics**  
   - **Input**: Joint angles (Theta_1, Theta_2, Theta_3) in degrees.  
   - **Computation**: Calculates the end-effector position using the **forward kinematics** function `fkine` based on Denavit-Hartenberg (DH) parameters.  
   - **Output**: Displays the Cartesian coordinates (Pos_X, Pos_Y, Pos_Z) of the end-effector.  
   - **Visualization**: Plots the robot's configuration in 3D space.

2. **Inverse Kinematics**  
   - **Input**: Desired Cartesian position (Pos_X, Pos_Y, Pos_Z) of the end-effector.  
   - **Computation**: Solves for joint angles (Theta_1, Theta_2, Theta_3) using the **inverse kinematics** function `ikine` with translation constraints.  
   - **Output**: Displays the corresponding joint angles.  
   - **Visualization**: Plots the robot's configuration based on the calculated joint angles.

---

## GUI Layout

### Input Fields:
- **Theta_1**, **Theta_2**, **Theta_3**: Input joint angles in degrees.
- **Pos_X**, **Pos_Y**, **Pos_Z**: Input Cartesian coordinates for the end-effector.

### Buttons:
- **Forward Kinematics**: Calculates the end-effector position from the joint angles.
- **Inverse Kinematics**: Computes the joint angles from the desired end-effector position.

### Outputs:
- Displays the calculated **end-effector position** or **joint angles**.

### Visualization:
- The robot’s movement and configuration are plotted in a 3D environment using the **Robotics Toolbox**.

---

## Code Breakdown

### Initialization and GUI Setup
The GUI is initialized with the `kinematics_OpeningFcn` function. Default values and callbacks for GUI elements are established.

---

### Forward Kinematics (`btn_forward_Callback`)
The forward kinematics is calculated based on the user-provided joint angles:
```matlab
% Convert joint angles to radians
Th_1 = str2double(handles.Theta_1.String) * pi / 180;
Th_2 = str2double(handles.Theta_2.String) * pi / 180;
Th_3 = str2double(handles.Theta_3.String) * pi / 180;

% Define link lengths
L_1 = 40; L_2 = 30; L_3 = 20;

% Define DH parameters
L(1) = Link([0 L_1 0 pi/2]);
L(2) = Link([0 0 L_2 0]);
L(3) = Link([0 0 L_3 0]);

% Create SerialLink Robot
Robot = SerialLink(L);

% Plot robot configuration
Robot.plot([Th_1 Th_2 Th_3]);

% Calculate end-effector position
Tout = Robot.fkine([Th_1 Th_2 Th_3]);
Tout_t = Tout.t;

% Display position in GUI
handles.Pos_X.String = num2str(floor(Tout_t(1)));
handles.Pos_Y.String = num2str(floor(Tout_t(2)));
handles.Pos_Z.String = num2str(floor(Tout_t(3)));
