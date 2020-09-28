function varargout = LPC(varargin)
% LPC M-file for LPC.fig
%      LPC, by itself, creates a new LPC or raises the existing
%      singleton*.
%
%      H = LPC returns the handle to a new LPC or the handle to
%      the existing singleton*.
%
%      LPC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LPC.M with the given input arguments.
%
%      LPC('Property','Value',...) creates a new LPC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LPC_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LPC_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LPC

% Last Modified by GUIDE v2.5 22-Dec-2009 12:54:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LPC_OpeningFcn, ...
                   'gui_OutputFcn',  @LPC_OutputFcn, ...
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


% --- Executes just before LPC is made visible.
function LPC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LPC (see VARARGIN)

% Choose default command line output for LPC
handles.output = hObject;
global signal fs;
[signal fs]=wavread('chirp'); 
set(handles.edit_error,'Enable', 'off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LPC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LPC_OutputFcn(hObject, eventdata, handles) 
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
    case '高斯白噪声'
        randn('state',0);
        noise=randn(10000,1);
        signal=filter(1,[1 1/2 1/3 1/4],noise);
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
function popupmenu_source_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_play.
function pushbutton_play_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
sound(signal,fs);



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


% --- Executes on button press in pushbutton_lpc.
function pushbutton_lpc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lpc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal len est_signal;
step=str2num(get(handles.edit_step,'string'));
a=lpc(signal,step);
est_signal = filter([0 -a(2:end)],1,signal);    % Estimated signal
e = signal- est_signal;                        % Prediction error
emin=mean(abs(e).^2);
[acs,lags] = xcorr(e,'coeff');   % ACS of prediction error
axes(handles.axes1),plot([1:4096],signal(len-5095:len-1000),'r',[1:4096],est_signal(len-5095:len-1000),'b');
legend('原始信号','预测信号');
s1=abs(fftshift(fft(signal(len-5095:len-1000))));
s2=abs(fftshift(fft(est_signal(len-5095:len-1000))));
axes(handles.axes2),plot([1:length(s1)],s1,'r',[1:length(s2)],s2,'b');
legend('原始频谱','预测频谱');
axes(handles.axes3),plot(lags,acs); 
l=length(lags);
axis([-0.5*l 0.5*l -0.3 1.2]);
legend('预测误差自相关');
set(handles.edit_error,'string',num2str(emin));



% --- Executes on button press in pushbutton_play2.
function pushbutton_play2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_play2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global est_signal fs;
sound(est_signal,fs);



function edit_error_Callback(hObject, eventdata, handles)
% hObject    handle to edit_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_error as text
%        str2double(get(hObject,'String')) returns contents of edit_error as a double


% --- Executes during object creation, after setting all properties.
function edit_error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


