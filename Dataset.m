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
        
        function confusion_matrix = evaluate(self, test_pictures, distance, k)
            confusion_matrix = zeros(10);
            for j = 1:length(test_pictures)
                picture = test_pictures{j};
                predicted = self.classify(picture, distance, k);
                confusion_matrix(picture.real_class+1, predicted+1) = confusion_matrix(picture.real_class+1, predicted+1) + 1;
            end
            confusion_matrix
        end
    end
    
end

