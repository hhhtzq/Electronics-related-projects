function varargout = FIR(varargin)
% FIR M-file for FIR.fig
%      FIR, by itself, creates a new FIR or raises the existing
%      singleton*.
%
%      H = FIR returns the handle to a new FIR or the handle to
%      the existing singleton*.
%
%      FIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIR.M with the given input arguments.
%
%      FIR('Property','Value',...) creates a new FIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIR

% Last Modified by GUIDE v2.5 24-Dec-2009 16:18:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIR_OpeningFcn, ...
                   'gui_OutputFcn',  @FIR_OutputFcn, ...
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


% --- Executes just before FIR is made visible.
function FIR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIR (see VARARGIN)
set(handles.Fstext,'Visible','on');
set(handles.Fs,'Visible','on');
set(handles.Fs,'String','48000')

set(handles.Fstop1text,'Visible','on');
set(handles.Fstop1,'Visible','on');
set(handles.Fstop1text,'String','Fstop:');
set(handles.Fstop1,'String','12000');

set(handles.Fpass1text,'Visible','on');
set(handles.Fpass1,'Visible','on');
set(handles.Fpass1text,'String','Fpass:');
set(handles.Fpass1,'String','9600');

set(handles.Fpass2text,'Visible','off');
set(handles.Fpass2,'Visible','off');


set(handles.Fstop2text,'Visible','off');
set(handles.Fstop2,'Visible','off');



