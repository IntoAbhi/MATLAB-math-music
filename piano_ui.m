function varargout = piano_ui(varargin)
% PIANO_UI MATLAB code for piano_ui.fig

% Edit the above text to modify the response to help piano_ui

% Last Modified by GUIDE v2.5 17-Jun-2019 06:29:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @piano_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @piano_ui_OutputFcn, ...
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


% --- Executes just before piano_ui is made visible.
function piano_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to piano_ui (see VARARGIN)

% Choose default command line output for piano_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes piano_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = piano_ui_OutputFcn(hObject, eventdata, handles) 
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

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
v = get(handles.slider, 'value');
set(handles.live, 'string', v)
% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
v = get(handles.slider, 'value');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
limit= str2num(get(handles.edit2,'string'));
v = 1-get(handles.slider, 'value');
disp(v)
oldest=0;
old=1;
sample=0;
time=0;
time_vec=[];
fibo_vec=[];

while(sample<limit)	
    set(handles.status, 'string', 'Status: Plotting, please wait...')
    temp = num2str(sample);
    for i=1:size(temp,2)
        time=time+1;
        time_vec(time)=time;
        fibo_vec(time)=str2num(temp(i));
    end

    oldest=old;
    old=sample;
    sample=oldest+old;
end

for k=fibo_vec
    if k==1
        [y,Fs] = audioread('E.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'E')
        pause(v)
    elseif k==2
        [y,Fs] = audioread('F#.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'F#')
        pause(v)
    elseif k==3
        [y,Fs] = audioread('G#.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'G#')
        pause(v)
    elseif k==4
        [y,Fs] = audioread('A.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'A')
        pause(v)
    elseif k==5
        [y,Fs] = audioread('B.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'B')
        pause(v)
    elseif k==6
        [y,Fs] = audioread('C#.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'C#')
        pause(v)
    elseif k==7
        [y,Fs] = audioread('D#_high.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'D# High')
        pause(v)
    elseif k==8
        [y,Fs] = audioread('E_high.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'E High')
        pause(v)
    elseif k==9
        [y,Fs] = audioread('F#_high.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'F# High')
        pause(v)
    elseif k==0
        [y,Fs] = audioread('F#.mp3');
        w=audioplayer(y,Fs);
        play(w)
        set(handles.note, 'string', 'F#')
        pause(v)
    end
end
set(handles.note, 'string', 'None')
plot(fibo_vec, time_vec)
set(handles.status, 'string', 'Status: Successfully plotted!')



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.credits, 'string', "Project on MATLAB to explore the randomness of certain series in mathematics long known to mankind."+ newline +"                               Developed by: Abhigyan Shrivastava"+ newline +"                                   Guided by: Prof. RN Patel"+ newline +"                                     Institute: NIT Raipur")
