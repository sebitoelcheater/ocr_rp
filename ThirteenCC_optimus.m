classdef ThirteenCC < Concavity
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function [descriptor, concavity_matrix] = describe(self, picture)
            [nrows, ncols] = size(picture.binarized);
            concavity_matrix = zeros(nrows);

            
            p = picture.describe(FourCC);
            binarized = p.binarized;
            fourcc_concavity_matrix = p.concavity_matrix;
            fourcc_descriptor = p.descriptor;
            
            new_descriptor = zeros(1,13);
            
            %Los que chocan en 2 partes:
            % Contar los 0,1 que corresponde al �ndice 1+4 = 5
            new_descriptor(1) = fourcc_descriptor(5+1);

            % Contar los 1,2 que corresponde al �ndice 2+4 = 6
            new_descriptor(2) = fourcc_descriptor(6+1);

            % Contar los 2,3 que corresponde al �ndice 2+8 = 10
            new_descriptor(3) = fourcc_descriptor(10+1);

            % Contar los 3,0 que corresponde al �ndice 8+1 = 9
            new_descriptor(4) = fourcc_descriptor(9+1);

            
            %Los que chocan en 3 partes:
            % Contar los que no chocan en 0, �ndice 1
            new_descriptor(5) = fourcc_descriptor(1+1);

            % Contar los que no chocan en 1, �ndice 4
            new_descriptor(6) = fourcc_descriptor(4+1);

            % Contar los que no chocan en 2, �ndice 2
            new_descriptor(7) = fourcc_descriptor(2+1);

            % Contar los que no chocan en 3, �ndice 8
            new_descriptor(8) = fourcc_descriptor(8+1);

            
            % Iterar sobre los que chocan en las 4 direcciones, �ndice 1+2+4+8 = 15
            fourcc_concavity_matrix(binarized == 0) = 16;
            [rows cols] = find(fourcc_concavity_matrix == 0);
            for i = 1:length(rows)
                r = rows(i);
                c = cols(i);
                subr = r;
                subc = c;
                classified = 0;
                % Recorrer hacia arriba
                while fourcc_concavity_matrix(subr,subc) ~= 16 && ~classified
                    element = fourcc_concavity_matrix(subr,subc);
                    if (element >= 8) % Sale por la izquierda
                        new_descriptor(10) = new_descriptor(10) + 1;
                        classified = 1;

                        break;
                    end
                    subr = subr - 1;
                end
                subr = r;
                subc = c;
                % Recorrer hacia arriba
                while fourcc_concavity_matrix(subr,subc) ~= 16 && ~classified
                    element = fourcc_concavity_matrix(subr,subc);
                    if any(element == [4 5 6 7 12 13 14 15]) % Sale por la derecha
                        new_descriptor(11) = new_descriptor(11) + 1;
                        classified = 1;

                        break;
                    end
                    subr = subr - 1;
                end
                subr = r;
                subc = c;
                % Recorrer hacia abajo
                while fourcc_concavity_matrix(subr,subc) ~= 16 && ~classified
                    element = fourcc_concavity_matrix(subr,subc);
                    if any(element >= 8) % Sale por la izquierda
                        new_descriptor(12) = new_descriptor(12) + 1;
                        classified = 1;

                        break;
                    end
                    subr = subr + 1;
                end
                subr = r;
                subc = c;
                % Recorrer hacia abajo
                while fourcc_concavity_matrix(subr,subc) ~= 16 && ~classified
                    element = fourcc_concavity_matrix(subr,subc);
                    if any(element == [4 5 6 7 12 13 14 15]) % Sale por la derecha
                        new_descriptor(13) = new_descriptor(13) + 1;
                        classified = 1;

                        break;
                    end
                    subr = subr + 1;
                end
                
                
                if ~classified
                    new_descriptor(9) = new_descriptor(9) + 1;

                end
            end
            descriptor = new_descriptor;
        end
    end
end

