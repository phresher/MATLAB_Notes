%search for the IF of certain journal with ISSN
A=zeros(722,1);
for i=1:length(qinghua1)
    A(i)= searchImpactFactor(qinghua1{i});
end
xlswrite('Copy_of_qinghua.xls',A, 1,'C2');
