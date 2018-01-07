% Read water level in pressure tubes with the test data.

addpath('source');
addpath('data');
dataExistFlag = exist('demo.mat', 'file');
%% calibration
% the images should be replaced by checherboard images.
images = imageSet(fullfile('images','calibration'));
imageFileNames = images.ImageLocation;
% the imagePoints and worldPoints should be replaced.
[checkerboardImagePoints, boardSize] = detectCheckerboardPoints(imageFileNames);
squareSizeInMM = 61;
checkerboardWorldPoints = generateCheckerboardPoints(boardSize,squareSizeInMM);
params = estimateCameraParameters(checkerboardImagePoints, ...
    checkerboardWorldPoints, 'ImageSize',[5472,3648]);
% check reprojection errors
showReprojectionErrors(params);
% check camera positions
figure;
showExtrinsics(params, 'PatternCentric');
% check reprojected points
figure;
imshow(imageFileNames{1});
hold on;
plot(checkerboardImagePoints(:,1,1), checkerboardImagePoints(:,2,1),'go');
plot(params.ReprojectedPoints(:,1,1),params.ReprojectedPoints(:,2,1),'r+');
legend('Detected Points','ReprojectedPoints');
hold off;
%% detection and recognition
tubeImages = imageSet(fullfile('images','tubes'));
tubeImageFileNames = tubeImages.ImageLocation;
I = imread(tubeImageFileNames{1});
% [corrI, ~] = undistortImage(I,params);
% tic
featurePoints = detectFeaturePoints(I);
% toc
if dataExistFlag == 0
    [tubeImagePoints, tubeWorldPoints] = generatePointPairs(tubeImageFileNames);
else
    load('demo.mat', 'tubeImagePoints', 'tubeWorldPoints');
end
[R,t] = extrinsics(tubeImagePoints,tubeWorldPoints,params); % !!
worldFeaturePoints = pointsToWorld(params,R,t,featurePoints);
% select valid water levels and correct
tubeParams.startPoint = 5;
tubeParams.interval = 18;
tubeParams.height = 1000;
tubeParams.waterLevelCorrFactor = [1 17];
[iTube, waterLevel] = pointsToWaterLevels(worldFeaturePoints, tubeParams);
%% error analysis
if dataExistFlag ~= 0
    load('demo.mat', 'waterLevelByRuler')
    figure;
    plot(iTube, waterLevel, 'r.', iTube, waterLevelByRuler, 'bo');
    legend('by computer vision','by ruler');
    xlabel('index of piezometer tubes');
    ylabel('water level (mm)');
end