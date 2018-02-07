clc; clear; close all
srcFiles = dir('E:\Uni Work\Semester 6\CS 674\Project\PI1\Videos\*.avi');  % the folder in which ur images exists

for video_num = 1:length(srcFiles)
% Defining Output folder as 'snaps'
    video_name = strcat('E:\Uni Work\Semester 6\CS 674\Project\PI1\Videos\',srcFiles(video_num).name)
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
        videos(video_num).featureVector = feature_vector();
        videos(video_num).name = video_name;
    end
end
aavector = videos(1).featureVector
aa = videos(1).name