function varargout = IIR(varargin)
% IIR M-file for IIR.fig
%      IIR, by itself, creates a new IIR or raises the existing
%      singleton*.
%
%      H = IIR returns the handle to a new IIR or the handle to
%      the existing singleton*.
%
%      IIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IIR.M with the given input arguments.
%
%      IIR('Property','Value',...) creates a new IIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IIR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IIR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IIR

% Last Modified by GUIDE v2.5 24-Dec-2009 00:30:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IIR_OpeningFcn, ...
                   'gui_OutputFcn',  @IIR_OutputFcn, ...
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


% --- Executes just before IIR is made visible.
function IIR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IIR (see VARARGIN)

% Choose default command line output for IIR
handles.output = hObject;
set(handles.radiobutton_lp,'Value',1);
set(handles.radiobutton_hp,'Value',0);
set(handles.radiobutton_bp,'Value',0);
set(handles.radiobutton_bs,'Value',0);
set(handles.radiobutton_but,'Value',1);
set(handles.radiobutton_cheb1,'Value',0);
set(handles.radiobutton_cheb2,'Value',0);
set(handles.radiobutton_ell,'Value',0);
set(handles.text_fs,'Visible','on');
set(handles.edit_fs,'Visible','on','String','24000');

set(handles.text_fstop1,'Visible','on','String','Fstop(Hz):');
set(handles.edit_fstop1,'Visible','on','String','6000');

set(handles.text_fpass1,'Visible','on','String','Fpass(Hz):');
set(handles.edit_fpass1,'Visible','on','String','4800');


set(handles.text_fpass2,'Visible','off');
set(handles.edit_fpass2,'Visible','off');

set(handles.text_fstop2,'Visible','off');
set(handles.edit_fstop2,'Visible','off');

%*********%

set(handles.edit_gs,'Visible','on','String','80');
set(handles.edit_gp,'Visible','on','String','1');

global type method sel fsstr fstop1str fstop2str fpass1str fpass2str gp gs a b h w signal fs len;
type=1;
method=1;
sel=method*10+type;
fsstr=24000;
fstop1str=3600;
fpass1str=4800;
fpass2str=6000;
fstop2str=7200;
gsstr=80;
gpstr=1;
%*******************************%
 fp=fpass1str;fs=fstop1str;Fs=fsstr;
 gp=gpstr;gs=gsstr;
 wp=fp/Fs*2*pi;
 ws=fs/Fs*2*pi;
 [n,wc]=buttord(wp/pi,ws/pi,gp,gs);
 [b,a]=butter(n,wc);
 [h,w]=freqz(b,a);
 [signal fs]=wavread('chirp');  
 len=length(signal);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IIR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IIR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_fs_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fs as text
%        str2double(get(hObject,'String')) returns contents of edit_fs as a double


% --- Executes during object creation, after setting all properties.
function edit_fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fstop1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fstop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fstop1 as text
%        str2double(get(hObject,'String')) returns contents of edit_fstop1 as a double


% --- Executes during object creation, after setting all properties.
function edit_fstop1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fstop1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fpass1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fpass1 as text
%        str2double(get(hObject,'String')) returns contents of edit_fpass1 as a double


% --- Executes during object creation, after setting all properties.
function edit_fpass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fpass2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fpass2 as text
%        str2double(get(hObject,'String')) returns contents of edit_fpass2 as a double


% --- Executes during object creation, after setting all properties.
function edit_fpass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_fstop2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fstop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_fstop2 as text
%        str2double(get(hObject,'String')) returns contents of edit_fstop2 as a double


% --- Executes during object creation, after setting all properties.
function edit_fstop2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fstop2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton_cheb1.
function radiobutton_cheb1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_cheb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_cheb1
global method;
method=2;
set(handles.radiobutton_but,'Value',0);
set(handles.radiobutton_cheb1,'Value',1);
set(handles.radiobutton_cheb2,'Value',0);
set(handles.radiobutton_ell,'Value',0);


