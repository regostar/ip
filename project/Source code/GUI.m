function varargout = second_gui(varargin)
% SECOND_GUI M-file for second_gui.fig
%      SECOND_GUI, by itself, creates a new SECOND_GUI or raises the existing
%      singleton*.
%
%      H = SECOND_GUI returns the handle to a new SECOND_GUI or the handle to
%      the existing singleton*.
%
%      SECOND_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECOND_GUI.M with the given input arguments.
%
%      SECOND_GUI('Property','Value',...) creates a new SECOND_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before second_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to second_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help second_gui

% Last Modified by GUIDE v2.5 22-Apr-2017 22:06:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @second_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @second_gui_OutputFcn, ...
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


% --- Executes just before second_gui is made visible.
function second_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to second_gui (see VARARGIN)

% Choose default command line output for second_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes second_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = second_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
msgbox('This is a  system consisting of three phases - face detection, face recognition and marking attendance. The attendance is recorded by using a camera that captures group images of the students. The group image is then subjected to detection where individual faces are segmented and then compared with the stored database to perform recognition. The attendance is then marked on the Attendance sheet.The buttons present on the right  namely load Image , Detect faces , Recognize , Attendance sheet are used to perform suitable operations and view the results . The operation of each button can be understood by selecting the respective name below the ABOUT button in help panel','Introduction'); 

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
items = get(hObject,'String'); % stores all the data into items
index_selected = get(hObject,'Value'); %values are stored in index_selected 
item_selected = items{index_selected}; %index of the value chosen

%display(index_selected);
if (index_selected == 1)
    msgbox('This button allows you to select an image from you Computer. Once it is clicked , choose any image file with .jpg extension and further processing will be performed on it','About');
elseif (index_selected == 2)
    msgbox('The image which you loaded just now will be processed to find any human faces present in it and the number of faces deteced will be displayed in the "no of faces detected" box','About');
elseif(index_selected == 3)
    msgbox('After Detection of faces in the image , the next step is to identify the detected face . Eg: if the image belongs to john or Robert or anybody else. The recognise button applies the recognition algorithm and tries to identify the deteced faces','About');
elseif(index_selected == 4)
    msgbox('The identified people are now to be marked PRESENT or ABSENT in the server to make note of the Attendance . Which is done by this specific button. The person is marked PRESENT if his/her face was present in the loaded group image and recognised by the algorithm. Else it is marked as ABSENT','About');
else 
    msgbox('This button closes the currently running Graphical User Interface window','About'); end 
 

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
set(hObject,'String',{'Load Image';'Detect faces';'Recognize';'Attendance Sheet';'Exit'});

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if  exist('attendence_sheet1.txt','file') == 2
    winopen('attendence_sheet1.txt')
else
    msgbox('NO ATTENDENCE SHEET TO DISPLAY','INFO...!!!','HELP','MODAL')
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2,
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Image loading unsuccessful,try again!'),'Error','Error');
    return
end
im=imread(path);
path3=path;
im=im2double(im); %converts to double
im2=im; %for backup process :)
setappdata(0,'filename777',im2);
axes(handles.axes1);
imshow(im);



% --- Executes on button press in Detection.
function Detection_Callback(hObject, eventdata, handles)
% hObject    handle to Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% faceDetector = vision.CascadeObjectDetector('MergeThreshold',9);
% %Read input image.
% 
%     %s1=strcat('newdatabase\newclass\group\group11.jpg');
%     
%   %  I=imresize(I,0.5);
% %Detect faces.
% 
%     bboxes = qstep(faceDetector, I);
%     %MergeThreshold=50;
% %Annotate detected faces.
%      %name = {'a','b','c','d','e'};
%      for i= 1:size(bboxes,1)
%      n1=I(bboxes(i,2):bboxes(i,2)+bboxes(i,4),bboxes(i,1):bboxes(i,1)+bboxes(i,3));
%     % figure,imshow(n1);
%      
%       filename = strcat(int2str(i),'.jpg');
%      imwrite(n1,filename);
%      
%     % name= Geometric_point(n1);
%      end
%      name='a';
%     IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, name,'EdgeColor','r');
    %figure, imshow(IFaces), title('Detected faces');
    %close all;
    FDetect = vision.CascadeObjectDetector('MergeThreshold',7);

%Read the input image
I = getappdata(0,'filename777');
%I = imread('best.jpg');
%I=imresize(I,0.5);
%I=imhist(I);

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);

I=im2double(I);
%setappdata(0,'detected_faces',I);
%axes(handles.axes1);
imshow(I);
 
%imwrite(I,'groupa_detected','jpg');
hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','r');
end

title('Face Detection');
%figure,imshow(n1);
%      
%       filename = strcat(int2str(i),'.jpg');
%      imwrite(n1,filename);
%      
%     % name= Geometric_point(n1);
%      end
%      name='a';
 
hold off;
score = size(BB,1);


