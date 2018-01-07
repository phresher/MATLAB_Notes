function [iTube, waterLevel] = pointsToWaterLevels(worldFeaturePoins, tubeParams)
%
% x = worldFeaturePoins(:,1);
y = worldFeaturePoins(:,2);
% x=x(y<tubeParams.height);
y=y(y<tubeParams.height);
% x=x(y>0);
y=y(y>0);
iTube = 1:length(y);
if isfield(tubeParams, 'waterLevelCorrFactor')
    waterLevel = y*tubeParams.waterLevelCorrFactor(1) ...
        + tubeParams.waterLevelCorrFactor(2);
else
    waterLevel = y;
end