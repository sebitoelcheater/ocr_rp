function descriptor = describe(self, picture)
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
            

            
            %Iterar desde el lado superior
            for c = 1:ncols
                inverted_c = (ncols-c+1);
                top_crushed = 0;
                bottom_crushed = 0;
                left_crushed = 0;
                rigth_crushed = 0;
                for r = 1:nrows
                    inverted_r = (nrows-r+1);
                    
                    top_r = r; top_c = c;
                    bottom_r = inverted_r; bottom_c = c;
                    left_r = c; left_c = r;
                    rigth_r = c; rigth_c = inverted_r;
                    
                    top_cell = binarized(top_r,top_c);
                    bottom_cell = binarized(bottom_r,bottom_c);
                    left_cell = binarized(left_r,left_c);
                    rigth_cell = binarized(rigth_r,rigth_c);

                    [top_crushed, concavity_matrix] = self.eval_crush(concavity_matrix, top_cell, top_r, top_c, top_crushed, 1);
                    [bottom_crushed, concavity_matrix] = self.eval_crush(concavity_matrix, bottom_cell, bottom_r, bottom_c, bottom_crushed, 4);
                    [left_crushed, concavity_matrix] = self.eval_crush(concavity_matrix, left_cell, left_r, left_c, left_crushed, 8);
                    [rigth_crushed, concavity_matrix] = self.eval_crush(concavity_matrix, rigth_cell, rigth_r, rigth_c, rigth_crushed, 2);
                end
            end
            descriptor = concavity_matrix;