%**************************************%
set(handles.Lowpass,'Value',1);
set(handles.Highpass,'Value',0);
set(handles.Bandpass,'Value',0);
set(handles.Bandstop,'Value',0);
set(handles.radiobutton_box,'value',1);
set(handles.radiobutton_triang,'value',0);
set(handles.radiobutton_hamming,'value',0);
set(handles.radiobutton_hanning,'value',0);
%********************************************%
handles.Type=1;
handles.Method=1;
handles.Choose=handles.Method*10+handles.Type;
handles.Fsstr=48000;
handles.Fstop1str=12000;
handles.Fpass1str=9600;
handles.Wstopstr=80;
handles.Wpassstr=1;
[signal fs]=wavread('chirp');
handles.signal=signal;
handles.fs=fs;
handles.len=length(signal);
%****************************************%
fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=ws-wp;
                N0=ceil(6.1*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(triang(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;

% Choose default command line output for FIR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





% --- Executes on button press in radiobutton_triang.
function radiobutton_triang_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_triang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_triang
handles.Method=2;
set(handles.radiobutton_box,'value',0);
set(handles.radiobutton_triang,'value',1);
set(handles.radiobutton_hamming,'value',0);
set(handles.radiobutton_hanning,'value',0);
guidata(hObject, handles);

% --- Executes on button press in radiobutton_hamming.
function radiobutton_hamming_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_hamming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_hamming
handles.Method=3;
set(handles.radiobutton_box,'value',0);
set(handles.radiobutton_triang,'value',0);
set(handles.radiobutton_hamming,'value',1);
set(handles.radiobutton_hanning,'value',0);
guidata(hObject, handles);


% --- Executes on button press in radiobutton_hanning.
function radiobutton_hanning_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_hanning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_hanning
handles.Method=4;
set(handles.radiobutton_box,'value',0);
set(handles.radiobutton_triang,'value',0);
set(handles.radiobutton_hamming,'value',0);
set(handles.radiobutton_hanning,'value',1);
guidata(hObject, handles);


% --- Executes on button press in radiobutton_box.
function radiobutton_box_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_box
handles.Method=1;
set(handles.radiobutton_box,'value',1);
set(handles.radiobutton_triang,'value',0);
set(handles.radiobutton_hamming,'value',0);
set(handles.radiobutton_hanning,'value',0);
guidata(hObject, handles);


% --- Executes on button press in Lowpass.
function Lowpass_Callback(hObject, eventdata, handles)
% hObject    handle to Lowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Lowpass
set(handles.Fstext,'Visible','on');
set(handles.Fs,'Visible','on');

set(handles.Fstop1text,'Visible','on');
set(handles.Fstop1,'Visible','on');
set(handles.Fstop1text,'String','Fstop:');
set(handles.Fstop1,'String','12000');

set(handles.Fpass1text,'Visible','on');
set(handles.Fpass1,'Visible','on');
set(handles.Fpass1text,'String','Fpass:');
set(handles.Fpass1,'String','9600');

set(handles.Fpass2text,'Visible','off');
set(handles.Fpass2,'Visible','off');

set(handles.Fstop2text,'Visible','off');
set(handles.Fstop2,'Visible','off');

%**************************************%
set(handles.Lowpass,'Value',1);
set(handles.Highpass,'Value',0);
set(handles.Bandpass,'Value',0);
set(handles.Bandstop,'Value',0);
%*************************%
handles.Type=1;
guidata(hObject, handles);


% --- Executes on button press in Highpass.
function Highpass_Callback(hObject, eventdata, handles)
% hObject    handle to Highpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Highpass
set(handles.Fstext,'Visible','on');
set(handles.Fs,'Visible','on');

set(handles.Fstop1text,'Visible','on');
set(handles.Fstop1,'Visible','on');
set(handles.Fstop1text,'String','Fstop:');
set(handles.Fstop1,'String','9600');

set(handles.Fpass1text,'Visible','on');
set(handles.Fpass1,'Visible','on');
set(handles.Fpass1text,'String','Fpass:');
set(handles.Fpass1,'String','12000');

set(handles.Fpass2text,'Visible','off');
set(handles.Fpass2,'Visible','off');

set(handles.Fstop2text,'Visible','off');
set(handles.Fstop2,'Visible','off');

%**************************************%
set(handles.Lowpass,'Value',0);
set(handles.Highpass,'Value',1);
set(handles.Bandpass,'Value',0);
set(handles.Bandstop,'Value',0);
%*************************%
handles.Type=2;
guidata(hObject, handles);


% --- Executes on button press in Bandpass.
function Bandpass_Callback(hObject, eventdata, handles)
% hObject    handle to Bandpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bandpass
set(handles.Fstext,'Visible','on');
set(handles.Fs,'Visible','on');

set(handles.Fstop1text,'Visible','on');
set(handles.Fstop1,'Visible','on');
set(handles.Fstop1text,'String','Fstop1:');
set(handles.Fstop1,'String','7200');

set(handles.Fpass1text,'Visible','on');
set(handles.Fpass1,'Visible','on');
set(handles.Fpass1text,'String','Fpass1:');
set(handles.Fpass1,'String','9600');

set(handles.Fpass2text,'Visible','on');
set(handles.Fpass2,'Visible','on');
set(handles.Fpass2,'String','12000');

set(handles.Fstop2text,'Visible','on');
set(handles.Fstop2,'Visible','on');
set(handles.Fstop2,'String','14400');

%**************************************%
set(handles.Lowpass,'Value',0);
set(handles.Highpass,'Value',0);
set(handles.Bandpass,'Value',1);
set(handles.Bandstop,'Value',0);
%*************************%
handles.Type=3;
guidata(hObject, handles);

% --- Executes on button press in Bandstop.
function Bandstop_Callback(hObject, eventdata, handles)
% hObject    handle to Bandstop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Bandstop
set(handles.Fstext,'Visible','on');
set(handles.Fs,'Visible','on');

set(handles.Fstop1text,'Visible','on');
set(handles.Fstop1,'Visible','on');
set(handles.Fstop1text,'String','Fstop1:');
set(handles.Fstop1,'String','9600');

set(handles.Fpass1text,'Visible','on');
set(handles.Fpass1,'Visible','on');
set(handles.Fpass1text,'String','Fpass1:');
set(handles.Fpass1,'String','7200');
%*************************%
handles.Type=4;
guidata(hObject, handles);


set(handles.Fpass2text,'Visible','on');
set(handles.Fpass2,'Visible','on');
set(handles.Fpass2,'String','14400');

set(handles.Fstop2text,'Visible','on');
set(handles.Fstop2,'Visible','on');
set(handles.Fstop2,'String','12000');

%**************************************%
set(handles.Lowpass,'Value',0);
set(handles.Highpass,'Value',0);
set(handles.Bandpass,'Value',0);
set(handles.Bandstop,'Value',1);
guidata(hObject, handles);


% --- Executes on button press in pushbutton_orign.
function pushbutton_orign_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sound(handles.signal,handles.fs);


% --- Executes on button press in pushbutton_orignwave.
function pushbutton_orignwave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orignwave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.signal);legend('Ô­Ê¼ÐÅºÅ²¨ÐÎ');


% --- Executes on button press in pushbutton_orignspec.
function pushbutton_orignspec_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orignspec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x_co=[-pi:2*pi/handles.len:pi-2*pi/handles.len];
plot(x_co.*handles.fs/2/pi,abs(fftshift(fft(handles.signal))));
legend('Ô­Ê¼ÐÅºÅÆµÆ×');


% --- Executes on button press in pushbutton_afterwave.
function pushbutton_afterwave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_afterwave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(abs(handles.signal_f));legend('ÂË²¨ºóµÄÐÅºÅ²¨ÐÎ');


% --- Executes on button press in pushbutton_afterspec.
function pushbutton_afterspec_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_afterspec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x_co=[-pi:2*pi/handles.len:pi-2*pi/handles.len];
plot(x_co.*handles.fs/2/pi,abs(fftshift(fft(handles.signal_f))));legend('ÂË²¨ºóµÄÐÅºÅÆµÆ×');


% --- Executes on button press in pushbutton_filter.
function pushbutton_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = impz(handles.b,1,handles.len);
H = fftshift(fft(h));
S=fftshift(fft(handles.signal));
signal_ff = S.*H;     % ÂË²¨
handles.signal_f=ifftshift(ifft(signal_ff));
msgbox( '¶ÔÒôÀÖµÄÂË²¨ÒÑ¾­Íê³É£¡' );
guidata(hObject, handles);


% --- Executes on button press in pushbutton_after.
function pushbutton_after_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sound(handles.signal_f,handles.fs);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(hObject,'Value');
str = get(hObject,'String');
switch str{val}
    case 'chirp'
         [signal fs]=wavread('chirp');  
    case 'train'
         [signal fs]=wavread('train');          
    case 'ÒôÆµ'
        [FileName,PathName] = uigetfile(...
            {'*.wav','Wave Files(*.wav)';},...
            'Ñ¡ÔñÒôÆµÎÄ¼þ' );
        if isequal(FileName,0) || isequal(PathName,0),
        return;
        end
        fPath = [PathName,FileName];
        [signal fs]=wavread(fPath);
        signal=signal(:,1);
end
handles.signal=signal;
handles.fs=fs;
handles.len=length(signal);
guidata(hObject, handles);

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


% --- Executes on button press in pushbutton_p.
function pushbutton_p_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.w/2/pi*handles.Fsstr,(angle(handles.h))/pi*180);
legend('ÏàÆµÏìÓ¦');


% --- Executes on button press in pushbutton_im.
function pushbutton_im_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
himpu=impz(handles.b,1); 
s=size(himpu);
stem([0:1:s-1],himpu); 
legend('³å¼¤ÏìÓ¦');


% --- Executes on button press in pushbutton_z.
function pushbutton_z_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 zplane(handles.b,1) ;
legend('Áã¼«µãÍ¼');


% --- Executes on button press in pushbutton_h.
function pushbutton_h_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
legend('·ùÆµÏìÓ¦');


% --- Executes on button press in pushbutton_st.
function pushbutton_st_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% himpu=dstep(handles.b,1); 
% s=size(himpu);
% stem([0:1:s-1],himpu);
[H,T] = stepz(handles.b,1,[]);
stem(T,H);
legend('½×Ô¾ÏìÓ¦');



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fstop1_Callback(hObject, eventdata, handles)
% hObject    handle to Fstop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fstop1 as text
%        str2double(get(hObject,'String')) returns contents of Fstop1 as a double


% --- Executes during object creation, after setting all properties.
function Fstop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fstop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fpass1_Callback(hObject, eventdata, handles)
% hObject    handle to Fpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fpass1 as text
%        str2double(get(hObject,'String')) returns contents of Fpass1 as a double


% --- Executes during object creation, after setting all properties.
function Fpass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fpass2_Callback(hObject, eventdata, handles)
% hObject    handle to Fpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fpass2 as text
%        str2double(get(hObject,'String')) returns contents of Fpass2 as a double


% --- Executes during object creation, after setting all properties.
function Fpass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Fstop2_Callback(hObject, eventdata, handles)
% hObject    handle to Fstop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fstop2 as text
%        str2double(get(hObject,'String')) returns contents of Fstop2 as a double


% --- Executes during object creation, after setting all properties.
function Fstop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fstop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_design.
function pushbutton_design_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.Choose=handles.Method*10+handles.Type;

handles.Fsstr=str2double(get(handles.Fs,'string'));
if  isnan(handles.Fsstr)
    errordlg('Input must be a number','Error');
    return;
end 
handles.Fstop1str=str2double(get(handles.Fstop1,'string'));
if  isnan(handles.Fstop1str)
    errordlg('Input must be a number','Error');
    return;
end
handles.Fpass1str=str2double(get(handles.Fpass1,'string'));
if  isnan(handles.Fpass1str)
    errordlg('Input must be a number','Error');
    return;
end
handles.Fpass2str=str2double(get(handles.Fpass2,'string'));

handles.Fstop2str=str2double(get(handles.Fstop2,'string'));
%********************************************%
switch handles.Choose;
    case 11,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=ws-wp;
                N0=ceil(1.8*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(boxcar(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
          
                
    case 12,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=wp-ws;
                N0=ceil(1.8*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(boxcar(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,'high',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
    case 13,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr;Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fs1>fp1
                    errordlg('Fstop1 must be smaller then Fpass1','Error');
                    return;
                end
                if fp1>fp2
                    errordlg('Fpass1 must be smaller then Fpass2','Error');
                    return;
                end
                if fp2>fs2
                    errordlg('Fpass2 must be smaller then Fstop2','Error');
                    return;
                end
                if Fs<2*fs2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=wp1-ws1;
                N0=ceil(1.8*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(boxcar(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
     
    case 14,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr; Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp1>fs1
                    errordlg('Fstop1 must be bigger then Fpass1','Error');
                    return;
                end
                if fs1>fs2
                    errordlg('Fstop1 must be smaller then Fstop2','Error');
                    return;
                end
                if fs2>fp2
                    errordlg('Fpass2 must be bigger then Fstop2','Error');
                    return;
                end
                if Fs<2*fp2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=ws1-wp1;
                N0=ceil(1.8*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(boxcar(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],'stop',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
    case 21,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=ws-wp;
                N0=ceil(6.1*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(triang(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
          
                
    case 22,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=wp-ws;
                N0=ceil(6.1*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(triang(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,'high',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
    case 23,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr;Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fs1>fp1
                    errordlg('Fstop1 must be smaller then Fpass1','Error');
                    return;
                end
                if fp1>fp2
                    errordlg('Fpass1 must be smaller then Fpass2','Error');
                    return;
                end
                if fp2>fs2
                    errordlg('Fpass2 must be smaller then Fstop2','Error');
                    return;
                end
                if Fs<2*fs2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=wp1-ws1;
                N0=ceil(6.1*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(triang(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
     
    case 24,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr; Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp1>fs1
                    errordlg('Fstop1 must be bigger then Fpass1','Error');
                    return;
                end
                if fs1>fs2
                    errordlg('Fstop1 must be smaller then Fstop2','Error');
                    return;
                end
                if fs2>fp2
                    errordlg('Fpass2 must be bigger then Fstop2','Error');
                    return;
                end
                if Fs<2*fp2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=ws1-wp1;
                N0=ceil(6.1*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(triang(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],'stop',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
  
     case 31,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=ws-wp;
                N0=ceil(6.6*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hamming(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
          
                
    case 32,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=wp-ws;
                N0=ceil(6.6*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hamming(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,'high',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
    case 33,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr;Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fs1>fp1
                    errordlg('Fstop1 must be smaller then Fpass1','Error');
                    return;
                end
                if fp1>fp2
                    errordlg('Fpass1 must be smaller then Fpass2','Error');
                    return;
                end
                if fp2>fs2
                    errordlg('Fpass2 must be smaller then Fstop2','Error');
                    return;
                end
                if Fs<2*fs2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=wp1-ws1;
                N0=ceil(6.6*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hamming(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
     
    case 34,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr; Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp1>fs1
                    errordlg('Fstop1 must be bigger then Fpass1','Error');
                    return;
                end
                if fs1>fs2
                    errordlg('Fstop1 must be smaller then Fstop2','Error');
                    return;
                end
                if fs2>fp2
                    errordlg('Fpass2 must be bigger then Fstop2','Error');
                    return;
                end
                if Fs<2*fp2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=ws1-wp1;
                N0=ceil(6.6*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hamming(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],'stop',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h; handles.b=b;   
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
     case 41,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=ws-wp;
                N0=ceil(6.2*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hanning(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
          
                
    case 42,    fp=handles.Fpass1str;fs=handles.Fstop1str;Fs=handles.Fsstr;
                Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2;
                ws=fs/Fs*2;
                deltaw=wp-ws;
                N0=ceil(6.2*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hanning(N))';
                wc=(ws+wp)/2;
                b=fir1(N-1,wc,'high',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
    case 43,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr;Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fs1>fp1
                    errordlg('Fstop1 must be smaller then Fpass1','Error');
                    return;
                end
                if fp1>fp2
                    errordlg('Fpass1 must be smaller then Fpass2','Error');
                    return;
                end
                if fp2>fs2
                    errordlg('Fpass2 must be smaller then Fstop2','Error');
                    return;
                end
                if Fs<2*fs2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=wp1-ws1;
                N0=ceil(6.2*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hanning(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;handles.b=b;
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
     
    case 44,    if  isnan(handles.Fpass2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                if  isnan(handles.Fstop2str)
                    errordlg('Input must be a number','Error');
                    return;
                end
                fp1=handles.Fpass1str;fp2=handles.Fpass2str;fp=[fp1 fp2];
                fs1=handles.Fstop1str;fs2=handles.Fstop2str;fs=[fs1 fs2];
                Fs=handles.Fsstr; Rp=handles.Wpassstr;As=handles.Wstopstr;
                if fp1>fs1
                    errordlg('Fstop1 must be bigger then Fpass1','Error');
                    return;
                end
                if fs1>fs2
                    errordlg('Fstop1 must be smaller then Fstop2','Error');
                    return;
                end
                if fs2>fp2
                    errordlg('Fpass2 must be bigger then Fstop2','Error');
                    return;
                end
                if Fs<2*fp2
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp1=fp1/Fs*2;wp2=fp2/Fs*2;
                ws1=fs1/Fs*2;ws2=fs2/Fs*2;
                wp=[wp1 wp2];ws=[ws1 ws2];
                deltaw=ws1-wp1;
                N0=ceil(6.2*pi/deltaw);
                N=N0+mod(N0+1,2);
                windows=(hanning(N))';
                wc1=(ws1+wp1)/2;wc2=(ws2+wp2)/2;
                b=fir1(N-1,[wc1 wc2],'stop',windows);
                [h,w]=freqz(b,1);
                handles.windows=windows;
                handles.w=w;handles.h=h;  handles.b=b;    
                plot(handles.w/2/pi*handles.Fsstr,abs(handles.h));
                legend('·ùÆµÏìÓ¦');
                
end         
  guidata(hObject, handles);
                
                
