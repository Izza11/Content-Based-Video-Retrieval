annotations = load('annotations_info.mat');
annotations.annotations_info(1).id

for i = 1 : size(annotations.annotations_info, 2)
    readerobj = VideoReader(strcat('F:\LUMS\semester6\DIP\project\dev3\dataset\', annotations.annotations_info(i).id));
    fps = get(readerobj,'FrameRate');
    frno = readerobj.NumberOfFrames;
    figure;
    imshow(read(readerobj, i));
    prompt = 'Enter tag: ';
    str = input(prompt,'s');
    annotations.annotations_info(i).tag = str;
end
save('annotations.mat', 'annotations');