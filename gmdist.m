function [ gmm ] = gmdist( feature_vector, tag )
%GMDIST Summary of this function goes here
%   Detailed explanation goes here
size(feature_vector)
% gmm = gmdistribution.fit(feature_vector,2);
str = strcat('Calculating GMM of ', tag)
options = statset('Display','off');
gmm = gmdistribution.fit(feature_vector,16,'Options',options, 'Regularize', 1e-5);

save(strcat(tag, '.mat'), 'gmm');

end

