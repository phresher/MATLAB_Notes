for algorithm = {'insert' 'selection' 'heap'}
    A = randi(100, [1,100]);
    A = mySort(A, char(algorithm));
    figure
    plot(A,'ro');
    title([char(algorithm) ' selection']);
end