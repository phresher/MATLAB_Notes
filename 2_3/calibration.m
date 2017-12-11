% 准备校准图像
numImages = 4;
files = cell(1, numImages);
for iImages = 1:numImages
    files{iImages} = fullfile('homework', sprintf('%d.png', iImages));
end

% 估计摄像机参数
[imagePoints, boardSize] = detectCheckerboardPoints(files);
squareSize = 100; % in millimeters 方格图像实际尺寸
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
cameraParams = estimateCameraParameters(imagePoints, worldPoints);

% 评估矫正的准确性
figure; showReprojectionErrors(cameraParams);
title('检查重投影误差');
