classdef Euclidean < Distance
    
    properties
    end
    
    methods
        function dis = distance(self, picture1, picture2)
            dis = norm(picture1.descriptor - picture2.descriptor);
        end
    end
end

