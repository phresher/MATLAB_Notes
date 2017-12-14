% function demo
% Read the water level in pressure tubes with the test data.
% todos:
% 1. replace the calibration image set with checkerboard images.
% 2. add the experiment images with wood granuals.
% 3. develop the algorithm used in detectFeaturePoints and test it with the
% experiment images above.

addpath('source');
addpath('data');
%% calibration
% the images should be replaced by checherboard images.
images = imageSet(fullfile('images','calibration'));
imageFileNames = images.ImageLocation;
% the imagePoints and worldPoints should be replaced.
[imagePoints,worldPoints] = generatePointPairs(imageFileNames);
params = estimateCameraParameters(imagePoints,worldPoints, ...
    'ImageSize',[3968,2240]);
% check reprojection errors
showReprojectionErrors(params);
% check camera positions
figure;
showExtrinsics(params, 'PatternCentric');
% check reprojected points
% figure;
% imshow(imageFileNames{1});
% hold on;
% plot(imagePoints(:,1,1), imagePoints(:,2,1),'go');
% plot(params.ReprojectedPoints(:,1,1),params.ReprojectedPoints(:,2,1),'r+');
% legend('Detected Points','ReprojectedPoints');
% hold off;
%% detection and recognition
featurePoints = detectFeaturePoints(imageFileNames{1});
% featurePoints = undistortPoints(featurePoints,params);
images = imageSet(fullfile('images','tubes'));
imageFileNames = images.ImageLocation;
[imagePoints,worldPoints] = generatePointPairs(imageFileNames);
[R,t] = extrinsics(imagePoints(:,:,1),worldPoints,params); % !!
worldFeaturePoins = pointsToWorld(params,R,t,featurePoints);
%
tubeParams.startPoint = 25;
tubeParams.interval = 19;
[iTube, waterLevel] = pointsToWaterLevels(worldFeaturePoins, tubeParams);
figure;
plot(iTube, waterLevel, 'ro');
position = [featurePoints(:,1,1) - 10 ...
    featurePoints(:,2,1) - 5 ...
    20*ones(size(featurePoints, 1),1) ...
    10*ones(size(featurePoints, 1),1)];
RGB = imread(images.ImageLocation{1});
RGB = insertObjectAnnotation(RGB,'rectangle',position,waterLevel);
imshow(RGB);
