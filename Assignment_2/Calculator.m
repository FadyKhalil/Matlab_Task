function varargout = Calculator(varargin)
% CALCULATOR MATLAB code for Calculator.fig
%      CALCULATOR, by itself, creates a new CALCULATOR or raises the existing
%      singleton*.
%
%      H = CALCULATOR returns the handle to a new CALCULATOR or the handle to
%      the existing singleton*.
%
%      CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR.M with the given input arguments.
%
%      CALCULATOR('Property','Value',...) creates a new CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculator

% Last Modified by GUIDE v2.5 30-Dec-2021 12:46:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculator_OutputFcn, ...
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


% --- Executes just before Calculator is made visible.
function Calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculator (see VARARGIN)

% Choose default command line output for Calculator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global operator
global x
global y


% UIWAIT makes Calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Equal.
function Equal_Callback(hObject, eventdata, handles)
    
    Num1 = str2double(get(handles.First, 'string'));
    Num2 = str2double(get(handles.Second, 'string'));
    global operator

    switch(operator)
        case 1
            c = Num1+Num2;
        case 2
            c = Num1-Num2;
        case 3
            c = Num1*Num2;
        case 4
            c = Num1/Num2;
    end
    if isnan(c)
        set(handles.Error, 'string', 'Undefined Variable')
        set(handles.Result, 'string', ' ')
    elseif c == inf
        set(handles.Error, 'string', 'Cannot devide by 0')
        set(handles.Result, 'string', ' ')
    else
        set(handles.Error, 'string', ' ')
        set(handles.Result, 'string', c)
    end
        
    
    


function First_Callback(hObject, eventdata, handles)
% hObject    handle to First (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of First as text
%      str2double(get(hObject,'String')) returns contents of First as a double
    

% --- Executes during object creation, after setting all properties.
function First_CreateFcn(hObject, eventdata, handles)
% hObject    handle to First (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Second_Callback(hObject, eventdata, handles)
    

% --- Executes during object creation, after setting all properties.
function Second_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Second (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Operator.
function Operator_Callback(hObject, eventdata, handles)
    global operator
    operator = get(handles.Operator, 'value');

% --- Executes during object creation, after setting all properties.
function Operator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Operator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X_Callback(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X as text
%        str2double(get(hObject,'String')) returns contents of X as a double


% --- Executes during object creation, after setting all properties.
function X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y_Callback(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y as text
%        str2double(get(hObject,'String')) returns contents of Y as a double


% --- Executes during object creation, after setting all properties.
function Y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Equal2.
function Equal2_Callback(hObject, eventdata, handles)
% hObject    handle to Equal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    X = get(handles.X,'string');
    Y = get(handles.Y, 'string');

    global operator
    global x y
     
    x = str2double(strsplit(X, ' '));
    y = str2double(strsplit(Y,' '));
    
    switch (operator)
        case 1
            g = x + y;
        case 2
            g = x - y;
        case 3
            g = x .* y;
        case 4
            g = x ./ y;
    end
    g = num2str(g);
    
    if isnan(g)
        set(handles.Error, 'string', 'Undefined Variable')
        set(handles.Result, 'string', ' ')
    elseif g == inf
        set(handles.Error, 'string', 'Cannot devide by 0')
        set(handles.Result, 'string', ' ')
    else
        set(handles.Result, 'string', g)
        set(handles.Error, 'string', ' ')
    end
    
    


% --- Executes on button press in Plotx.
function Plotx_Callback(hObject, eventdata, handles)
% hObject    handle to Plotx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global x
    axes(handles.axes1);
    plot(x)
% Hint: get(hObject,'Value') returns toggle state of Plotx


% --- Executes on button press in Ploty.
function Ploty_Callback(hObject, eventdata, handles)
% hObject    handle to Ploty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global y
    axes(handles.axes1);
    plot(y)
% Hint: get(hObject,'Value') returns toggle state of Ploty


% --- Executes on button press in PlotXY.
function PlotXY_Callback(hObject, eventdata, handles)
% hObject    handle to PlotXY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global x y
    hold off
    axes(handles.axes1);
    plot(x,y)
% Hint: get(hObject,'Value') returns toggle state of PlotXY


% --- Executes on button press in Cosine.
function Cosine_Callback(hObject, eventdata, handles)
% hObject    handle to Cosine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    plot(cos(1:0.1:4*pi))
% Hint: get(hObject,'Value') returns toggle state of Cosine


% --- Executes on button press in Sine.
function Sine_Callback(hObject, eventdata, handles)
% hObject    handle to Sine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    plot(sin(1:0.1:4*pi))
   
% Hint: get(hObject,'Value') returns toggle state of Sine


% --- Executes on button press in Func.
function Func_Callback(hObject, eventdata, handles)
% hObject    handle to Func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    try
        x = linspace(0,4,100);
        fn = get(handles.Function, 'string');
        ezplot(fn)
    catch
        set(handles.Error, 'string', 'This is not a Function')
    end
    


% Hint: get(hObject,'Value') returns toggle state of Func



function Function_Callback(hObject, eventdata, handles)
% hObject    handle to Function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
% Hints: get(hObject,'String') returns contents of Function as text
%        str2double(get(hObject,'String')) returns contents of Function as a double


% --- Executes during object creation, after setting all properties.
function Function_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
