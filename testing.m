%FEATURE_VECTORS_VIDEOS Summary of this function goes here
%   Detailed explanation goes here
clc; clear; close all;
% Directory = 'E:\LUMS\semester6\DIP\project\Proj\Videos1\';
Directory = 'F:\LUMS\semester6\DIP\project\dev3\dataset';
filenames = [dir(fullfile(Directory, '*.mp4')) ; dir(fullfile(Directory, '*.avi'))];
l = length(filenames);
annotations = 1;
for iterator1 = 1 : length(filenames)
    %% Reading one video at a time
    filename = filenames(iterator1).name
    readerobj = VideoReader(fullfile( Directory, filename));
    fps = get(readerobj,'FrameRate');
    frno = readerobj.NumberOfFrames;
    frSize = size(read(readerobj,1));  %  frame size
    w = frSize(1); h = frSize(2);
    
    
    %% Computing feature vector of video
    disp('Computing feature vector of video...');
    frameCount = 1; 
    videoFeat = [];
    shotDet = 0;
    jump = 5000;
    video_image = []; 
    s = 1; % no. of shots
    frno
    for i= 1:jump:frno   %-jump-1  
%         figure;
%         imshow(read(readerobj,i));
        annotations_info(annotations).id = filename;
        annotations_info(annotations).start_time = i/fps;
        annotations_info(annotations).frame_no = i;
        annotations = annotations + 1;
            
    end
    
 save('annotations_info.mat', 'annotations_info');
end
% save('Data.mat', 'videos');


