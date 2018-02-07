%% Initialize videos feature vector data
% load('Data.mat');
% videos = feature_vectors_videos();
%% Display video shots
% load('videos_info.mat');
% for i = 1:length(videos_data)
%     for k = 1:length(videos_data(i).shots)
%         figure;
%         imshow(videos_data(i).shots(k).image);
%         shot_title = horzcat(videos_data(i).name , ', Start Frame: ', ...
%            num2str(videos_data(i).shots(k).startFrame), ', End Frame:  ', ...
%            num2str(videos_data(i).shots(k).endFrame));
%         title(shot_title,'FontSize',14);
%     end
% end

%% uncomment to annotate the dataset
%  annotate( 'videos_info.mat' );

%% get all the distinct tags in the training dataset
% tags = number_of_distict_tags_appearing( get_distinct_tags( 'videos_info.mat' ), 'videos_info.mat' );

%% learning
% learning( tags, 'videos_info.mat' )
% load('videos_info.mat');
%    readerobj = VideoReader(fullfile( Directory, videos_data(1).name));
%     
%     image = (read(readerobj,videos_data(1).shots(2).startFrame));
% convertedImage = rgb2gray((image));
% imshow(convertedImage)

%% automatic annotation
tag_files = {'men.mat', 'woman.mat', 'people.mat', 'man.mat', 'kid.mat', 'city.mat'};
get_label('3.jpg', tag_files);