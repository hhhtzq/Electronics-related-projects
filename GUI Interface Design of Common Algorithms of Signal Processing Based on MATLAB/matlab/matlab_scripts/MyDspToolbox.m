function varargout = MyDspToolbox(varargin)
% MYDSPTOOLBOX M-file for MyDspToolbox.fig
%      MYDSPTOOLBOX, by itself, creates a new MYDSPTOOLBOX or raises the existing
%      singleton*.
%
%      H = MYDSPTOOLBOX returns the handle to a new MYDSPTOOLBOX or the handle to
%      the existing singleton*.
%
%      MYDSPTOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYDSPTOOLBOX.M with the given input arguments.
%
%      MYDSPTOOLBOX('Property','Value',...) creates a new MYDSPTOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyDspToolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyDspToolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyDspToolbox

% Last Modified by GUIDE v2.5 25-Dec-2009 14:57:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyDspToolbox_OpeningFcn, ...
                   'gui_OutputFcn',  @MyDspToolbox_OutputFcn, ...
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


% --- Executes just before MyDspToolbox is made visible.
function MyDspToolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyDspToolbox (see VARARGIN)

% Choose default command line output for MyDspToolbox
handles.output = hObject;
axes(handles.axes1);
a=imread('background.jpg');
image(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MyDspToolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyDspToolbox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_juanji.
function button_juanji_Callback(hObject, eventdata, handles)
% hObject    handle to button_juanji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Juanji


% --- Executes on button press in button_fft.
function button_fft_Callback(hObject, eventdata, handles)
% hObject    handle to button_fft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FFT


% --- Executes on button press in button_czt.
function button_czt_Callback(hObject, eventdata, handles)
% hObject    handle to button_czt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CZT


% --- Executes on button press in button_weina.
function button_weina_Callback(hObject, eventdata, handles)
% hObject    handle to button_weina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TheBEST


% --- Executes on button press in pushbutton_kelman.
function pushbutton_kelman_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_kelman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kalmanpredict


% --- Executes on button press in pushbutton_lpc.
function pushbutton_lpc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lpc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LPC


% --- Executes on button press in pushbutton_psd.
function pushbutton_psd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_psd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PowerSpectrum



% --- Executes on button press in pushbutton_iir.
function pushbutton_iir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_iir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IIR


% --- Executes on button press in pushbutton_fir.
function pushbutton_fir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FIR


% --- Executes on button press in pushbutton1_lms.
function pushbutton1_lms_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1_lms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LMS


% --- Executes on button press in pushbutton_sys.
function pushbutton_sys_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sys (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SYS