score_faces = score;
score_faces = num2str(score_faces);
set(handles.score_faces,'String',score_faces);


% --- Executes on button press in matching.
function matching_Callback(hObject, eventdata, handles)
% hObject    handle to matching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
perc=0;
num_people = 11;
num_face = 4;
Img =[];
temp=[];
n2=[];
for a= 1:num_people
    for v=1:num_face
    nom=strcat('C:\Users\dhanush kuber\Documents\MATLAB\database\s',int2str(a),'\1 (',int2str(v),')','.jpg')
        I=imread(nom);
       
        if size(I,3)==3
        I=rgb2gray(I);
        end
        j=double(I);
        % if a==11
         % I=imadjust(I,[],[],5);
         %  figure;imshow(I)
       %  end
         if a==1
          I=imadjust(I,[],[],3);
          %figure;imshow(I)
         end
       I=histeq(I);
      I = imresize(I,[70,70]);
    [m,n] = size(I)
    image_dims = [70,70];
    k=1;
    for i=1:m
        for j=1:n
         temp(k,1) = I(i,j);k=k+1;
        end
    end

    Img = [Img,temp];
    end
end
Img = double(Img);

Img_ave = mean(Img,2);

k=1;
for i=1:m
    for j=1:n
        Img_ave1(i,j) = Img_ave(k,1);k=k+1;
    end
end
%figure,imshow(uint8(Img_ave1));



for i=1:num_face*num_people
A(:,i) = Img(:,i) - Img_ave;
end


[evectors1, score, evalues] = princomp(A');
num_eigenfaces = 30;
evectors = evectors1(:, 1:num_eigenfaces);
features = evectors' * A;

%for displaying eigen faces
%figure;
for n = 1:num_eigenfaces
   % subplot(2, ceil(num_eigenfaces/2), n);
    evector = reshape(evectors(:,n), image_dims);
    mn=min(evector(:));
    mx=max(evector(:));
   % imshow(evector',[mn,mx]);
end



%for attendance upate
     
       %for attendence sheet
 fid = fopen('attendence_sheet1.txt','a');
%  fprintf(fid,'%s              %s\r\n\n', 'Name','attendance');
  Name = {'Sriram ','Sharath','Nazir  ','Anirudh','Byomakesh','Aditya ','Akshaya','Nandish','Gautham','Vinod','Narayan','Akshay',};
  fprintf(fid,'%s         %s                 %s\r\n\n','sl no','Name','attendance');





for p=1:11
input_image=imread(strcat('C:\Users\dhanush kuber\Documents\MATLAB\database\individual\',int2str(p),'.jpg'));
%input_image=imread('newdatabase\detecteddata\1.jpg');
axes(handles.axes1);
figure;imshow(input_image);

    if p==1
         input_image=imadjust(I,[],[],0.8);
    end
input_image=histeq(input_image);
input_image = imresize(input_image,[70,70]);
input_image=double(input_image);
[m,n] = size(input_image);

k=1;
for i=1:m
    for j=1:n
        test_img(k,1) = input_image(i,j);k=k+1;
    end
end






% calculate the similarity of the input to each training image
img_test = test_img - Img_ave;
feature_test = evectors' * (img_test);
%figure;imshow(feature_test);
for i=1:num_people*num_face
similarity_score(i) = norm(features(:,i)-feature_test);
knn = sort(similarity_score);
end
 
% find the image with the highest similarity
[match_score, match_ix] = min(similarity_score); 
match_score1=match_score
r=rem((match_ix),(num_face));
if (r==0)
    r=1;
end
match_ix1=ceil((match_ix)/num_face)

q= strcat('C:\Users\dhanush kuber\Documents\MATLAB\database\s',int2str(match_ix1),'\1 (',int2str(r),')','.jpg');
q=imread(q);
 if size(q,3)==3
        q=rgb2gray(q);
 end
 
 
        n2= [n2,Name{match_ix1}]
        n1=Name{match_ix1}  
       % fprintf(fid,'%d             %s              %s\r\n\n',p, n1,'present');
        q = imresize(q,[100,100]);
      figure;
      imshow(q);
      
    if (p==match_ix1)
        perc=perc+1;
        
    end
        
end

   
   for p=1: 11
   k=strfind(n2,Name{p})
   if k
      fprintf(fid,'%d             %s              %s\r\n\n',p, Name{p},'present');
  
   else
      fprintf(fid,'%d             %s              %s\r\n\n',p, Name{p},'absent'); 
   end
   end



fclose(fid);
percentage=((perc/num_people)*100)
[IDX, C, SUMD, D] = kmeans(features', 5);



% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
clear all;
close all;


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Detection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function score_faces_Callback(hObject, eventdata, handles)
% hObject    handle to score_faces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score_faces as text
%        str2double(get(hObject,'String')) returns contents of score_faces as a double


% --- Executes during object creation, after setting all properties.
function score_faces_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score_faces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
