n = 10^3;
s = [];
ns = [];
for d = [1,2,5,10,25,50,100]
    % Octave built-in function unifrnd for Uniform Distribution
    % unifrnd(a,b,r,c) - Return a matrix of random samples from the uniform distribution on [a, b]
    A = unifrnd(0,1,n,d);

    ed = pdist(A);
    ned = ed/sqrt(d);

    s = [s;[d std(ed)]];
    ns = [ns;[d std(ned)]];

    [NN,XX] = hist(ed,50);
    [NNN, NXX] = hist(ned,50);

    filename = strcat("dim",num2str(d),".txt");
    nfilename = strcat("ndim",num2str(d),".txt");

    NNT = NN';
    NNNT = NNN';

    save("-ascii", filename,"NNT");
    save("-ascii", nfilename,"NNNT");

end
% std.txt has standard deviation data for part a
save("-ascii","std.txt","s");
% nstd.txt has standard deviation data for part c
save("-ascii","nstd.txt","ns");

