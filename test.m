i = 0;
name = 'img001-00003.png';
p = Picture(sprintf('digitos/train/digit_%d/%s',i,name));
p = p.describe(conc);
imshow(label2rgb(p.concavity_matrix))