function varargout = CZT(varargin)
% CZT M-file for CZT.fig
%      CZT, by itself, creates a new CZT or raises the existing
%      singleton*.
%
%      H = CZT returns the handle to a new CZT or the handle to
%      the existing singleton*.
%
%      CZT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CZT.M with the given input arguments.
%
%      CZT('Property','Value',...) creates a new CZT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CZT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CZT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CZT

% Last Modified by GUIDE v2.5 25-Dec-2009 15:07:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CZT_OpeningFcn, ...
                   'gui_OutputFcn',  @CZT_OutputFcn, ...
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


% --- Executes just before CZT is made visible.
function CZT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CZT (see VARARGIN)

% Choose default command line output for CZT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CZT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CZT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_a0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_a0 as text
%        str2double(get(hObject,'String')) returns contents of edit_a0 as a double


% --- Executes during object creation, after setting all properties.
function edit_a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_f0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f0 as text
%        str2double(get(hObject,'String')) returns contents of edit_f0 as a double


% --- Executes during object creation, after setting all properties.
function edit_f0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_w0_Callback(hObject, eventdata, handles)
% hObject    handle to edit_w0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_w0 as text
%        str2double(get(hObject,'String')) returns contents of edit_w0 as a double


% --- Executes during object creation, after setting all properties.
function edit_w0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_w0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_m_Callback(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_m as text
%        str2double(get(hObject,'String')) returns contents of edit_m as a double


% --- Executes during object creation, after setting all properties.
function edit_m_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
A0 = str2double( get( handles.edit_a0, 'String' ) );
W0 = str2double( get( handles.edit_w0, 'String' ) );
F0 = str2double( get( handles.edit_f0, 'String' ) );
Fn = str2double( get( handles.edit_fn, 'String' ) );
M = str2double( get( handles.edit_m, 'String' ) );
if isnan(A0) || isnan(W0) || isnan(F0) || isnan(Fn) || isnan(M)
    errordlg('czt参数设置有误','参数错误');
    return;
end
t = (1:length(signal) );
A = A0 * exp( j*2*pi*F0/fs );   % 起始角度
W = W0 * exp( -j*2*pi*(Fn-F0)/(M*fs) ); % 分割点间角度
Yk = czt( signal,M,W,A );
Xk = ((0:length(Yk)-1)'*(Fn-F0)/length(Yk)) + F0; %横坐标
axes(handles.axes1); plot( t,signal); grid on;legend('原始信号');
axes(handles.axes2); stem( Xk, abs(Yk) ); grid on;legend('幅频相应');
axes(handles.axes3); plot( Xk, unwrap( angle(Yk) )*360/2/pi ); grid on;legend('相频相应');




function edit_fn_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fn as text
%        str2double(get(hObject,'String')) returns contents of edit_fn as a double


% --- Executes during object creation, after setting all properties.
function edit_fn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global fs signal;
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case '示例'
        n =256;
        fs = 25600;
        t = ( 0:1/fs:0.01-1/fs );
            % 初始条件：采样时间0.01s，采样点数256，采样频率25600Hz
        x0 = chirp(t,100,0.01,10000);
            % 扫频信号，0秒对应100Hz，0.01秒对应10000Hz
        x1 = 0.98.^( 0:1:n-1 ); signal= x0.*x1;
            % 指数衰减     
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


