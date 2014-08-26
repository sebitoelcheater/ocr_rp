%# image size
sz = [128,128];

%# training images
numTrain = 200;

for file = files'
    p = Picture(strcat('digitos/test/digit_0/',file.name), 0);
    concavity = FourCC;
    p = p.describe(concavity);
    pictures{end+1} = p;
end


trainData = zeros(numTrain,prod(sz));
for i=1:numTrain
    img = imread( sprintf('digitos/train/image_%03d.jpg',i) );
    trainData(i,:) = img(:);
end

%# testing images
numTest = 200;
testData = zeros(numTest,prod(sz));
for i=1:numTest
    img = imread( sprintf('test/image_%03d.jpg',i) );
    testData(i,:) = img(:);
end

%# target class (I'm just using random values. Load your actual values instead)
trainClass = randi([1 5], [numTrain 1]);
testClass = randi([1 5], [numTest 1]);

%# compute pairwise distances between each test instance vs. all training data
D = pdist2(testData, trainData, 'euclidean');
[D,idx] = sort(D, 2, 'ascend');

%# K nearest neighbors
K = 5;
D = D(:,1:K);
idx = idx(:,1:K);

%# majority vote
prediction = mode(trainClass(idx),2);

%# performance (confusion matrix and classification error)
C = confusionmat(testClass, prediction);
err = sum(C(:)) - sum(diag(C))