function [ tags_info ] = number_of_distict_tags_appearing( tags, file )
%NUMBER_OF_DISTICT_TAGS_APPEARING Summary of this function goes here
%   Detailed explanation goes here
load(file);
for i = 1:length(tags)
    tags_info(i).times = 0;
end
for i = 1:length(videos_data)
    for k = 1:length(videos_data(i).shots)
        [if_member, index] = ismember(videos_data(i).shots(k).tag, tags);
        if (if_member == 1)
            tags_info(index).tag = videos_data(i).shots(k).tag;
            tags_info(index).times = tags_info(index).times+1;
        end
    end
end


end

