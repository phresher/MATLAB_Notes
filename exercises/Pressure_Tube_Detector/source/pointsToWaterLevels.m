function [iTube, waterLevel] = pointsToWaterLevels(worldFeaturePoins, tubeParams)
%
iTube = round((worldFeaturePoins(:,1)-tubeParams.startPoint) ...
    /tubeParams.interval);
if exist('tubeParams.waterLevelCorrFactor', 'var')
    waterLevel = worldFeaturePoins(:,2)*tubeParams.waterLevelCorrFactor(1) ...
        + tubeParams.waterLevelCorrFactor(2);
else
    waterLevel = worldFeaturePoins(:,2);
end