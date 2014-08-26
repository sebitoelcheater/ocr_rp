classdef EightCC < Concavity
    %Implementado sólo para fotos cuadradas.
    
    properties
    end
    
%     row = [];
%     for subr = r:c
%         subc = c - (subr-r);
%         row(end+1) = binarized(subr, subc);
%     end
%     row
    
    methods
        function [descriptor, concavity_matrix] = describe(self, picture)
            binarized = picture.binarized;
            [nrows, ncols] = size(binarized);
            
            concavity_matrix = zeros(nrows, ncols);
            ndiagonals = ncols+nrows-1;
            
            % de sur-oeste hacia nor-este
            for i = 1:ndiagonals
                r = min(i, nrows);
                c = max(i-nrows+1, 1);
                for subc = c:r
                    subr = r - (subc-c);
                    if binarized(subr, subc) == 1
                        concavity_matrix(subr, subc) = concavity_matrix(subr, subc) + 1;
                    else
                        break;
                    end
                end
            end
            
            % de nor-este hacia sur-oeste
            for i = 1:ndiagonals
                c = min(i, ncols);
                r = max(i-ncols+1, 1);
                for subr = r:c
                    subc = c - (subr-r);
                    if binarized(subr, subc) == 1
                        concavity_matrix(subr, subc) = concavity_matrix(subr, subc) + 2;
                    else
                        break;
                    end
                end
            end
            
            % de sur-este hacia nor-oeste
            for i = 1:ndiagonals
                c = min(i, ncols);
                r = min(ndiagonals-i+1, ncols);
                for subr = r:-1:max(r-c+1,1)
                    subc = c-(r-subr);
                    if binarized(subr, subc) == 1
                        concavity_matrix(subr, subc) = concavity_matrix(subr, subc) + 4;
                    else
                        break;
                    end
                end
            end
            
            % de nor-oeste hacia sur-este
            for i = 1:ndiagonals
                c = min(i, ncols);
                r = min(ndiagonals-i+1, ncols);
                for subr = max(r-c+1,1):r
                    subc = c-(r-subr);
                    if binarized(subr, subc) == 1
                        concavity_matrix(subr, subc) = concavity_matrix(subr, subc) + 8;
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

