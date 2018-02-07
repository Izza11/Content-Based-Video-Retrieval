function [ videos_info ] = feature_vectors_videos( )
%FEATURE_VECTORS_VIDEOS Summary of this function goes here
%   Detailed explanation goes here
clc; clear; close all;
Directory = 'E:\Uni Work\Semester 6\CS 674\Project\ProjectIteration3\TestDataSet';
filenames = [dir(fullfile(Directory, '*.mp4')) ; dir(fullfile(Directory, '*.avi'))]; 
% annotations = 1;
% l = length(filenames);
for iterator1 = 1 : length(filenames)
    %% Reading one video at a time
    filename = filenames(iterator1).name;
    readerobj = VideoReader(fullfile( Directory, filename));
    fps = get(readerobj,'FrameRate');
    frno = readerobj.NumberOfFrames;
    frSize = size(read(readerobj,1));  %  frame size
    w = frSize(1); h = frSize(2);
    %% approximating threshold value for one shot of video
%     disp('Computing threshold...');
    %T  = compute_threshold(readerobj);
    
    %% Computing feature vector of video
    disp('Computing feature vector of video...');
    disp(filename);
    frameCount = 1; 
    videoFeat = [];
    shotDet = 0;
    jump = 5;
    video_image = []; 
    s = 1; % no. of shots
    for i= 1:jump:frno-jump-1  
        feature_vec1 = image_feature_vector2(read(readerobj,i));
        feature_vec2 = image_feature_vector2(read(readerobj,i+jump));
        frameEr = abs_distance(feature_vec1, feature_vec2);
%         disp('frameErrrrrrrrrrr');
%         frameEr = boundary_error(feature_vec1, feature_vec2, readerobj)
        if frameEr <= 8    
            frameCount = frameCount + 1;  
            shotDet = 1;
        elseif shotDet == 1
            % shot detected
%             disp('Shot detected ');
            video_image = read(readerobj,i);
            interval = ceil(frameCount/3);
            steps = i-((frameCount-1)*jump); % go back to first frame of shot CHECK !
            feat1 = image_feature_vector2( read(readerobj,steps) );  %create feature vector of each representative image of shot
            feat2 = image_feature_vector2( read(readerobj,steps+(interval*jump)) );
            feat3 = image_feature_vector2( read(readerobj,steps+(2*interval*jump)) );
%             annotations_info(annotations).id = filename;
%             annotations_info(annotations).start_time = i/fps;
%             annotations_info(annotations).frame_no = i;
%             annotations = annotations + 1;
            
            videoFeat = vertcat(videoFeat,feat1);
            videoFeat = vertcat(videoFeat,feat2);
            videoFeat = vertcat(videoFeat,feat3);
            frameCount = 1;
            shotDet = 0;
%             figure;
%             imshow(read(readerobj,i));
%             title(filename);
            videos_info(iterator1).shots(s).image = read(readerobj,i);
            videos_info(iterator1).shots(s).startFrame = steps;
            videos_info(iterator1).shots(s).endFrame = steps+(2*interval*jump);
%             videos_data(iterator1).shots(s).videoName = filename;
            s = s + 1;
        end  
    end
    videos_info(iterator1).featureVector = videoFeat;  % use struct
    videos_info(iterator1).name = filename; 
    videos_info(iterator1).image = video_image;
    videos_info(iterator1).error = [];
end
%  save('annotations_info.mat', 'annotations_info');
 save('videos_info.mat', 'videos_info');
end

