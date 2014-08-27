train_pictures = {};
test_pictures = {};
% Cargar train_pictures
for i = 0:9
    files = dir(sprintf('digitos/train/digit_%i/*.png',i));
    for file = files'
        p = Picture(sprintf('digitos/train/digit_%d/%s',i,file.name));
        p.real_class = i;
        train_pictures{end+1} = p;
    end
end

% Cargar test_pictures
for i = 0:9
    files = dir(sprintf('digitos/test/digit_%i/*.png',i));
    for file = files'
        p = Picture(sprintf('digitos/test/digit_%d/%s',i,file.name));
        p.real_class = i;
        test_pictures{end+1} = p;
    end
end

% Crear el dataset de que describe a las imágenes con cada método de
% descripción de concavidad
fourcc_dataset = Dataset(train_pictures, FourCC);
% eight_dataset = Dataset(train_pictures, EightCC);
% thirteen_dataset = Dataset(train_pictures, ThirteenCC);
'lol'
%Evaluar cada imágen del test
% [cm_4cc_5_e,cm_4cc_10_e,cm_4cc_15_e,cm_4cc_20_e] = fourcc_dataset.evaluate(test_pictures, 'euclidean')
[cm_4cc_5_m,cm_4cc_10_m,cm_4cc_15_m,cm_4cc_20_m] = fourcc_dataset.evaluate(test_pictures, 'cityblock')
% [cm_8cc_5_e,cm_8cc_10_e,cm_8cc_15_e,cm_8cc_20_e] = eight_dataset.evaluate(test_pictures, 'euclidean')
% [cm_8cc_5_m,cm_8cc_10_m,cm_8cc_15_m,cm_8cc_20_m] = eight_dataset.evaluate(test_pictures, 'cityblock')
% [cm_13cc_5_e,cm_13cc_10_e,cm_13cc_15_e,cm_13cc_20_e] = thirteen_dataset.evaluate(test_pictures, 'euclidean')
% [cm_13cc_5_m,cm_13cc_10_m,cm_13cc_15_m,cm_13cc_20_m] = thirteen_dataset.evaluate(test_pictures, 'cityblock')