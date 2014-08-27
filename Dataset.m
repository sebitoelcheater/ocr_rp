classdef Dataset
    
    properties
        pictures
        descriptors
        groups
        concavity
    end
    
    methods
        function self = Dataset(pictures, concavity)
            self.concavity = concavity;
            self.descriptors = [];
            self.groups = [];
            self.pictures = pictures;
            for i = 1:length(self.pictures)
                p = self.pictures{i};
                p = p.describe(concavity);
                self.pictures{end+1} = p;
                self.descriptors = [self.descriptors;p.descriptor];
                self.groups = [self.groups; p.real_class];
                
            end
        end
        
        function group = classify(self, picture, distance, k)
            p = picture.describe(self.concavity);
            group = knnclassify(p.descriptor, self.descriptors, self.groups, k, distance);
        end
        
        function [cm_concavity_5,cm_concavity_10,cm_concavity_15,cm_concavity_20] = evaluate(self, test_pictures, distance)
            cm_concavity_5 = zeros(10);
            cm_concavity_10 = zeros(10);
            cm_concavity_15 = zeros(10);
            cm_concavity_20 = zeros(10);
            for j = 1:length(test_pictures)
                picture = test_pictures{j};
                predicted_5 = self.classify(picture, distance, 5);
                predicted_10 = self.classify(picture, distance, 10);
                predicted_15 = self.classify(picture, distance, 15);
                predicted_20 = self.classify(picture, distance, 20);
                cm_concavity_5(picture.real_class+1, predicted_5+1) = cm_concavity_5(picture.real_class+1, predicted_5+1) + 1;
                cm_concavity_10(picture.real_class+1, predicted_10+1) = cm_concavity_10(picture.real_class+1, predicted_10+1) + 1;
                cm_concavity_15(picture.real_class+1, predicted_15+1) = cm_concavity_15(picture.real_class+1, predicted_15+1) + 1;
                cm_concavity_20(picture.real_class+1, predicted_20+1) = cm_concavity_20(picture.real_class+1, predicted_20+1) + 1;
            end
        end
        function cc13_e_5 = evaluate_best(self, test_pictures, distance)
            cm_concavity_5 = zeros(10);
            cm_concavity_10 = zeros(10);
            cm_concavity_15 = zeros(10);
            cm_concavity_20 = zeros(10);
            for j = 1:length(test_pictures)
                picture = test_pictures{j};
                predicted_5 = self.classify(picture, distance, 5);
                predicted_10 = self.classify(picture, distance, 10);
                predicted_15 = self.classify(picture, distance, 15);
                predicted_20 = self.classify(picture, distance, 20);
                cm_concavity_5(picture.real_class+1, predicted_5+1) = cm_concavity_5(picture.real_class+1, predicted_5+1) + 1;
                cm_concavity_10(picture.real_class+1, predicted_10+1) = cm_concavity_10(picture.real_class+1, predicted_10+1) + 1;
                cm_concavity_15(picture.real_class+1, predicted_15+1) = cm_concavity_15(picture.real_class+1, predicted_15+1) + 1;
                cm_concavity_20(picture.real_class+1, predicted_20+1) = cm_concavity_20(picture.real_class+1, predicted_20+1) + 1;
            end
        end
    end
    
end

