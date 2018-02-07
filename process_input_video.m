function [ videos_data ] = process_input_video( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    Directory = 'F:\LUMS\semester6\DIP\project\dev2\clips';
    readerobj = VideoReader(fullfile( Directory, filename));
    fps = get(readerobj,'FrameRate');
%     fps = readerobj.NumberOfFrames;
%     frno = int32(linspace(fps,fps*60*3));
    frno = readerobj.NumberOfFrames;
    frSize = size(read(readerobj,1));  %  frame size
    w = frSize(1); h = frSize(2);
    
    frameCount = 1; 
    videoFeat = [];
    shotDet = 0;
    jump = 5;
    video_image = []; 
    s = 1;
    for i= 1:jump:frno-jump-1
        feature_vec1 = image_feature_vector2(read(readerobj,i));
        feature_vec2 = image_feature_vector2(read(readerobj,i+jump));
        frameEr = abs_distance(feature_vec1, feature_vec2);
%         frameEr = boundary_error(feature_vec1, feature_vec2, readerobj);
        if frameEr <= 10     
            disp('below TTTTTTTTTTTTTT!!!!');
            frameCount = frameCount + 1 
            shotDet = 1;
        end
        if (shotDet == 1 && frameEr > 10) || (shotDet == 1 && i >= frno-2*jump-1)
            % shot detected
            if (shotDet == 1 && i >= frno-2*jump-1)
               frameCount = frameCount - 1; 
            end
            video_image = read(readerobj,i);
            disp('shot detectedddddddd!!!!!!!1');
            interval = ceil(frameCount/3);
            steps = i-((frameCount-1)*jump) % go back to first frame of shot CHECK !
            feat1 = image_feature_vector2( read(readerobj,steps) );  %create feature vector of each representative image of shot
            feat2 = image_feature_vector2( read(readerobj,steps+(interval*jump)) );
            feat3 = image_feature_vector2( read(readerobj,steps+(2*interval*jump)) );
            videoFeat = vertcat(videoFeat,feat1);
            videoFeat = vertcat(videoFeat,feat2);
            videoFeat = vertcat(videoFeat,feat3);
            frameCount = 1;
            shotDet = 0;
            videos_data.shots(s).image = read(readerobj,i);
            videos_data.shots(s).startFrame = steps;
            videos_data.shots(s).endFrame = steps+(2*interval*jump);
            videos_data.shots(s).videoName = filename;
            s = s + 1;
            figure;
            imshow(read(readerobj,i));
        end        
    end
    videos_data.featureVector = videoFeat;  % use struct
    videos_data.name = filename; 
    videos_data.image = video_image;

end

