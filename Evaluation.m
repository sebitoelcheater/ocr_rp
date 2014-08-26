classdef Evaluation
    properties
        confusion_matrix
    end 

    methods
        function self = Evaluation(test_pictures, dataset)
            for k = 1:length(test_pictures)
                picture = test_pictures{k};
                predicted = dataset.classify(picture, distance, 20);
            end
        end
        function self = evaluate(self, distance)
    end
end

% Hacer un vector para cada imagen, que en caso de 4cc, será de dimensión 16
% (4^2). Luego, cuando quiera yo comparar una nueva imagen, calculo su
% vector histograma (descriptor) y lo comparo con L1 y L2 con todo el
% dataset de entrenamiento. Luego, veo los "K" más cercanos.

%Lo de la grilla, es divir, por ejemplo, en 4 imagenes, calcular histograma
%para cada grilla, concatenarlos y me resultará un nuevo descriptor desde
%el cual debo trabajar.