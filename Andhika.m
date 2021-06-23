function varargout = Andhika(varargin)
% ANDHIKA MATLAB code for Andhika.fig
%      ANDHIKA, by itself, creates a new ANDHIKA or raises the existing
%      singleton*.
%
%      H = ANDHIKA returns the handle to a new ANDHIKA or the handle to
%      the existing singleton*.
%
%      ANDHIKA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANDHIKA.M with the given input arguments.
%
%      ANDHIKA('Property','Value',...) creates a new ANDHIKA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Andhika_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Andhika_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Andhika

% Last Modified by GUIDE v2.5 11-Jun-2019 19:41:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Andhika_OpeningFcn, ...
                   'gui_OutputFcn',  @Andhika_OutputFcn, ...
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


% --- Executes just before Andhika is made visible.
function Andhika_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Andhika (see VARARGIN)
profil = imread('E:\Tugas\PCD\Project\DSCF8080.jpg');
axes(handles.axes1);
imshow(profil);
profil1 = imread('E:\Tugas\PCD\Project\832.jpg');
axes(handles.axes2);
imshow(profil1);
profil2 = imread('E:\Tugas\PCD\Project\abi.jpg');
axes(handles.axes3);
imshow(profil2);



% Choose default command line output for Andhika
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Andhika wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Andhika_OutputFcn(hObject, eventdata, handles) 
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
edit


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
