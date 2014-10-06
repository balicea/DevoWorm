%% Polar plot details
%% matrix A contains angles (theta) and Euclidean distance (rho).

A(:,1) = atand(AP/LR);
A(:,2) = sqrt(AP^2+LR^2);

theta = A(:,1);
rho = A(:,2);
polar(theta,rho,'o')


%% 3-D spatial plot.
%% matrix A contains three anatomical axes or two anatomical dimensions plus gene expression/extracted measures.

x = A(:,1);
y = A(:,2);
z = A(:,3);
plot3(x,y,z,'o')


%% Principle Component Analysis for gene expression.
%% matrix A contains gene expression data for each cell (zeroes for missing data). Maximum number of genes assayed x %% Number of cells assayed.

[PC, SCORE, LATENT, TSQUARE] = princomp(A);
a = score(A(:,1));
b = score(A(:,2));

%% variables a and b represent PC1 and PC2.

plot(a,b,'o');


%% 3-D graph plotted as an animation.
%% assume x,y,z have been created from data.

h = plot3(NaN,NaN,NaN);
xlim ([min(x) max(x)])
ylim ([min(y) max(y)])
zlim ([min(z) max(z)])
i = 1:length(x);

for k=i;
	plot3(x(k),y(k),z(k),'erase','none','o')
	M(k) = getframe
	pause(0.01)
end
movie(M)

%% "pause 0.01" is the time interval. Adjust to 0.1 if neccessary.
