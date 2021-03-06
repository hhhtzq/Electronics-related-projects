function varargout = kalmanpredict(varargin)
% KALMANPREDICT M-file for kalmanpredict.fig
%      KALMANPREDICT, by itself, creates a new KALMANPREDICT or raises the existing
%      singleton*.
%
%      H = KALMANPREDICT returns the handle to a new KALMANPREDICT or the handle to
%      the existing singleton*.
%
%      KALMANPREDICT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KALMANPREDICT.M with the given input arguments.
%
%      KALMANPREDICT('Property','Value',...) creates a new KALMANPREDICT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kalmanpredict_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kalmanpredict_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kalmanpredict

% Last Modified by GUIDE v2.5 25-Dec-2009 14:39:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kalmanpredict_OpeningFcn, ...
                   'gui_OutputFcn',  @kalmanpredict_OutputFcn, ...
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


% --- Executes just before kalmanpredict is made visible.
function kalmanpredict_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kalmanpredict (see VARARGIN)

% Choose default command line output for kalmanpredict
handles.output = hObject;
set(handles.edit_du,'string','0.1');
set(handles.edit_q,'string','1e-6');
set(handles.edit_r,'string','1e-2');
set(handles.edit_p1,'string','10');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kalmanpredict wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kalmanpredict_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_du_Callback(hObject, eventdata, handles)
% hObject    handle to edit_du (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_du as text
%        str2double(get(hObject,'String')) returns contents of edit_du as a double


% --- Executes during object creation, after setting all properties.
function edit_du_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_du (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_q_Callback(hObject, eventdata, handles)
% hObject    handle to edit_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_q as text
%        str2double(get(hObject,'String')) returns contents of edit_q as a double


% --- Executes during object creation, after setting all properties.
function edit_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_r_Callback(hObject, eventdata, handles)
% hObject    handle to edit_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_r as text
%        str2double(get(hObject,'String')) returns contents of edit_r as a double


% --- Executes during object creation, after setting all properties.
function edit_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_p1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_p1 as text
%        str2double(get(hObject,'String')) returns contents of edit_p1 as a double


% --- Executes during object creation, after setting all properties.
function edit_p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_pre.
function pushbutton_pre_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=str2num(get(handles.edit_du,'string'));
Q=str2num(get(handles.edit_q,'string'));
R=str2num(get(handles.edit_r,'string'));
p(1)=str2num(get(handles.edit_p1,'string'));
N=200;
noise=3*randn(1,N);
if k==0
    xx=10*ones(1,N);
else xx=k:k:200*k;
end
z=xx+noise;
x(1)=0
for i=2:N
    faix(i)=k+x(i-1);
    faip(i)=p(i-1)+Q;
    kg(i)=faip(i)/(faip(i)+R);
    x(i)=faix(i)+kg(i)*[z(i)-faix(i)];
    p(i)=[1-kg(i)]*faip(i);
end
cla;
plot(z,'k');hold on;
plot(xx,'r');hold on;
plot(x,'b');
axis([1 200 0 200*k+15]);
legend('测量温度','实际温度','kalman预测温度');


