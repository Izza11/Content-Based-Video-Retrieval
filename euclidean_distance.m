function [ euclideanDistance ] = euclidean_distance( input_feature_vector, to_match_feature_vector )
%EUCLIDEAN_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
difference = input_feature_vector - to_match_feature_vector;
square = difference.^2;
summation = sum(square(:));
euclideanDistance = sqrt(summation);
end

