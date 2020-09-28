function varargout = FFT(varargin)
% FFT M-file for FFT.fig
%      FFT, by itself, creates a new FFT or raises the existing
%      singleton*.
%
%      H = FFT returns the handle to a new FFT or the handle to
%      the existing singleton*.
%
%      FFT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FFT.M with the given input arguments.
%
%      FFT('Property','Value',...) creates a new FFT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FFT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FFT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FFT

% Last Modified by GUIDE v2.5 20-Dec-2009 14:49:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FFT_OpeningFcn, ...
                   'gui_OutputFcn',  @FFT_OutputFcn, ...
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


% --- Executes just before FFT is made visible.
function FFT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FFT (see VARARGIN)

% Choose default command line output for FFT
handles.output = hObject;
global sel_sig;
sel_sig='demo';


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FFT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FFT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_sFre_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sFre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sFre as text
%        str2double(get(hObject,'String')) returns contents of edit_sFre as a double
global fs n;
fs = str2double( get( hObject, 'string' ) );
if isnan(fs) == 1
    set( hObject, 'string', '12800' );
    fs = 12800;
end
n = str2double( get( handles.edit_sPnt, 'string' ) );
set( handles.edit_sTime, 'string', num2str( n/fs ) );


% --- Executes during object creation, after setting all properties.
function edit_sFre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sFre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sTime_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sTime as text
%        str2double(get(hObject,'String')) returns contents of edit_sTime as a double
global ts fs;
ts = str2double( get( hObject, 'string' ) );
if isnan(ts) == 1
    set( hObject, 'string', '0.01' );
    ts = 0.01;
end
set( handles.edit_sPnt, 'string', num2str( fs*ts ) );


% --- Executes during object creation, after setting all properties.
function edit_sTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sPnt_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sPnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sPnt as text
%        str2double(get(hObject,'String')) returns contents of edit_sPnt as a double
global n ts;
if isnan(n) == 1
    set( hObject, 'string', '128' );
    n = 128;
end
set( handles.edit_sFre, 'string', num2str( n/ts ) );


% --- Executes during object creation, after setting all properties.
function edit_sPnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sPnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_sig.
function popupmenu_sig_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu_sig contents as cell array
%        contents{get(hObject,'Value')} returns selected item from
%        popupmenu_sig
global sel_sig pos n y fs ts fPath;
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case '示例'
        sel_sig = 'demo';
        set( handles.edit_sFre, 'String', '12800', 'Enable', 'on' );
        set( handles.edit_sTime, 'String', '0.01', 'Enable', 'on' );
        set( handles.edit_sPnt, 'String', '128', 'Enable', 'on' );
        set( handles.edit_sPos, 'Enable', 'off' );
    case '音频'
        [FileName,PathName] = uigetfile(...
            {'*.wav','Wave Files(*.wav)';},...
            '选择音频文件' );
        fPath = [PathName,FileName];
        if isequal(FileName,0) || isequal(PathName,0),
        return;
        end
        pos = str2double( get( handles.edit_sPos,'string' ) );    % 读取采样位置
        [y,fs] = wavread(fPath);
        sel_sig = 'audio';
        ts=0.01;
        n=fix(fs*ts)
        set( handles.edit_sFre, 'String',num2str(fs), 'Enable', 'off' );
        set( handles.edit_sTime, 'String', '0.01', 'Enable', 'off' );
        set( handles.edit_sPnt, 'String', num2str(n), 'Enable', 'off' );
        set( handles.edit_sPos, 'Enable', 'on' );
end



% --- Executes during object creation, after setting all properties.
function popupmenu_sig_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_sig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sPower_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sPower as text
%        str2double(get(hObject,'String')) returns contents of edit_sPower as a double


% --- Executes during object creation, after setting all properties.
function edit_sPower_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sPower (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_ok.
function button_ok_Callback(hObject, eventdata, handles)
% hObject    handle to button_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sel_sig n ts fs y n fPath;
    switch sel_sig
        case 'demo'
            fs=str2num(get( handles.edit_sFre, 'String'));
            ts=str2num(get( handles.edit_sTime, 'String'));
            n=fs*ts;
            t = ( 0:1/fs:ts-1/fs );
                % 初始条件：采样时间0.01s，采样点数128，采样频率12800Hz
            x0 = chirp(t,100,0.01,10000);
                % 扫频信号，0秒对应100Hz，0.01秒对应10000Hz
            x1 = 0.98.^( 0:1:n-1 ); 
            x = x0.*x1;
        case 'audio'
            pos= str2double( get( handles.edit_sPos,'string' ) );    % 读取采样位置
            y = wavread(fPath,[pos+1 pos+n]);
             x = y(1:n,1)';
            t = ( 0:1/fs:ts-1/fs );
    end
    % 傅立叶变换--------------------------------------------------------
    Yk = fftshift( fft(x,n) );  % n点傅立叶变换
    Xk = (-pi:2*pi/n:pi-2*pi/n );
        % 最大值π对应频率为最高采样频率(单位为弧度)的一半
    Xk = Xk.*fs/2/pi;   % 频率折算公式：Ω=2πf，ΩT=ω，f=ω/(2πT)=ωfs/(2π)

    % 计算参数---------------------------------------------------------
    power_x = sum(x.^2);  % 计算时域信号总功率

    % 绘图-------------------------------------------------------------
    axes(handles.axes1); plot( t, x ); grid on;legend('原始信号');
    axes(handles.axes2); stem( Xk, abs(Yk) ); grid on;legend('幅频响应');
    axes(handles.axes3); plot( Xk, unwrap( angle(Yk) )*360/2/pi ); grid on;legend('相频响应');

    % 文本框输出--------------------------------------------------------
    set( handles.edit_sPower, 'string', num2str(power_x) );



function edit_sPos_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sPos as text
%        str2double(get(hObject,'String')) returns contents of edit_sPos as a double


% --- Executes during object creation, after setting all properties.
function edit_sPos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sPos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