% --- Executes on button press in radiobutton_cheb2.
function radiobutton_cheb2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_cheb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_cheb2
global method;
method=3;
set(handles.radiobutton_but,'Value',0);
set(handles.radiobutton_cheb1,'Value',0);
set(handles.radiobutton_cheb2,'Value',1);
set(handles.radiobutton_ell,'Value',0);


% --- Executes on button press in radiobutton_ell.
function radiobutton_ell_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_ell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_ell
global method;
method=4;
set(handles.radiobutton_but,'Value',0);
set(handles.radiobutton_cheb1,'Value',0);
set(handles.radiobutton_cheb2,'Value',0);
set(handles.radiobutton_ell,'Value',1);


% --- Executes on button press in radiobutton_but.
function radiobutton_but_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_but (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_but
global method;
method=1;
set(handles.radiobutton_but,'Value',1);
set(handles.radiobutton_cheb1,'Value',0);
set(handles.radiobutton_cheb2,'Value',0);
set(handles.radiobutton_ell,'Value',0);


% --- Executes on button press in radiobutton_hp.
function radiobutton_hp_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_hp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_hp
global type;
type=2;
set(handles.text_fs,'Visible','on');
set(handles.edit_fs,'Visible','on');

set(handles.text_fstop1,'Visible','on','String','Fstop(Hz):');
set(handles.edit_fstop1,'Visible','on','String','4800');

set(handles.text_fpass1,'Visible','on','String','Fpass(Hz):');
set(handles.edit_fpass1,'Visible','on','String','6000');

set(handles.text_fpass2,'Visible','off');
set(handles.edit_fpass2,'Visible','off');

set(handles.text_fstop2,'Visible','off');
set(handles.edit_fstop2,'Visible','off');

%**************************************%
set(handles.radiobutton_lp,'Value',0);
set(handles.radiobutton_hp,'Value',1);
set(handles.radiobutton_bp,'Value',0);
set(handles.radiobutton_bp,'Value',0);
%************************************%
guidata(hObject, handles);


% --- Executes on button press in radiobutton_bp.
function radiobutton_bp_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_bp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_bp
global type;
type=3;
set(handles.text_fs,'Visible','on');
set(handles.edit_fs,'Visible','on');

set(handles.text_fstop1,'Visible','on','String','Fstop1(Hz):');
set(handles.edit_fstop1,'Visible','on','String','3600');

set(handles.text_fpass1,'Visible','on','String','Fpass1(Hz):');
set(handles.edit_fpass1,'Visible','on','String','4800');


set(handles.text_fpass2,'Visible','on');
set(handles.edit_fpass2,'Visible','on','String','6000');

set(handles.text_fstop2,'Visible','on');
set(handles.edit_fstop2,'Visible','on','String','7200');

%**************************************%
set(handles.radiobutton_lp,'Value',0);
set(handles.radiobutton_hp,'Value',0);
set(handles.radiobutton_bp,'Value',1);
set(handles.radiobutton_bs,'Value',0);

guidata(hObject, handles);

% --- Executes on button press in radiobutton_bs.
function radiobutton_bs_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_bs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_bs
global type;
type=4;
set(handles.radiobutton_lp,'Value',0);
set(handles.radiobutton_hp,'Value',0);
set(handles.radiobutton_bp,'Value',0);
set(handles.radiobutton_bs,'Value',1);
set(handles.text_fs,'Visible','on');
set(handles.edit_fs,'Visible','on');

set(handles.text_fstop1,'Visible','on','String','Fstop1(Hz):');
set(handles.edit_fstop1,'Visible','on','String','4800');

set(handles.text_fpass1,'Visible','on','String','Fpass1(Hz):');
set(handles.edit_fpass1,'Visible','on','String','3600');

set(handles.text_fpass2,'Visible','on');
set(handles.edit_fpass2,'Visible','on','String','7200');


set(handles.text_fstop2,'Visible','on');
set(handles.edit_fstop2,'Visible','on','String','6000');

%**************************************%

guidata(hObject, handles);

% --- Executes on button press in radiobutton_lp.
function radiobutton_lp_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_lp
global type;
type=1;
set(handles.text_fs,'Visible','on');
set(handles.edit_fs,'Visible','on');

set(handles.text_fstop1,'Visible','on','String','Fstop(Hz):');
set(handles.edit_fstop1,'Visible','on','String','6000');

set(handles.text_fpass1,'Visible','on','String','Fpass(Hz):');
set(handles.edit_fpass1,'Visible','on','String','4800');


set(handles.text_fpass2,'Visible','off');
set(handles.edit_fpass2,'Visible','off');

set(handles.text_fstop2,'Visible','off');
set(handles.edit_fstop2,'Visible','off');

%**************************************%
set(handles.radiobutton_lp,'Value',1);
set(handles.radiobutton_hp,'Value',0);
set(handles.radiobutton_bp,'Value',0);
set(handles.radiobutton_bs,'Value',0);
guidata(hObject, handles);



% --- Executes on button press in pushbutton_design.
function pushbutton_design_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_design (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type method sel fsstr fstop1str fstop2str fpass1str fpass2str gp gs a b h w;
sel=method*10+type;

fsstr=str2double(get(handles.edit_fs,'string'));
if  isnan(fsstr)
    errordlg('Fs must be a number','Error');
    return;
end 
fstop1str=str2double(get(handles.edit_fstop1,'string'));
if  isnan(fstop1str)
    errordlg('Fstop1 must be a number','Error');
    return;
end
fpass1str=str2double(get(handles.edit_fpass1,'string'));
if  isnan(fpass1str)
    errordlg('fpass1 must be a number','Error');
    return;
end
fpass2str=str2double(get(handles.edit_fpass2,'string'));

fstop2str=str2double(get(handles.edit_fstop2,'string'));
gsstr=str2double(get(handles.edit_gs,'string'));
if  isnan(gsstr)
    errordlg('Gainstop must be a number','Error');
    return;
end
gpstr=str2double(get(handles.edit_gp,'string'));
if  isnan(gpstr)
    errordlg('Gainpass must be a number','Error');
    return;
end
if gpstr>gsstr
    errordlg('Gainstop must be bigger then Gainpass!','Error');
    return;
end    
%********************************************%
switch sel;
    case 11,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end                   
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=buttord(wp/pi,ws/pi,Rp,As);
                [b,a]=butter(n,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 12,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=buttord(wp/pi,ws/pi,Rp,As);
                [b,a]=butter(n,wc,'high');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');         
                
    case 13,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr;Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=buttord(wp/pi,ws/pi,Rp,As);
                [b,a]=butter(n,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 14,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr; Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;ws=fs/Fs*2*pi;
                [n,wc]=buttord(wp/pi,ws/pi,Rp,As);
                [b,a]=butter(n,wc,'stop');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 21,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end                   
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb1ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby1(n,Rp,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 22,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb1ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby1(n,Rp,wc,'high');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 23,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr;Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb1ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby1(n,Rp,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
    case 24,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr; Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;ws=fs/Fs*2*pi;
                [n,wc]=cheb1ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby1(n,Rp,wc,'stop');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
case 31,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp>fs
                    errordlg('Fstop must be bigger then Fpass','Error');
                    return;
                end
                if Fs<2*fs
                    errordlg('Fs  is wrong!','Error');
                    return;
                end                   
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb2ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby2(n,Rp,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 32,    fp=fpass1str;fs=fstop1str;Fs=fsstr;
                Rp=gpstr;As=gsstr;
                if fp<fs
                    errordlg('Fpass must be bigger then Fstop','Error');
                    return;
                end
                if Fs<2*fp
                    errordlg('Fs  is wrong!','Error');
                    return;
                end 
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb2ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby2(n,Rp,wc,'high');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
                
    case 33,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr;Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;
                ws=fs/Fs*2*pi;
                [n,wc]=cheb2ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby2(n,Rp,wc);
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');
    case 34,    if  isnan(fpass2str)
                    errordlg('fpass2 must be a number','Error');
                    return;
                end
                if  isnan(fstop2str)
                    errordlg('fstop2 must be a number','Error');
                    return;
                end
                fp1=fpass1str;fp2=fpass2str;fp=[fp1 fp2];
                fs1=fstop1str;fs2=fstop2str;fs=[fs1 fs2];
                Fs=fsstr; Rp=gpstr;As=gsstr;
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
                wp=fp/Fs*2*pi;ws=fs/Fs*2*pi;
                [n,wc]=cheb2ord(wp/pi,ws/pi,Rp,As);
                [b,a]=cheby2(n,Rp,wc,'stop');
                [h,w]=freqz(b,a);
                plot(w/2/pi*fsstr,abs(h));
                legend('·ùÆµÏìÓ¦');

end         
  guidata(hObject, handles);




function edit_gs_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gs as text
%        str2double(get(hObject,'String')) returns contents of edit_gs as a double


% --- Executes during object creation, after setting all properties.
function edit_gs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gp_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gp as text
%        str2double(get(hObject,'String')) returns contents of edit_gp as a double


% --- Executes during object creation, after setting all properties.
function edit_gp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uitoggletool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uitoggletool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_p.
function pushbutton_p_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w fsstr h;
plot(w/2/pi*fsstr,unwrap(angle(h))/pi*180);
legend('ÏàÆµÏìÓ¦');


% --- Executes on button press in pushbutton_im.
function pushbutton_im_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_im (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b;
himpu=impz(b,a); 
s=size(himpu);
stem([0:1:s-1],himpu); 
legend('³å¼¤ÏìÓ¦');


% --- Executes on button press in pushbutton_z.
function pushbutton_z_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b;
zplane(b,a) ;
legend('Áã¼«µãÍ¼');


% --- Executes on button press in pushbutton_h.
function pushbutton_h_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global w fsstr h;
plot(w/2/pi*fsstr,abs(h));
legend('·ùÆµÏìÓ¦');

% --- Executes on button press in pushbutton_st.
function pushbutton_st_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_st (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)\
global a b;
himpu=dstep(b,a); 
s=size(himpu);
stem([0:1:s-1],himpu);
legend('½×Ô¾ÏìÓ¦');


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu
global signal fs len;
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
len=length(signal);


% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes on button press in pushbutton_orign.
function pushbutton_orign_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orign (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
sound(signal,fs);


% --- Executes on button press in pushbutton_orignwave.
function pushbutton_orignwave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orignwave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs;
plot(signal);legend('Ô­Ê¼ÐÅºÅ²¨ÐÎ');


% --- Executes on button press in pushbutton_orignspec.
function pushbutton_orignspec_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_orignspec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal fs len;
x_co=[-pi:2*pi/len:pi-2*pi/len];
plot(x_co.*fs/2/pi,abs(fftshift(fft(signal))));
legend('Ô­Ê¼ÐÅºÅÆµÆ×');

% --- Executes on button press in pushbutton_afterwave.
function pushbutton_afterwave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_afterwave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal_f;
plot(abs(signal_f));legend('ÂË²¨ºóµÄÐÅºÅ²¨ÐÎ');


% --- Executes on button press in pushbutton_afterspec.
function pushbutton_afterspec_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_afterspec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal_f fs len;
x_co=[-pi:2*pi/len:pi-2*pi/len];
plot(x_co.*fs/2/pi,abs(fftshift(fft(signal_f))));legend('ÂË²¨ºóµÄÐÅºÅÆµÆ×');


% --- Executes on button press in pushbutton_fiter.
function pushbutton_fiter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a b signal len signal_f h ;
h = impz(b,a,len);
H = fftshift(fft(h));
S=fftshift(fft(signal));
signal_ff = S.*H;     % ÂË²¨
signal_f=ifftshift(ifft(signal_ff));
msgbox( '¶ÔÒôÀÖµÄÂË²¨ÒÑ¾­Íê³É£¡' );


% --- Executes on button press in pushbutton_after.
function pushbutton_after_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_after (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global signal_f fs;
sound(signal_f,fs);


