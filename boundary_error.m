function [ DB ] = boundary_error( feat1, feat2, readerobj )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here 
    frSize = size(read(readerobj,1));  %  frame size
    w = frSize(1); h = frSize(2);
    blockSize = floor(w/3) * floor(h/3);
    diff = ((feat1 - feat2).^2);
    bs = 128*3; 
    weight = 1/9;
    DB = 0;
    for j = 1 : bs : (size(feat1,2)-bs)
        DB = DB + (sum(diff(1,j:j+bs))/blockSize);
    end    
    
end

