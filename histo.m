function [ F ] = histo( A )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    A = double(A);
    F = zeros(1,128);
    sizeA = size(A);
    w = sizeA(1);  h = sizeA(2);
    for i = 1:w
        for j = 1:h
            p = floor(A(i,j)/2);
            F(1,p+1) = F(1,p+1) + 1;
        end
    end
    F = F/(w*h);
    
%     for i = 0 : 255
%        p =  find(A==i);
%        s = size(p);
%        F(1,i+1) = s(1);
%     end
end





