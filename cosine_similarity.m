function [ cosineSimilarity ] = cosine_similarity( input_feature_vector, to_match_feature_vector )
%COSINE_SIMILARITY Summary of this function goes here
%   Detailed explanation goes here
% norm or determinant?
mag_input_vector = norm(input_feature_vector);
mag_to_match_vector = norm(to_match_feature_vector);
numerator = (input_feature_vector .* to_match_feature_vector);
cosineSimilarity = sum(numerator(:)) ...
    /(mag_input_vector*mag_to_match_vector);
end

