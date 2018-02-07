function [ finalDCT ] = DCT_feature_vector( image )
convertedImage = rgb2gray((image));
% imshow(convertedImage);

% figure;
fun = @(block_struct) dct2(block_struct.data);
blockSize = [16 16];

image_DCT = blockproc(convertedImage, blockSize, fun);
% imshow(image_DCT);
finalDCT = im2col(image_DCT, blockSize, 'distinct');
% obj = gmdist(finalDCT);

end

