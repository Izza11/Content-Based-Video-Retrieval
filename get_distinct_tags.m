function [ tags ] = get_distinct_tags( file )
%GET_DISTINCT_TAGS Summary of this function goes here
%   Detailed explanation goes here
load(file);
tags = {};
for i = 1:length(videos_data)
    for k = 1:length(videos_data(i).shots)
        if (ismember(videos_data(i).shots(k).tag, tags) == 0)
           tags{end + 1} = videos_data(i).shots(k).tag;
        end
    end
end

end

