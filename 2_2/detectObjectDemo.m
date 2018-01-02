function detectObjectDemo(dirObject, dirScene, showFlag)
% Demonstrate how to detect an object in a cluttered scene using point feature matching.

% Read and detect local feature points. 
scene = rgb2gray(imread(dirScene));
scenePoints = detectSURFFeatures(scene);
object = rgb2gray(imread(dirObject));
objectPoints = detectSURFFeatures(object);

if showFlag
    figure;
    subplot(1,2,1);
    imshow(object);
    title('Image of the Object');
    subplot(1,2,2);
    imshow(scene);
    title('Image of the Cluttered Scene');
end

% Extract local features. 
[objectFeatures, objectPoints] = extractFeatures(object, objectPoints);
[sceneFeatures, scenePoints] = extractFeatures(scene, scenePoints);

if showFlag
    figure;
    subplot(1,2,1);
    imshow(object);
    title('100 Strongest Feature Points from Object Image');
    hold on;
    plot(selectStrongest(objectPoints, 100));
    subplot(1,2,2);
    imshow(scene);
    title('300 Strongest Feature Points from Scene Image');
    hold on;
    plot(selectStrongest(scenePoints, 300));
end

% Match feature points. 
pairs = matchFeatures(objectFeatures, sceneFeatures, 'Unique', true);
matchedObjectPoints = objectPoints(pairs(:, 1), :);
matchedScenePoints = scenePoints(pairs(:, 2), :);

if showFlag
    figure;
    showMatchedFeatures(object, scene, matchedObjectPoints, ...
        matchedScenePoints, 'montage');
    title('Putatively Matched Points (Including Outliers)');
end

% Locate the object in the scene using putative matches. 
[tform, inlierObjectPoints, inlierScenePoints] = ...
    estimateGeometricTransform(matchedObjectPoints, matchedScenePoints, 'projective');

if showFlag
    figure;
    showMatchedFeatures(object, scene, inlierObjectPoints, ...
        inlierScenePoints, 'montage');
    title('Matched Points (Inliers Only)');
end

objectPolygon = [1, 1;...                           % top-left
    size(object, 2), 1;...                 % top-right
    size(object, 2), size(object, 1);... % bottom-right
    1, size(object, 1);...                 % bottom-left
    1, 1];                   % top-left again to close the polygon

newObjectPolygon = transformPointsForward(tform, objectPolygon);

figure;
imshow(scene);
hold on;
line(newObjectPolygon(:, 1), newObjectPolygon(:, 2), 'Color', 'g');
title('Detected Box');

