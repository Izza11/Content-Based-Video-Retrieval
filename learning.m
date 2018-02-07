function [] = learning( tags, file )
%LEARNING Summary of this function goes here
%   Detailed explanation goes here
load(file);
for j = 1:length(tags)
%     if (strcmp(tags(j).tag, 'black') == 0 && strcmp(tags(j).tag, 'men') == 0 ...
%         && strcmp(tags(j).tag, 'man') == 0 && strcmp(tags(j).tag, 'woman') == 0)
%     if (tags(j).times > 5)
    if (strcmp(tags(j).tag, 'men') == 1)
        concept_feature_vector = [];
        for i = 1:length(videos_data)
            for k = 1:length(videos_data(i).shots)
                if (strcmp(tags(j).tag, videos_data(i).shots(k).tag) == 1)
                    if strcmp(videos_data(i).name(1), 'W')
                        image =  imcrop((videos_data(i).shots(k).image),[0 0 624 352]);
                    else
                        image = (videos_data(i).shots(k).image);
                    end
                    concept_feature_vector = vertcat(concept_feature_vector, ...
                    DCT_feature_vector(image));
                end
            end
        end
        tags(j).tag
        gmdist( concept_feature_vector, tags(j).tag );
    end
% %     end
end

end

