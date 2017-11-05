clear all;
close all;
clc;
%num_people = 9;
%num_face = 7;
num_people = 2;
num_face = 7;
Img =[];
temp=[];
for a= 1:num_people
    for v=1:num_face
   % nom=strcat('C:\Users\dhanush kuber\Documents\MATLAB\att_faces\s',int2str(a),'\',int2str(v),'.pgm')
    nom=strcat('C:\Users\Admin\Desktop\renu\project\Database\s',int2str(a),'\s (',int2str(v),').pgm')
   
   I=imread(nom);
   I = imresize(I,[100,100]);
   [m,n] = size(I);
   image_dims = [100,100];
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
figure,imshow(uint8(Img_ave1));



for i=1:num_face*num_people
A(:,i) = Img(:,i) - Img_ave;
end


[evectors1, score, evalues] = princomp(A');
num_eigenfaces = 20;
evectors = evectors1(:, 1:num_eigenfaces);
features = evectors' * A;


figure;
for n = 1:num_eigenfaces
    subplot(2, ceil(num_eigenfaces/2), n);
    evector = reshape(evectors(:,n), image_dims);
    mn=min(evector(:));
    mx=max(evector(:));
    imshow(evector',[mn,mx]);
end

%input_image=imread('C:\Users\Admin\Desktop\renu\project\Database\Group\best.jpg');


input_image=imread('C:\Users\Admin\Desktop\renu\project\Database\s1\s (1).pgm');
figure;imshow(input_image);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%input image to test

input_image = imresize(input_image,[100,100]);
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
end
 
% find the image with the highest similarity
[match_score, match_ix] = min(similarity_score);
match_score1=match_score;
match_ix1=ceil((match_ix)/num_face);

%q= strcat('C:\Users\dhanush kuber\Documents\MATLAB\att_faces\s',int2str(match_ix1),'\1','.pgm');
q= strcat('C:\Users\Admin\Desktop\renu\project\Database\face\s',int2str(match_ix1),'.jpg');

figure, imshow(q);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%display the result
%q= strcat('newdatabase\detecteddata\s',int2str(match_ix1),'\',int2str(1),'.jpg');
%title(sprintf('matches %s, score %f', filenames(match_ix).name, match_score));


