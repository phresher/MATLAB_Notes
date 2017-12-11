% 准备校准图像
numImages = 4;
numLiquidColumn = 8;
files = cell(1, numImages);
for iImages = 1:numImages
    files{iImages} = fullfile(sprintf('%d.png', iImages));
end
% Display one of the calibration images

% 估计摄像机参数
[imagePoints, boardSize] = detectCheckerboardPoints(files);
squareSize = 29; % in millimeters 方格图像实际尺寸
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
cameraParams = estimateCameraParameters(imagePoints, worldPoints);
% Evaluate calibration accuracy.
figure; showReprojectionErrors(cameraParams);
title('检查投影误差');

% 读取要测量的对象的图像
imOrig = imread(files{2});
[im, newOrigin] = undistortImage(imOrig, cameraParams, 'OutputView', 'full');

% 使用图像的 HSV 表示的饱和分量来分割测压管。
imHSV = rgb2hsv(im);
saturation = imHSV(:, :, 2);
t = graythresh(saturation);
imCoin = (saturation > t);
figure; imshow(imCoin, 'InitialMagnification', 'fit');
title('黑白分割图');

% 4检测硬币
% Find connected components.
blobAnalysis = vision.BlobAnalysis('AreaOutputPort', true, ...
    'CentroidOutputPort', false, 'BoundingBoxOutputPort', true, ...
    'MaximumCount',numLiquidColumn,'MinimumBlobArea', 20, ...
    'ExcludeBorderBlobs', true);

%{
AreaOutputPort，CentroidOutputPort，BoundingBoxOutputPort
默认为true，表示会输出[AREA,CENTROID,BBOX]
MajorAxisLengthOutputPort，MinorAxisLengthOutputPort，OrientationOutputPort，EccentricityOutputPort，
EquivalentDiameterSquaredOutputPort，ExtentOutputPort，PerimeterOutputPort，LabelMatrixOutputPort

一些计算结果的输出，默认为false
OutputDataType，默认double，设置输出数据的格式，包括： double, single, or Fixed point
Connectivity，默认8，设置哪些像素点是连接的，可选4和8。你懂的，一个小正方形周围有8个小正方形。
MaximumCount，默认50，解释：Maximum number of labeled regions in each input image（每幅图中最大的区域个数，也就是识别到的运动物体个数）
MinimumBlobArea，默认0，解释：Minimum blob area in pixels（区域最小面积，占多少个像素？）
MaximumBlobArea，默认为最大的整型数intmax('uint32')
Maximum blob area in pixels（区域占的最大面积，单位像素）
以上两个属性可以控制识别到的区域大小，把不想识别到的筛选出去。
ExcludeBorderBlobs，默认false
Exclude blobs that contain at least one border pixel
Set this property to true if you do not want to label blobs that contain at least one border pixel.
排除掉有边界的区域。
    %}
    
[areas, boxes] = step(blobAnalysis, imCoin);
% Sort connected components in descending order by area
[~, idx] = sort(areas, 'Descend');
% Get the two largest components.
boxes = double(boxes(idx(1:numLiquidColumn), :));
% Adjust for coordinate system shift caused by undistortImage
boxes(:, 1:2) = bsxfun(@plus, boxes(:, 1:2), newOrigin);
% 插入测压管标签
imDetectedCoins = insertObjectAnnotation(im, ...
    'rectangle', boxes, 'Liquid column');
figure; imshow(imDetectedCoins, 'InitialMagnification', 'fit');
title('检测液柱');

% 计算 Extrinsics
% Detect the checkerboard.
[imagePoints, boardSize] = detectCheckerboardPoints(im);
% Compute rotation and translation of the camera.
[R, t] = extrinsics(imagePoints, worldPoints, cameraParams);

%测量测压管高度
% Get the top-left and the top-right corners.
for iLiquidColumn = 1:numLiquidColumn
    boxj = double(boxes(iLiquidColumn, :));
    imagePointsLiquidColumn = [boxj(1:2);boxj(1) + boxj(3), boxj(2)];
    % Get the world coordinates of the corners
    worldPointsLiquidColumn = pointsToWorld(cameraParams, R, t, imagePointsLiquidColumn);
    % Compute the diameter of the coin in millimeters.
    d = worldPointsLiquidColumn(2, :) - worldPointsLiquidColumn(1, :);
    diameterInMillimeters = hypot(d(1), d(2));
    fprintf('测量测压管%d的高度= %0.2f mm\n', iLiquidColumn,diameterInMillimeters);
end

