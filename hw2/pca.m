% Load the dataset from the txt file

load pca_data.txt;

% Copy it to a new variable say A

A = pca_data;

% Mean center the data 

A = center(A);

% Compute covariance matrix 

C = A'*A;

% Find eigenvectors and corresponding eigen values (V,E) of C

[V,E] = eig(C);

% Sort eigenvalues in descending order

[E,i] = sort(diag(E), 'descend');

% Sort the eigenvectors according to corresponding eigenvalues

V = V(:,i);

printf("pc1 = \n")
printf("%f\n",V(:,1));
printf("with e1 = %f\n", E(1));
printf("and pc2 = \n")
printf("%f\n", V(:,2));
printf("with e2 = %f\n", E(2));


% The transformed data obtained after projecting on the principal component vectors
T = A*V;

% Reduce the dimensionality to 1
T = T(:,1);

% points with reduced dimensionality saved to pca_out.txt
save pca_out.txt T;

% Energy retained with dimensionality 1 
e = E(1)/sum(E)*100;

printf("\n%f energy is retained with dimensionality 1\n", e);

%set title "PCA Analysis"
%set xlabel "x"
%set ylabel "y"
plot "pca_data.txt" with points
