classdef ThirteenCC22 < Concavity
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function [descriptor, concavity_matrix] = describe(self, picture)
            conc = ThirteenCC
            [nrows, ncols] = size(picture.binarized);
           [descriptor13cc, concavity_matrix] = conc.describe(picture);
           
           cx = 2;
            cy = 2;
            descriptor = zeros(1,cx*cy*13);
            k = 0;
            for x = 1:cx
                for y = 1:cy 
                    for i = 1:13
                        descriptor(1,i+(k*13)) = sum(sum(concavity_matrix(1+(x-1)*nrows/cx:x*nrows/cx,1+(y-1)*ncols/cy:y*ncols/cy) == i-1));
                    end
                k = k+1;
                end
            end
           
        end
    end
end

