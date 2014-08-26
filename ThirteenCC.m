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
            % Contar los que no chocan en 0, índice 1
            new_descriptor(5) = fourcc_descriptor(1+1);
            % Contar los que no chocan en 1, índice 4
            new_descriptor(6) = fourcc_descriptor(4+1);
            % Contar los que no chocan en 2, índice 2
            new_descriptor(7) = fourcc_descriptor(2+1);
            % Contar los que no chocan en 3, índice 8
            new_descriptor(8) = fourcc_descriptor(8+1);
            
            % Iterar sobre los que chocan en las 4 direcciones, índice 1+2+4+8 = 15
            new_concavity_matrix = p.concavity_matrix;
            new_concavity_matrix(binarized == 0) = 16;
            [rows cols] = find(new_concavity_matrix == 0);
            for i = 1:length(rows)
                r = rows(i);
                c = cols(i);
                while new_concavity_matrix(r,c) ~= 16
                    element = new_concavity_matrix(r,c);
                    if (element >= 8) % Sale por la izquierda
                    end
                end
            end
            
            
            
            
            
            

        end
    end
end

