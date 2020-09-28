function varargout = Juanji(varargin)
% JUANJI M-file for Juanji.fig
%      JUANJI, by itself, creates a new JUANJI or raises the existing
%      singleton*.
%
%      H = JUANJI returns the handle to a new JUANJI or the handle to
%      the existing singleton*.
%
%      JUANJI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JUANJI.M with the given input arguments.
%
%      JUANJI('Property','Value',...) creates a new JUANJI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Juanji_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Juanji_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Juanji

% Last Modified by GUIDE v2.5 20-Dec-2009 11:33:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Juanji_OpeningFcn, ...
                   'gui_OutputFcn',  @Juanji_OutputFcn, ...
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


% --- Executes just before Juanji is made visible.
function Juanji_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Juanji (see VARARGIN)

% Choose default command line output for Juanji
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Juanji wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global y1 y2 y3 s1 s2 sel_met;
y1 = [0 1 2 3 4 5 4 3 2 1 0] ;   % ���ǲ�
y2 = [0 0 0 1 1 1 1 1 0 0 0];       % ����
y3 = [1 1 1 1 1 1 1 1 1 1 1];       %��Ծ�ź�
s1=y1;
s2=y1;
sel_met='���Ծ��';



% --- Outputs from this function are returned to the command line.
function varargout = Juanji_OutputFcn(hObject, eventdata, handles) 
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
%        contents{get(hObject,'Value')} returns selected item from
%        popupmenu1
global s1 y1 y2 y3;
val = get( hObject, 'Value' );
str = get(hObject,'String');
switch str{val}
    case '���ǲ�'
         s1=y1;
    case '����'
         s1=y2;
    case '��Ծ�ź�'
         s1=y3;
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global s2 y1 y2 y3;
val = get( hObject, 'Value' );
str = get(hObject,'String');
switch str{val}
    case '���ǲ�'
         s2=y1;
    case '����'
         s2=y2;
    case '��Ծ�ź�'
         s2=y3;
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
global sel_met;
val = get( hObject, 'Value' );
str = get(hObject,'String');
switch str{val}
    case '���Ծ��'
        sel_met = '���Ծ��';
    case 'Բ�ܾ��'
        sel_met = 'Բ�ܾ��';
    case '���㷨�����Ծ��'
        sel_met = '���㷨';
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_ok.
function button_ok_Callback(hObject, eventdata, handles)
% hObject    handle to button_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s1 s2 sel_met;
switch sel_met
    case '���Ծ��'
        s3 = conv(s1,s2);   % ���Ծ��
        axes(handles.axes1);cla; stem( s1 ); grid on;legend('�ź�1');
        axes(handles.axes2); cla;stem( s2 );grid on;legend('�ź�2');
        axes(handles.axes3); cla;stem( s3 );grid on;legend('���Ծ��');
    case 'Բ�ܾ��'
        s3 = ifft( fft(s1) .* fft(s2) );   % Բ�ܾ��
        axes(handles.axes1); cla;stem(s1 ); grid on;legend('�ź�1');
        axes(handles.axes2); cla;stem(s2 ); grid on;legend('�ź�2');
        axes(handles.axes3);cla; stem(s3 ); grid on;legend('Բ�ܾ��');
    case '���㷨'
        s11 = [ s1, zeros( 1, length(s2) - 1 ) ];
        s22 = [ s2, zeros( 1, length(s11) - length(s2) ) ];
        s3 = ifft(fft(s11).* fft(s22));   % Բ�ܾ��
        axes(handles.axes1);cla; stem( s11 ); grid on;legend('�ź�1');
        axes(handles.axes2);cla; stem( s22 ); grid on;legend('�ź�2');
        axes(handles.axes3); cla;stem( s3 );  grid on;legend('���㷨��Բ�ܾ��');
end



