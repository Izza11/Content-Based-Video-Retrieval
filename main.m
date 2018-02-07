I = imread('3.jpg');
semantics = ['trees', 'mountains', 'sky', 'people', 'building'];
semantic_feature_vectors = [];
for i = 1 : size(semantics, 2)
    sem = semantics(i);
    for j = 1 : size(annotation_info, 2)
        if find(annotated_info(j).tags == sem)
        frame = read(readerobj(annotated_info(j).frame_num));
        semantic_feature_vectors = vertcat(semantic_feature_vectors, ...
            DCT_feature_vectors(frame));
        end
    end
    for j = 1 : size(annotation_info, 2)
        object = gmdist(semantic_feature_vectors);
        input_image_feature = DCT_feature_vectors(readerobj(annotated_info(j).frame_num));
        probability = pdf(object, input_image_feature);
        Average_probability = avg(probability);
    end
end
DCT_feature_vector(I);
prob = pdf(obj, imblock);