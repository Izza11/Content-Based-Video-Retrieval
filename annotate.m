function [ videos_data ] = annotate( file )
%ANNOTATE Summary of this function goes here
%   Detailed explanation goes here
load(file);
for i = 1:length(videos_data)
    for k = 1:length(videos_data(i).shots)
        figure;
        imshow(videos_data(i).shots(k).image);
        shot_title = horzcat(videos_data(i).name , ', Start Frame: ', ...
           num2str(videos_data(i).shots(k).startFrame), ', End Frame:  ', ...
           num2str(videos_data(i).shots(k).endFrame));
        title(shot_title,'FontSize',14);
        prompt = 'Enter tag: ';
        input_tag = input(prompt,'s');
        videos_data(i).shots(k).tag = input_tag;
    end
end
save('videos_info.mat', 'videos_data');
end

