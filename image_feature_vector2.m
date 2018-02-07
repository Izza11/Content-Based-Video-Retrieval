function [ feature ] = image_feature_vector2( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    I = double(I);
    sizeI = size(I);
    a = floor(sizeI(1)/3);
    b = floor(sizeI(2)/3);
    j = 1; i = 0;
    feature = [];
    for k = 1:9
        i = mod(i, 3) + 1;
        window = I(a*(i-1) + 1 : a*i, b*(j-1) + 1 : b*j, :); 
        winSize = size(window);
        winSize = winSize(1)*winSize(2);
        red = window(:,:,1);
        green = window(:,:,2);
        blue = window(:,:,3);
        
        R = (histo(red));
        G = (histo(green));
        B = (histo(blue));
        feature = horzcat(feature, R, G, B);
        if i >= 3
            j = j + 1;
        end
    end
end

