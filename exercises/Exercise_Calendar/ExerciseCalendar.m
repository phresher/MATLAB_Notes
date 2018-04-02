load('imageSet.mat');
targetMonth = 3;
dateSet = calendar(2018,targetMonth);

journal = ...
    webread('https://raw.githubusercontent.com/forest512/EveryDaySport/patch-1/table/2018/exerciseRecord-forest.md');

terms = cell2mat(regexp(journal, '#### ((?:.|\n)*?)\[x\]', 'match'));
punchedDate = datevec(regexp(terms, '\d{4}\.\d{2}\.\d{2}', 'match'), 'yyyy.mm.dd');
punchedDate = punchedDate(punchedDate(:,2)==targetMonth,:);

I = true(900,1600);
I(:, 1:550) = [imageSet.month; imageSet.logo];
I(131:230, 551:1460) = imageSet.week;
for i = 1:6
    for j = 1:7
        if dateSet(i,j) == 0
            continue;
        end
        if ismember(dateSet(i,j), punchedDate(:,3))
            I(251+100*(i-1):250+100*i, 551+130*(j-1):550+130*j) ...
                = imageSet.yes{dateSet(i,j)};
        else
            I(251+100*(i-1):250+100*i, 551+130*(j-1):550+130*j) ...
                = imageSet.no{dateSet(i,j)};
        end
    end
end

imshow(I);
imwrite(I,'calendar.jpeg');