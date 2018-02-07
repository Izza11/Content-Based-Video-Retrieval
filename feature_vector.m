function [ allFeatureVectors, video_frames] = feature_vector( )
%FEATURE_VECTOR Summary of this function goes here
%   Detailed explanation goes here
quantization = 128*3*9;
srcFiles = dir('E:\Uni Work\Semester 6\CS 674\Project\PI1\Images\*.jpg');  % the folder in which ur images exists
row = 1;
numOfPics = length(srcFiles);
% allFeatureVectors = zeros(numOfPics+1, quantization);
%%%%%%%%%%%recheck me!!!!!!!!!!!!!!
allFeatureVectors = zeros(numOfPics, quantization);
imageNamesXcor = 1;
for imageNum = 1:length(srcFiles)
    filename = strcat('E:\Uni Work\Semester 6\CS 674\Project\PI1\Images\',srcFiles(imageNum).name);

    i1 = imread(filename);
    [imageWidth, imageHeight] = size(i1);
    width = floor(imageWidth/3); width1 = width;
    height = floor((imageHeight/3)/3); height1 = height;
    startWidth = 1; startHeight = 1;
    image1 = [width height 3];
    imageX=1; imageY=1; numberofSubplots = 1;
    redChannel = zeros(1,128); blueChannel = zeros(1,128);
    greenChannel = zeros(1,128);
    startW = 1; startH = 1; subx = 3; suby = 3;
    featureVector = zeros(1, quantization);
    for v = 1:3
      for n = 1:3
        for i = startWidth:1:width
          for k = startHeight:1:height
              image1(imageX,imageY,1) = i1(i,k,1);
              redChannel(floor((i1(i,k,1)+1)/2)) = ...
              redChannel(floor((i1(i,k,1)+1)/2))+1;
              image1(imageX,imageY,2) = i1(i,k,2);
              greenChannel(floor((i1(i,k,2)+1)/2)) = ...
              greenChannel(floor((i1(i,k,2)+1)/2))+1;
              image1(imageX,imageY,3) = i1(i,k,3);
              blueChannel(floor((i1(i,k,3)+1)/2)) = ...
              blueChannel(floor((i1(i,k,3)+1)/2))+1;
              imageY=imageY+1;
           end
           imageY=1;
           imageX=imageX+1;
        end
        redChannel = redChannel/(height1*width1);
        blueChannel = blueChannel/(height1*width1);
        greenChannel = greenChannel/(height1*width1);
        if n==1 && v==1
          featureVector = horzcat(redChannel,blueChannel,greenChannel);
        else
          featureVector = horzcat(featureVector,redChannel,blueChannel,greenChannel);
        end
        startWidth = startW; startHeight = startHeight+height1;
        height=height+height1;
        imageX=1; imageY=1;
        redChannel = zeros(1,128);
        greenChannel = zeros(1, 128);
        blueChannel = zeros(1, 128);
      end
      startW = startW+width1;
      startWidth = startW;
      width = width+width1;
      startHeight = startH;
      height = height1;
    end
    video_frames(row).images = i1;
    allFeatureVectors(row,:) = featureVector;
    row = row+1;
end
end

