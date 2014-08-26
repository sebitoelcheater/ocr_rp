classdef FourCC < Concavity
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function [descriptor, concavity_matrix] = describe(self, picture)
            binarized = picture.binarized;
            [nrows, ncols] = size(binarized);
            
            concavity_matrix = zeros(nrows, ncols);
            
            % de arriba hacia abajo
            for c = 1:ncols
                for r = 1:nrows
                    if binarized(r,c) == 1
                        concavity_matrix(r,c) = concavity_matrix(r,c) + 1;
                    else
                        break;
                    end
                end
            end
            % de abajo hacia arriba
            for c = 1:ncols
                for r = nrows:-1:1
                    if binarized(r,c) == 1
                        concavity_matrix(r,c) = concavity_matrix(r,c) + 2;
                    else
                        break;
                    end
                end
            end
            % de izquierda hacia derecha
            for r = 1:nrows
                for c = 1:ncols
                    if binarized(r,c) == 1
                        concavity_matrix(r,c) = concavity_matrix(r,c) + 4;
                    else
                        break;
                    end
                end
            end
            % de derecha hacia izquierda
            for r = 1:nrows
                for c = ncols:-1:1
                    if binarized(r,c) == 1
                        concavity_matrix(r,c) = concavity_matrix(r,c) + 8;
                    else
                        break;
                    end
                end
            end
            
            descriptor = zeros(1,16);
            for i = 1:16
                descriptor(i) = sum(sum(concavity_matrix == i-1));
            end

        end
    end
end

