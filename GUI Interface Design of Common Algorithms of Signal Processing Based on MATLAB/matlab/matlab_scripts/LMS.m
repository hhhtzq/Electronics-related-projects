function varargout = LMS(varargin)
% LMS M-file for LMS.fig
%      LMS, by itself, creates a new LMS or raises the existing
%      singleton*.
%
%      H = LMS returns the handle to a new LMS or the handle to
%      the existing singleton*.
%
%      LMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LMS.M with the given input arguments.
%
%      LMS('Property','Value',...) creates a new LMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LMS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LMS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LMS

% Last Modified by GUIDE v2.5 25-Dec-2009 12:25:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LMS_OpeningFcn, ...
                   'gui_OutputFcn',  @LMS_OutputFcn, ...
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


% --- Executes just before LMS is made visible.
function LMS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LMS (see VARARGIN)

% Choose default command line output for LMS
handles.output = hObject;
global signal fs len;
[signal fs]=wavread('chirp');  
len=length(signal);
set(handles.edit_order,'string','5');
set(handles.edit_u,'string','0.1');
set(handles.edit_noisepower,'string','0.1');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LMS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LMS_OutputFcn(hObject, eventdata, handles) 
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
global signal fs len;
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'chirp'
         [signal fs]=wavread('chirp');  
    case 'train'
         [signal fs]=wavread('train');          
    case '音频'
        [FileName,PathName] = uigetfile(...
            {'*.wav','Wave Files(*.wav)';},...
            '选择音频文件' );
        if isequal(FileName,0) || isequal(PathName,0),
        return;
        end
        fPath = [PathName,FileName];
        [signal fs]=wavread(fPath);
        signal=signal(:,1);
end
len=length(signal);


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



function edit_noisepower_Callback(hObject, eventdata, handles)
% hObject    handle to edit_noisepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_noisepower as text
%        str2double(get(hObject,'String')) returns contents of edit_noisepower as a double


% --- Executes during object creation, after setting all properties.
function edit_noisepower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_noisepower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_orign.
function pushbutton_orign_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
sound(signal,fs);
axes(handles.axes1);
plot(signal);legend('原始信号');
s=fftshift(fft(signal));
axes(handles.axes2);
plot(abs(s));legend('原始信号频谱');



% --- Executes on button press in pushbutton_noise.
function pushbutton_noise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global noise fs len;
noisepower=str2num(get(handles.edit_noisepower,'string'));
noise=randn(len,1)*noisepower;
sound(noise,fs);
axes(handles.axes1);
plot(noise);legend('噪声信号');
s=fftshift(fft(noise));
axes(handles.axes2);
plot(abs(s));legend('噪声信号频谱');



% --- Executes on button press in pushbutton_addnoise.
function pushbutton_addnoise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_addnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global now signal noise fs len;
now=signal+noise;
sound(now,fs);
axes(handles.axes1);
plot(now);legend('加噪信号');
s=fftshift(fft(now));
axes(handles.axes2);
plot(abs(s));legend('加噪信号频谱');


% --- Executes on button press in pushbutton_adapt.
function pushbutton_adapt_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_adapt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global now noise fs len;
N=str2double(get(handles.edit_order,'string'));
u=str2double(get(handles.edit_u,'string'));
P=sum(now.^2)/(len+1);
delta=u/(10*N*P);
[h,yc,e]=lms(noise,now,delta,N);
sound(e,fs);

Y=fftshift(abs(fft(e)));
axes(handles.axes1)
plot([1:length(e)],e);legend('自适应滤波');
axes(handles.axes2)
plot([1:length(Y)],Y);legend('自适应滤波频谱');


function [h,y,e]=lms(x,d,step,N)
%LMS算法的实现
%[h,y]=lms(x,d,u,N)
%h=估计的FIR滤波器
%y=输出数组y(n)
%x=输入数组x(n)
%d=预期数组d(n),其长度应与x相同
%step=步长
%N=FIR滤波器的长度
x=x';
M=length(x);y=zeros(1,M);
h=zeros(1,N);
for n=N:M
      x1=x(n:-1:n-N+1);
       y(n)=h*x1';
       e(n)=d(n)-y(n);
       h=h+step*e(n)*x1;
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


