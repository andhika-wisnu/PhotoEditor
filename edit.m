function varargout = edit(varargin)
% EDIT MATLAB code for edit.fig
%      EDIT, by itself, creates a new EDIT or raises the existing
%      singleton*.
%
%      H = EDIT returns the handle to a new EDIT or the handle to
%      the existing singleton*.
%
%      EDIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDIT.M with the given input arguments.
%
%      EDIT('Property','Value',...) creates a new EDIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before edit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to edit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help edit

% Last Modified by GUIDE v2.5 14-Jun-2019 19:56:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @edit_OpeningFcn, ...
                   'gui_OutputFcn',  @edit_OutputFcn, ...
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


% --- Executes just before edit is made visible.
function edit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to edit (see VARARGIN)


% Choose default command line output for edit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes edit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = edit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
proyek=guidata(gcbo);
global info
[namafile,direktori] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'Photo Editor');
if isequal(namafile,0)
    return;
end
eval(['cd ''' direktori ''';']);
handles.data1 = imread(namafile);
info = imfinfo(namafile);
guidata(hObject,handles);
axes(handles.axes1);
imshow(handles.data1);
axes(handles.axes2);
imshow(handles.data1);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'value',0);
citra = handles.data1;
axes(handles.axes2)
gray = rgb2gray(citra);
imshow(citra)
imshow(gray)
title('Graycale');
axes(handles.axes3);
imhist(gray);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton2,'value',0);
citra = handles.data1;
axes(handles.axes2)
bw = im2bw(citra);
imshow(citra)
imshow(bw)
title('Black & White');
axes(handles.axes3);
imhist(bw);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton3,'value',0);
citra = handles.data1;
axes(handles.axes2)
comp = imcomplement(citra);
imshow(citra)
imshow(comp)
title('Negative');
axes(handles.axes3);

I = comp;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton4,'value',0);
citra = handles.data1;
axes(handles.axes2)
ycbcr = rgb2ycbcr(citra);
imshow(citra)
imshow(ycbcr)
title('YCbCr');
axes(handles.axes3);

I = ycbcr;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton5,'value',0);
citra = handles.data1;
YIQ = rgb2ntsc(citra);
axes(handles.axes2)
imshow(YIQ);
title('YIQ');

I = YIQ;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton6
set(handles.radiobutton6,'value',0);
citra = handles.data1;
HSV = rgb2hsv(citra);
axes(handles.axes2)
imshow(HSV);
title('HSV');
I = HSV;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton7
set(handles.radiobutton7,'value',0);
RGB=handles.data1;
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);
Y = 0.299 * R + 0.587 * G + 0.114 * B;
U = -0.14713 * R - 0.28886 * G + 0.436 * B;
V = 0.615 * R - 0.51499 * G - 0.10001 * B;
YUV = cat(3,Y,U,V);
axes(handles.axes2);
imshow(YUV);
title('YUV');
I = YUV;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
proyek=guidata(gcbo);
global cerah
set(handles.slider1,'Max',200);
set(handles.slider1,'Min',-200);
valC = get(handles.slider1,'Value');
valK = get(handles.slider2,'Value');
set(handles.edit1,'String',valC);
citra = handles.data1;
kontras=valK*(citra+valC);
cerah=kontras+valC;
imshow(cerah,'Parent',handles.axes2);

I = cerah;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
proyek=guidata(gcbo);
global cerah
set(handles.slider2,'Max',5);
set(handles.slider2,'Min',-5);
valCerah = get(handles.slider1,'Value');
valKontras = get(handles.slider2,'Value');
set(handles.edit2,'String',valKontras);
citra = handles.data1;
cerah=citra+valCerah;
kontras=valKontras*cerah;
imshow(kontras,'Parent',handles.axes2);

I = kontras;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global info
imageinfo(info);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
citra = handles.data1;
axes(handles.axes2)
imshow(citra);

I = citra;
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
axes(handles.axes3)
hist = histogram(R(:));
hist.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
hist = histogram(G(:));
hist.FaceColor = [0 1 0];
xlim([0 255])
hist = histogram(B(:));
hist.FaceColor = [0 0 1];
xlim([0 255])
hold off

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IM = getimage(handles.axes2);
[filename, foldername] = uiputfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'Save as');
complete_name = fullfile(foldername, filename);
imwrite(IM, complete_name);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
IM = getimage(handles.axes2);
rotate=imrotate(IM,90);
axes(handles.axes2)
imshow(rotate);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IM = getimage(handles.axes2);
rotate=imrotate(IM,-90);
axes(handles.axes2)
imshow(rotate);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IM = getimage(handles.axes2);
flip=fliplr(IM);
axes(handles.axes2)
imshow(flip);
