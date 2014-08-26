classdef Picture
    properties
        binarized
        image
        descriptor
        concavity_matrix
        real_class
    end 

    methods
        function self = Picture(path)
            self.image = imread(path);
            self.binarized = im2bw(self.image);
        end
        
        %obtener descriptor
        function self = describe(self, concavity)
            [self.descriptor, self.concavity_matrix] = concavity.describe(self);
        end
        
        function group = classify(self,dataset, distance, k)
            group = dataset.classify(self, distance, k);
        end
    end
end

% Hacer un vector para cada imagen, que en caso de 4cc, será de dimensión 16
% (4^2). Luego, cuando quiera yo comparar una nueva imagen, calculo su
% vector histograma (descriptor) y lo comparo con L1 y L2 con todo el
% dataset de entrenamiento. Luego, veo los "K" más cercanos.

%Lo de la grilla, es divir, por ejemplo, en 4 imagenes, calcular histograma
%para cada grilla, concatenarlos y me resultará un nuevo descriptor desde
%el cual debo trabajar.