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
eight_dataset = Dataset(train_pictures, EightCC);
thirteen_dataset = Dataset(train_pictures, ThirteenCC);

%Evaluar cada imágen del test
confusion_matrix_5 = fourcc_dataset.evaluate(test_pictures, 'euclidean', 5);
confusion_matrix_10 = fourcc_dataset.evaluate(test_pictures, 'euclidean', 10);
confusion_matrix_15 = fourcc_dataset.evaluate(test_pictures, 'euclidean', 15);
confusion_matrix_20 = fourcc_dataset.evaluate(test_pictures, 'euclidean', 20);