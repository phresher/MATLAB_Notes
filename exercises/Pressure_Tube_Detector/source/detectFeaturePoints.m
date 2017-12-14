function featurePoints = detectFeaturePoints(imageFileName)
%
dataExistFlag = exist('demo.mat', 'file');
if dataExistFlag == 0
    I = imread(imageFileName);
    figure;
    imshow(I);
    hold on
    [x,y] = ginput;
    featurePoints = [x y];
    plot(x, y, 'ro');
    hold off
elseif dataExistFlag == 2
    featurePoints = load('demo.mat', 'featurePoints');
    featurePoints = featurePoints.featurePoints;
else
    error('Unknown Error');
end
