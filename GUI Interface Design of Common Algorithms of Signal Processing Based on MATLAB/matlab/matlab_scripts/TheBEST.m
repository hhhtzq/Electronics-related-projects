function varargout = TheBEST(varargin)
% THEBEST M-file for TheBEST.fig
%      THEBEST, by itself, creates a new THEBEST or raises the existing
%      singleton*.
%
%      H = THEBEST returns the handle to a new THEBEST or the handle to
%      the existing singleton*.
%
%      THEBEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THEBEST.M with the given input arguments.
%
%      THEBEST('Property','Value',...) creates a new THEBEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TheBEST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TheBEST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TheBEST

% Last Modified by GUIDE v2.5 21-Dec-2009 15:11:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TheBEST_OpeningFcn, ...
                   'gui_OutputFcn',  @TheBEST_OutputFcn, ...
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


% --- Executes just before TheBEST is made visible.
function TheBEST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TheBEST (see VARARGIN)

% Choose default command line output for TheBEST
handles.output = hObject;
% set(handles.popupmenu_source,'String','chirp');
set(handles.edit_noise,'String','0.1');
set(handles.edit_step,'String','200');


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TheBEST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TheBEST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu_source.
function popupmenu_source_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu_source contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_source
global signal fs len;
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'chirp'
         [signal fs]=wavread('chirp');  
    case 'train'
         [signal fs]=wavread('train');          
    case '��Ƶ'
        [FileName,PathName] = uigetfile(...
            {'*.wav','Wave Files(*.wav)';},...
            'ѡ����Ƶ�ļ�' );
        if isequal(FileName,0) || isequal(PathName,0),
        return;
        end
        fPath = [PathName,FileName];
        [signal fs]=wavread(fPath);
        signal=signal(:,1);
end
len=length(signal);


% --- Executes during object creation, after setting all properties.
function popupmenu_source_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_noise_Callback(hObject, eventdata, handles)
% hObject    handle to edit_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_noise as text
%        str2double(get(hObject,'String')) returns contents of edit_noise as a double



% --- Executes during object creation, after setting all properties.
function edit_noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_step_Callback(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_step as text
%        str2double(get(hObject,'String')) returns contents of edit_step as a double


% --- Executes during object creation, after setting all properties.
function edit_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_origin.
function button_origin_Callback(hObject, eventdata, handles)
% hObject    handle to button_origin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs len;
t=0:len-1;
sound(signal,fs);
Y=fftshift(abs(fft(signal)));
axes(handles.axes1)
plot(signal);
axes(handles.axes2);
plot([1:length(Y)],Y);


% --- Executes on button press in button_addnoise.
function button_addnoise_Callback(hObject, eventdata, handles)
% hObject    handle to button_addnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs signal noise len;
t=0:len-1;
n=str2num(get(handles.edit_noise,'string'));
noise=randn(1,len)*n;
y=signal+noise';
sound(y,fs);
Y=fftshift(abs(fft(y)));
axes(handles.axes1)
plot(y);
axes(handles.axes2);
plot([1:length(Y)],Y);


% --- Executes on button press in button_after.
function button_after_Callback(hObject, eventdata, handles)
% hObject    handle to button_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal noise fs len;
step=str2num(get(handles.edit_step,'string'));
for i=0:step-1
    ww(i+1)=sum(noise(1:len-i).*noise(i+1:len));
    xx(i+1)=sum(signal(1:len-i).*signal(i+1:len));
end
for i=1:step
    for j=1:step
    A(i,j)=xx(abs(j-i)+1);
    end
end
ss=xx-ww;
h=A\ss';
yn=conv(h',signal);
sound(yn,fs);
Y=fftshift(abs(fft(yn)));
axes(handles.axes1)
plot(yn);
axes(handles.axes2);
plot([1:length(Y)],Y);



