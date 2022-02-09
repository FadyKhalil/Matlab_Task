function varargout = TrafficLight(varargin)
% TRAFFICLIGHT MATLAB code for TrafficLight.fig
%      TRAFFICLIGHT, by itself, creates a new TRAFFICLIGHT or raises the existing
%      singleton*.
%
%      H = TRAFFICLIGHT returns the handle to a new TRAFFICLIGHT or the handle to
%      the existing singleton*.
%
%      TRAFFICLIGHT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAFFICLIGHT.M with the given input arguments.
%
%      TRAFFICLIGHT('Property','Value',...) creates a new TRAFFICLIGHT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TrafficLight_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TrafficLight_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TrafficLight

% Last Modified by GUIDE v2.5 09-Feb-2022 18:20:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TrafficLight_OpeningFcn, ...
                   'gui_OutputFcn',  @TrafficLight_OutputFcn, ...
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


% --- Executes just before TrafficLight is made visible.
function TrafficLight_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TrafficLight (see VARARGIN)

% Choose default command line output for TrafficLight
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%delete (instrfind ({'port'},{'COM5'}))
clear all;
global a;
global toggle;
a = arduino;
configurePin (a, 'D4', 'Digitaloutput');
configurePin (a, 'D5', 'Digitaloutput');
configurePin (a, 'D6', 'Digitaloutput');
configurePin (a, 'D7', 'Digitaloutput');

% UIWAIT makes TrafficLight wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TrafficLight_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Red.
function Red_Callback(hObject, eventdata, handles)
% hObject    handle to Red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a;
global toggle;
if toggle == 1
    writeDigitalPin(a, 'D4', 1);
    writeDigitalPin(a, 'D5', 0);
    writeDigitalPin(a, 'D6', 0);
end


% --- Executes on button press in Orange.
function Orange_Callback(hObject, eventdata, handles)
% hObject    handle to Orange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toggle;
global a;
if toggle == 1
    writeDigitalPin(a, 'D4', 0);
    writeDigitalPin(a, 'D5', 1);
    writeDigitalPin(a, 'D6', 0);
end

% --- Executes on button press in Green.
function Green_Callback(hObject, eventdata, handles)
% hObject    handle to Green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global toggle;
global a;
if toggle == 1
    writeDigitalPin(a, 'D4', 0);
    writeDigitalPin(a, 'D5', 0);
    writeDigitalPin(a, 'D6', 1);
end

% --- Executes on button press in Maintenance.
function Maintenance_Callback(hObject, eventdata, handles)
% hObject    handle to Maintenance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D5', 0);
writeDigitalPin(a, 'D6', 0);
writeDigitalPin(a, 'D7', 0);


% --- Executes on button press in Deploy.
function Deploy_Callback(hObject, eventdata, handles)
% hObject    handle to Deploy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
i = 0
manual = get(handles.radiobutton2, 'Value')
auto = get(handles.radiobutton1, 'Value')
stopit = get(handles.Maintenance, 'Value')
 I = imread('walk.PNG');
 J = imread('car.PNG');

global toggle;
toggle = 0;
if manual == 1
    toggle = 1
else if auto == 1
    toggle = 0
    
    while stopit ~= 1
        i = i + 1
        stopit = get(handles.Maintenance, 'Value')
        switch(i)
        
            case 1
                writeDigitalPin(a, 'D7', 0);
                writeDigitalPin(a, 'D4', 0);
                writeDigitalPin(a, 'D5', 0);
                writeDigitalPin(a, 'D6', 1);
                axes(handles.axes1);
                imshow(J);
                pause(3)
            case 2
                writeDigitalPin(a, 'D4', 0);
                writeDigitalPin(a, 'D5', 1);
                writeDigitalPin(a, 'D6', 0);
                pause(2)
            case 3
                writeDigitalPin(a, 'D4', 1);
                writeDigitalPin(a, 'D5', 0);
                writeDigitalPin(a, 'D6', 0);
                pause(1)
            case 4
                axes(handles.axes1);
                imshow(I);
                writeDigitalPin(a, 'D4', 1);
                writeDigitalPin(a, 'D7', 1);
                pause(2)
                i = 0
            
        end


    end

end
end



% --- Executes on button press in Auto.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Auto


% --- Executes on button press in Manual.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to Manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Manual


    
