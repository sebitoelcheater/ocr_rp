classdef Manhattan < Distance
    
    properties
    end
    
    methods
        function dis = distance(self, picture1, picture2)
            dis = mandist(picture1.descriptor,picture2.descriptor');
        end
    end
end

