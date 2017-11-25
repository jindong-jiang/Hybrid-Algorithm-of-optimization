function varargout = optimization(varargin)
% OPTIMIZATION MATLAB code for optimization.fig
%      OPTIMIZATION, by itself, creates a new OPTIMIZATION or raises the existing
%      singleton*.
%
%      H = OPTIMIZATION returns the handle to a new OPTIMIZATION or the handle to
%      the existing singleton*.
%
%      OPTIMIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIMIZATION.M with the given input arguments.
%
%      OPTIMIZATION('Property','Value',...) creates a new OPTIMIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before optimization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to optimization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help optimization

% Last Modified by GUIDE v2.5 25-Aug-2014 11:23:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @optimization_OpeningFcn, ...
                   'gui_OutputFcn',  @optimization_OutputFcn, ...
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


% --- Executes just before optimization is made visible.
function optimization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to optimization (see VARARGIN)
handles.random=0;
handles.grd=0;

I=imread('logo.jpg');
image(I);
set(handles.logo,'handlevisibility','off','visible','off');

% Choose default command line output for optimization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes optimization wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = optimization_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function zuiyoudian_Callback(hObject, eventdata, handles)
% hObject    handle to zuiyoudian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zuiyoudian as text
%        str2double(get(hObject,'String')) returns contents of zuiyoudian as a double


% --- Executes during object creation, after setting all properties.
function zuiyoudian_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zuiyoudian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.fname=get(hObject,'String');


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GA.
function GA_Callback(hObject, eventdata, handles)
% hObject    handle to GA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of GA
a=get(hObject,'Value');
if(a==1)
    set(handles.PSO,'Value',0);
    set(handles.SA,'Value',0);
    handles.random=1;
else
    handles.random=0
end
guidata(hObject, handles);
%set(handles.zuiyoudian,'String',num2str(handles.random));
% --- Executes on button press in PSO.
function PSO_Callback(hObject, eventdata, handles)
% hObject    handle to PSO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PSO
a=get(hObject,'Value');
if(a==1)
    set(handles.GA,'Value',0);
    set(handles.SA,'Value',0);
    handles.random=2;
else
    handles.random=0
end
guidata(hObject, handles);
%set(handles.zuiyoudian,'String',num2str(handles.random))

% --- Executes on button press in SA.
function SA_Callback(hObject, eventdata, handles)
% hObject    handle to SA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SA
a=get(hObject,'Value');
if(a==1)
    set(handles.GA,'Value',0);
    set(handles.PSO,'Value',0);
    handles.random=3;
else
    handles.random=0
end
guidata(hObject, handles);
%set(handles.zuiyoudian,'String',num2str(handles.random))



% --- Executes on button press in Newton.
function Newton_Callback(hObject, eventdata, handles)
% hObject    handle to Newton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Newton
a=get(hObject,'Value');
if(a==1)
    set(handles.grddsct,'Value',0);
    set(handles.CG,'Value',0);
    handles.grd=1;
else
    handles.grd=0
end
guidata(hObject, handles);
%set(handles.zuiyoudian,'String',num2str(handles.grd))

% --- Executes on button press in grddsct.
function grddsct_Callback(hObject, eventdata, handles)
% hObject    handle to grddsct (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of grddsct
a=get(hObject,'Value');
if(a==1)
    set(handles.Newton,'Value',0);
    set(handles.CG,'Value',0);
    handles.grd=2;
else
    handles.grd=0
end
guidata(hObject, handles);
% --- Executes on button press in CG.
function CG_Callback(hObject, eventdata, handles)
% hObject    handle to CG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CG
a=get(hObject,'Value');
if(a==1)
    set(handles.Newton,'Value',0);
    set(handles.grddsct,'Value',0);
    handles.grd=3;
else
    handles.grd=0
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nvars=str2num(get(handles.nagin,'String'));
xoptini=str2double(get(handles.initnum,'String'));

handles.fname=get(handles.edit1,'String');
xopt=xoptini*(ones(1,nvars))';

fnc=str2func(handles.fname);
%set(handles,'HandleVisibility','on');
% err=10^-3;
% while(1)
time1=clock;
flag=0;
switch handles.random 
    case 0
        x0=xopt;
        
    case 1
        options=gaoptimset('PopulationSize',130,'CrossoverFraction',0.9,'MigrationFraction',0.5,'Generations',500,'StallGenLimit',50,'PlotFcns',@gaplotbestf,'PopInitRange',[xopt-0.49,xopt+0.49]');
        [x0,f0]=ga(fnc,nvars,options);
        x0=x0';
        flag=1;
    case 2
        
        [x0,f0]=PSO(fnc,40,0.7,1,1,500,nvars,xoptini);
        flag=1;
        %matlab 的未成熟产品，意外中发现，但是效果并不好，首先绘图函数不完全，无法通过rosenbrock函数测试，但可以用于一般的简单凸函数
        %   options=optimoptions(@pso,'PlotFcns');
%           [x0,f0]=pso(fnc,nvars,[],[]);
%            x0=x0';
%            flag=1;
    case 3
        options=saoptimset('MaxIter',500,'PlotFcns',@saplottemperature);
        [x0,f0] = simulannealbnd(fnc, xopt',[],[],options);
        flag=1;
        x0=x0';
end

switch handles.grd
    case 0
       
    case 1
        opt=optimset('PlotFcns',@optimplotfirstorderopt);
        [xopt,fopt]=fminunc(fnc,x0' ,opt);
        flag=2;
    case 2
        [xopt,fopt]=grad(handles.fname,'gradt',x0)
        flag=2;
    case 3
        [xopt,fopt]=frcg(handles.fname,'gradt',x0);
        flag=2;
end



%  if(abs(fopt-f0)<=err)
%      break;
%  end
% 
%  end

switch flag
    case 1
 set(handles.zuiyoudian,'String',num2str(x0));
 set(handles.zuiyouzhi,'String',num2str(f0));
    case 2
 set(handles.zuiyoudian,'String',num2str(xopt));
 set(handles.zuiyouzhi,'String',num2str(fopt));
    otherwise
        set(handles.zuiyoudian,'String','请重新输入');
end
time2=clock;
set(handles.timer,'String',num2str(etime(time2,time1)));




function nagin_Callback(hObject, eventdata, handles)
% hObject    handle to nagin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nagin as text
%        str2double(get(hObject,'String')) returns contents of nagin as a double


% --- Executes during object creation, after setting all properties.
function nagin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nagin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function initnum_Callback(hObject, eventdata, handles)
% hObject    handle to initnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initnum as text
%        str2double(get(hObject,'String')) returns contents of initnum as a double


% --- Executes during object creation, after setting all properties.
function initnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zuiyouzhi_Callback(hObject, eventdata, handles)
% hObject    handle to zuiyouzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zuiyouzhi as text
%        str2double(get(hObject,'String')) returns contents of zuiyouzhi as a double


% --- Executes during object creation, after setting all properties.
function zuiyouzhi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zuiyouzhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timer_Callback(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timer as text
%        str2double(get(hObject,'String')) returns contents of timer as a double


% --- Executes during object creation, after setting all properties.
function timer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
