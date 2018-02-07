function [ sum_of_abs_difference ] = abs_distance( input_feature_vector, to_match_feature_vector )
%ABS_DISTANCE Summary of this function goes here
%   Detailed explanation goes here

difference = abs(input_feature_vector - to_match_feature_vector);
sum_of_abs_difference = sum(difference(:));



end

