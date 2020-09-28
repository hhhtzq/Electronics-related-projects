function varargout = PowerSpectrum(varargin)
% POWERSPECTRUM M-file for PowerSpectrum.fig
%      POWERSPECTRUM, by itself, creates a new POWERSPECTRUM or raises the existing
%      singleton*.
%
%      H = POWERSPECTRUM returns the handle to a new POWERSPECTRUM or the handle to
%      the existing singleton*.
%
%      POWERSPECTRUM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWERSPECTRUM.M with the given input arguments.
%
%      POWERSPECTRUM('Property','Value',...) creates a new POWERSPECTRUM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PowerSpectrum_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PowerSpectrum_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PowerSpectrum

% Last Modified by GUIDE v2.5 21-Dec-2009 22:07:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PowerSpectrum_OpeningFcn, ...
                   'gui_OutputFcn',  @PowerSpectrum_OutputFcn, ...
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


% --- Executes just before PowerSpectrum is made visible.
function PowerSpectrum_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PowerSpectrum (see VARARGIN)

% Choose default command line output for PowerSpectrum
handles.output = hObject;
global method signal fs;
method='相关图法';
[signal fs]=wavread('chirp'); 
set( handles.edit_pnt,'string','5000','Enable', 'on' );
set( handles.edit_delay,'string','1000','Enable', 'on' );
set( handles.edit_sep,'string','10','Enable', 'off' );
set( handles.edit_step,'string','100','Enable', 'off' );
set(handles.radiobutton1,'value',[1.0]);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PowerSpectrum wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PowerSpectrum_OutputFcn(hObject, eventdata, handles) 
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
global signal fs;
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
signal=signal';


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


% --- Executes on button press in pushbutton_play.
function pushbutton_play_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
sound(signal,fs);


% --- Executes on button press in pushbutton_time.
function pushbutton_time_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal;
axes(handles.axes1);
plot(signal);




function edit_pnt_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pnt as text
%        str2double(get(hObject,'String')) returns contents of edit_pnt as a double


% --- Executes during object creation, after setting all properties.
function edit_pnt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_delay_Callback(hObject, eventdata, handles)
% hObject    handle to edit_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_delay as text
%        str2double(get(hObject,'String')) returns contents of edit_delay as a double


% --- Executes during object creation, after setting all properties.
function edit_delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sep_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sep as text
%        str2double(get(hObject,'String')) returns contents of edit_sep as a double


% --- Executes during object creation, after setting all properties.
function edit_sep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sep (see GCBO)
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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global method;
method='相关图法';
set(hObject, 'Value', [1.0] );
set( handles.edit_pnt,'Enable', 'on' );
set( handles.edit_delay,'Enable', 'on' );
set( handles.edit_sep,'Enable', 'off' );
set( handles.edit_step,'Enable', 'off' );


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global method;
method='周期图法';
set(hObject, 'Value', [1.0] );
set( handles.edit_pnt,'Enable', 'on' );
set( handles.edit_delay,'Enable', 'off' );
set( handles.edit_sep,'Enable', 'off' );
set( handles.edit_step,'Enable', 'off' );

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global method;
method='平均周期图法';
set(hObject, 'Value', [1.0] );
set( handles.edit_pnt,'Enable', 'on' );
set( handles.edit_delay,'Enable', 'off' );
set( handles.edit_sep,'Enable', 'on' );
set( handles.edit_step,'Enable', 'off' );


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global method;
method='加窗平均周期图法';
set(hObject, 'Value', [1.0] );
set( handles.edit_pnt,'Enable', 'on' );
set( handles.edit_delay,'Enable', 'off' );
set( handles.edit_sep,'Enable', 'on' );
set( handles.edit_step,'Enable', 'off' );


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global method;
method='Burg算法';
set(hObject, 'Value', [1.0] );
set( handles.edit_pnt,'Enable', 'off' );
set( handles.edit_delay,'Enable', 'off' );
set( handles.edit_sep,'Enable', 'off' );
set( handles.edit_step,'Enable', 'on' );






% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal method;
point=str2num(get(handles.edit_pnt,'string'));
delay=str2num(get(handles.edit_delay,'string'));
sep=str2num(get(handles.edit_sep,'string'));
step=str2num(get(handles.edit_step,'string'));
switch method
    case '相关图法'
        for i=0:delay-1
         xx(i+1)=sum(signal(1:point-i).*signal(i+1:point))/point;
        end
        Pxx=abs(fftshift(fft(xx)));
        axes(handles.axes1);
        plot([1:length(Pxx)],Pxx);    
        legend(' 相关图法');
    case '周期图法'
        Y=fftshift(abs(fft(signal)));
        P=abs(Y.^2/point);
        axes(handles.axes1);
        plot([1:length(P)],P);    
        legend('周期图法');
    case '平均周期图法'
        m=point/sep-mod(point/sep,1);B=zeros(1,m);
        for i=1:sep
            Ip(i,:)=(fft(signal(1+(i-1)*m:i*m))).^2/m;
            B=B+Ip(i,:);
        end
        B=B/sep;
        Bf=abs(fftshift(B));
        axes(handles.axes1);
        plot([1:length(Bf)],Bf);     
        legend('平均周期图法');
    case '加窗平均周期图法'
        m=point/sep-mod(point/sep,1);B=zeros(1,m);
        whm=hamming(m)';
        for i=1:sep
            Ip(i,:)=(fft(signal(1+(i-1)*m:i*m).*whm)).^2/m;
            B=B+Ip(i,:);
        end
        B=B/sep;
        Bf=abs(fftshift(B));
        axes(handles.axes1);
        plot([1:length(Bf)],Bf); 
        legend('加窗平均周期图法');
    case 'Burg算法'
        B=pburg(signal,step)';
        axes(handles.axes1);
        plot([1:length(B)],B);
        legend('Burg算法');
        
        
end


