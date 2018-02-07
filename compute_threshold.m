function [ T ] = compute_threshold(readerobj)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    jump = 1;
    weight = 1/9;
    frSize = size(read(readerobj,1));  %  frame size
    w = frSize(1); h = frSize(2);
    blockSize = floor(w/3) * floor(h/3);
    DB = 0;
    nof = readerobj.NumberOfFrames;
    fps = get(readerobj,'FrameRate');
    frno = int32(linspace(fps,fps*60*3));
    bs = 128*3; 
    for i= 1:jump:2*numel(frno)
        if i ~= 2*numel(frno)
            feat1 = image_feature_vector2(read(readerobj,i));
            feat2 = image_feature_vector2(read(readerobj,i+jump)); 
            diff = ((feat1 - feat2).^2);
            for j = 1 : bs : (size(feat1,2)-bs)
                DB = DB + (sum(diff(1,j:j+bs))/blockSize);  % weight
            end    
        end
    end
    MD = DB/(2*numel(frno)/jump);
    STD = 0;
    for i= 1:jump:2*numel(frno)
        if i ~= 2*numel(frno)
            feat1 = image_feature_vector2(read(readerobj,i));
            feat2 = image_feature_vector2(read(readerobj,i+jump)); 
            diff = ((feat1 - feat2).^2); 
            for j = 1 : bs : (size(feat1,2)-bs)
                D = (sum(diff(1,j:j+bs))/blockSize); % weight
                D = (D - MD).^2;
                STD = STD + D;
            end    
        end
    end
    STD = sqrt(STD/(2*numel(frno)/jump));
    T = MD + (STD);
%     T = MD;
end

