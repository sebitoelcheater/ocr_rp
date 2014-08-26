classdef ThirteenCC < Concavity
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function [descriptor, concavity_matrix] = describe(self, picture)
            p = picture.describe(FourCC);
            binarized = p.binarized;
            fourcc_descriptor = p.descriptor;
            new_descriptor = zeros(1,13);
            %Los que chocan en 2 partes:
            % Contar los 0,1 que corresponde al índice 1+4 = 5
            new_descriptor(1) = fourcc_descriptor(5+1);
            % Contar los 1,2 que corresponde al índice 2+4 = 6
            new_descriptor(2) = fourcc_descriptor(6+1);
            % Contar los 2,3 que corresponde al índice 2+8 = 10
            new_descriptor(3) = fourcc_descriptor(10+1);
            % Contar los 3,0 que corresponde al índice 8+1 = 9
            new_descriptor(4) = fourcc_descriptor(9+1);
            
            %Los que chocan en 3 partes:
            % Contar los que no chocan en 0, índice 8+2+4 = 14
            new_descriptor(5) = fourcc_descriptor(14+1);
            % Contar los que no chocan en 1, índice 2+1+8 = 11
            new_descriptor(6) = fourcc_descriptor(11+1);
            % Contar los que no chocan en 2, índice 8+4+1 = 13
            new_descriptor(7) = fourcc_descriptor(13+1);
            % Contar los que no chocan en 3, índice 1+2+4 = 7
            new_descriptor(8) = fourcc_descriptor(7+1);
            
            % Iterar sobre los que chocan en las 4 direcciones.
            
            
            
            
            

        end
    end
end

