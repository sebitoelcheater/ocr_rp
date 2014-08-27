conc = FourCC;
i = 3;
name = 'img004-00004.png';
p = Picture(sprintf('digitos/train/digit_%d/%s',i,name));
p = p.describe(conc);
imshow(label2rgb(p.concavity_matrix+(p.binarized==0)*20))

