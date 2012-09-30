g = 10^3;
t = 500;
n = 10^2;


O = [];
for k=[10:60]
    % A uniform random dataset of size g X k
    A = unifrnd(0,1,g,k);

    % Divided into k equal groups of size g
    A = reshape(A, k, g);

    % Total size of the dataset
    N = g*k;

    % B is a vector of whole dataset
    B = reshape(A,N,1);

    s = 0;
    for t1=[1:t]

        % C is the a vector of size n with values taken randomly in 1 to N
        % It is just a vector of indices of the dataset
        C = randi (N, n, 1);

        % D is the sample 
        D = B(C,:);

        % s contains the index of the sample elements in A
        [tf,s_idx] = ismember (D,B);

        % Zero Matrix of size same as A
        Z = zeros(k,g);

        % Set the corresponding indices of Z to 1 from where the sample elements were chosen
        Z(s_idx) = 1;

        % Check if the sample contains one representative from each group
        s = s + all(any(Z'));

    end
    O = [O;[k s/t]];
end
save "k.txt" O



