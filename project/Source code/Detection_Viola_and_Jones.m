clear all;
close all;
clc;
    faceDetector = vision.CascadeObjectDetector('MergeThreshold',7);
%Read input image.

    I = imread('girl_row.jpg');
    I=imresize(I,0.5);
%Detect faces.

    bboxes = step(faceDetector, I);
    %MergeThreshold=50;
%Annotate detected faces.
     %name = {'a','b','c','d','e'};
     for i= 1:21
     n1=I(bboxes(i,2):bboxes(i,2)+bboxes(i,4),bboxes(i,1):bboxes(i,1)+bboxes(i,3));
     figure,imshow(n1);
     
     filename = strcat(int2str(i),'.jpg');
     imwrite(n1,filename);
     
    % name= Geometric_point(n1);
     end
     name='a';
    IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, name);
    figure, imshow(IFaces), title('Detected faces');
    