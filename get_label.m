function [  ] = get_label( image, files )
%GET_LABEL Summary of this function goes here
%   Detailed explanation goes here
mean_probabilities = [];
% image =  imcrop(imread(image),[0 0 624 352]);
Directory = 'E:\Uni Work\Semester 6\CS 674\Project\ProjectIteration3\TestDataSet';
filenames = [dir(fullfile(Directory, '*.mp4')) ; dir(fullfile(Directory, '*.avi'))]; 

filename = filenames(7).name;
readerobj = VideoReader(fullfile( Directory, filename));
for i = 1:length(files)
%     object = load(files{i});
    object = load('men.mat');
%     object.mu
image = read(readerobj,2000);
imshow(image);
    input_image_feature_vector = DCT_feature_vector( (image) );
    size(input_image_feature_vector);
    probability = pdf(object.gmm, input_image_feature_vector);
    size(probability);
    mean_probabilities(end+1) = mean(probability)
%     plot(probability);
%     ezplot(@(input_image_feature_vector) pdf(object.gmm,input_image_feature_vector));
    break;
end
end

