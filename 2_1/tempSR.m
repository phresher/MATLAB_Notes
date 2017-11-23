startup;
filePath.dataPath    = 'data\User';
filePath.imgFileName = 'buildings.jpg';
filePath.filePath.resLvlPath = 'data\User_lvl';
opt = sr_init_opt(8);
imgHiRes = sr_demo(filePath, opt);
imgLowRes = imread([filePath.dataPath '\' filePath.imgFileName]);
subplot(1,2,1);imshow(imgLowRes);subplot(1,2,2);imshow(imgHiRes);