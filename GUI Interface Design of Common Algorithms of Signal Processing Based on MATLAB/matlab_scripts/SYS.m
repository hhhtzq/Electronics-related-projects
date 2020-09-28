function varargout = SYS(varargin)
% SYS M-file for SYS.fig
%      SYS, by itself, creates a new SYS or raises the existing
%      singleton*.
%
%      H = SYS returns the handle to a new SYS or the handle to
%      the existing singleton*.
%
%      SYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SYS.M with the given input arguments.
%
%      SYS('Property','Value',...) creates a new SYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SYS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SYS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SYS

% Last Modified by GUIDE v2.5 25-Dec-2009 14:23:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SYS_OpeningFcn, ...
                   'gui_OutputFcn',  @SYS_OutputFcn, ...
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


% --- Executes just before SYS is made visible.
function SYS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SYS (see VARARGIN)

% Choose default command line output for SYS
handles.output = hObject;
set(handles.edit_order,'string','5');
set(handles.edit_u,'string','0.01');
global fs x b a d;
fs=800;
det=1/fs;
f1=100;
f2=200;
t=0:det:2-det;
x=cos(2*pi*f1*t)+cos(2*pi*f2*t);
[b,a]=butter(5,150*2/fs);
d=filter(b,a,x);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SYS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SYS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global fs x d b a;
val = get( hObject, 'Value' );
str = get(hObject,'String');
switch str{val}
    case 'Butterworth Lowpass'
         [b,a]=butter(5,150*2/fs);
         d=filter(b,a,x);
    case 'Butterworth Highpass'
         [b,a]=butter(5,150*2/fs,'high');
         d=filter(b,a,x);
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_order_Callback(hObject, eventdata, handles)
% hObject    handle to edit_order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_order as text
%        str2double(get(hObject,'String')) returns contents of edit_order as a double


% --- Executes during object creation, after setting all properties.
function edit_order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_u_Callback(hObject, eventdata, handles)
% hObject    handle to edit_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_u as text
%        str2double(get(hObject,'String')) returns contents of edit_u as a double


% --- Executes during object creation, after setting all properties.
function edit_u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
axes(handles.axes1);cla;
plot(x(1:length(x)/16));legend('原始信号');
axis([0 100 -3 3]);
axes(handles.axes2);cla;
X=abs(fft(x,2048));
Nx=length(x);
kx=0:800/Nx:(Nx/2-1)*(800/Nx);
plot(kx,X(1:Nx/2));legend('原始频谱');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x d y h;
N=str2num(get(handles.edit_order,'string'));
u=str2num(get(handles.edit_u,'string'));
M=length(x);
P=sum(x.^2)/(M+1);
delta=u/(10*N*P);
y=zeros(1,M);
h=zeros(1,N);
for  n=N:M
         x1=x(n:-1:n-N+1);
         y(n)=h*x1';
         e(n)=d(n)-y(n);
         h=h+delta.*e(n).*x1;
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d y;
D=abs(fft(d,2048));
Nd=length(D);
kd=0:800/Nd:(Nd/2-1)*(800/Nd);
Y=abs(fft(y,2048));
Ny=length(Y);
ky=0:800/Ny:(Ny/2-1)*(800/Ny);
axes(handles.axes1);cla;
plot(kd,D(1:Nd/2));legend('经未知系统后频谱');
axes(handles.axes2);cla;
plot(ky,Y(1:Ny/2));
legend('经自适应系统后频谱');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y d h b a;
[h1 w1]=freqz(b,a);
[h2 w2]=freqz(h);
axes(handles.axes1);
plot(w1/pi,abs(h1));
legend('未知系统幅频特性');
axes(handles.axes2);
plot(w2/pi,abs(h2));
legend('自适应系统幅频特性');



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y d h b a;
[h1 w1]=freqz(b,a);
[h2 w2]=freqz(h);
axes(handles.axes1);
plot(w1/pi,unwrap(angle(h1)));
legend('未知系统相频特性');
axes(handles.axes2);
plot(w2/pi,unwrap(angle(h2)));
legend('自适应系统相频特性');



