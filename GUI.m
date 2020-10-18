function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 17-Oct-2020 11:55:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn1.
function btn1_Callback(hObject, eventdata, handles)
% hObject    handle to btn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile({'*.png;*.jpg;*.jpeg'}, 'Ch?n ?nh')
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a', a)

% --- Executes on button press in btn2.
function btn2_Callback(hObject, eventdata, handles)
% hObject    handle to btn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);
axes(handles.axes1);
imshow(agray);


% --- Executes on button press in btn3.
function btn3_Callback(hObject, eventdata, handles)
% hObject    handle to btn3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
abw=im2bw(a);
axes(handles.axes1);
imshow(abw);



% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);
axes(handles.axes1);
imhist(ahist);

% --- Executes on button press in btn4.
function btn4_Callback(hObject, eventdata, handles)
% hObject    handle to btn4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
axes(handles.axes1);
imshow(a);


% --- Executes on button press in btnEdge.
function btnEdge_Callback(hObject, eventdata, handles)
% hObject    handle to btnEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
aedge=a;
aedge=rgb2gray(aedge);
aedge=edge(aedge,'prewitt')'
axes(handles.axes1);
imshow(aedge);

% --- Executes on button press in complementImage.
function complementImage_Callback(hObject, eventdata, handles)
% hObject    handle to complementImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
acomp=a;
acomp=imcomplement(acomp);
axes(handles.axes1);
imshow(acomp);



% --- Executes on button press in btnRecognition.
function btnRecognition_Callback(hObject, eventdata, handles)
% hObject    handle to btnRecognition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');

im = imresize(a, [480 NaN]);
imgray = rgb2gray(im);
imbin = imbinarize(imgray);
im = edge(imgray, 'sobel');


im = imdilate(im, strel('diamond', 2));
im = imfill(im, 'holes');
im = imerode(im, strel('diamond', 10));


Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end    

%all above step are to find location of number plate

im = imcrop(imbin, boundingBox);

%resize number plate to 240 NaN
im = imresize(im, [240 NaN]);

%clear dust
im = imopen(im, strel('rectangle', [4 4]));

%remove some object if it width is too long or too small than 500
im = bwareaopen(~im, 500);
%%%get width
 [h, w] = size(im);

imshow(im);

%read letter
Iprops=regionprops(im,'BoundingBox','Area', 'Image')
count = numel(Iprops);

noPlate=[]; % Initializing the variable of number plate string.

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) & oh>(h/3)
       letter=readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
%        figure; imshow(Iprops(i).Image);
       noPlate=[noPlate letter]; % Appending every subsequent character in noPlate variable.
   end
end

set(handles.result, 'string', noPlate);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

im = getappdata(0,'a');

%read letter

