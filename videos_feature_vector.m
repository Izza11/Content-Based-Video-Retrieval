function [  ] = videos_feature_vector()
%VIDEOS_FEATURE_VECTOR Summary of this function goes here
%   Detailed explanation goes here
clc; clear; close all
srcFiles = dir('F:\LUMS\semester6\DIP\project\dev1\Videos2\*.avi');  % the folder in which ur images exists

for video_num = 1:length(srcFiles)
% Defining Output folder as 'snaps'
    video_name = strcat('F:\LUMS\semester6\DIP\project\dev1\Videos2',srcFiles(video_num).name);
    newFolder = fullfile(cd, 'Images');
    mkdir(newFolder);
    readerobj = mmreader(video_name);
    fps = get(readerobj,'FrameRate');
    frno = int32(linspace(fps,fps*60*3,12));
    totalNumOfImages = 0;
    for i=1:numel(frno)
        myframe = read(readerobj, frno(i));   %%check frno(i)
        open_base_file_name = sprintf('%0d.jpg', i);
        open_full_file_name = fullfile(newFolder, open_base_file_name);
        imwrite(myframe, open_full_file_name, 'jpg');   %saving as 'png' file
        totalNumOfImages = totalNumOfImages + 1;
%         [videos(video_num).featureVector, videos(video_num).images] ...
%         = feature_vector();
%         videos(video_num).name = video_name;
    end
%     [videos(video_num).featureVector, videos(video_num).images] ...
%         = feature_vector();
%         videos(video_num).name = video_name;
end
end

