NOTES:

// used data from sample CD20070314_hsp3_a1a, EPIC dataset.
// x,y,z are position data. Normalized by taking the average position of the first cell (number of samples for which there is one timepoint).
* scatter3(x,y,z);
x = x - 16.03;
y = y - 407.67;
z = z - 16.03;
  
// first cell sampled (in this case, P0) is an origin point of near 0,0,0. "Near" because the normalization is done using an average position.
// plot of full dataset gives you an irregular "ball" of positions. Ball approximates the embryo.
* create subsamples of data, for example:
plot3(x(1:500,:),y(1:500,:),z(1:500,:));
sample at intervals of 500 up to 3000.
  
// make animated .gif from saved position graphs. Be sure that the axes are the same on every graph.
// notice that cells do not divide and settle into uniform locations. Can we work out a measure of asymmetry that involves both the number if lineage tree branches at time t and location in pseudo-embryo (e.g. point cloud)?

//create distribution of cell lineage branches at a given timepoint:
x = [timepoints in EPIC data];
[a,b] = hist(x, unique(x));

// how many odd numbered branches do we have at each timepoint (proportion of asymmetric cell divisions)?
c = mod(a,2);
d = sum(c);
e = d/length(a));
  
// for _hsp3_a1a data, this number is 0.372
// calculate Euclidean distance in three-dimensional space (e.g. pseudo-embryo).
y = a(:,3) - 272.67;
x = a(:,2) - 407.67;
z = a(:,1) - 16.03;
d = sqrt((x.^2)+(y.^2)+(z.^2));

// calculate angle for each dimension.
A1 = atan(z./x);
A2 = atan(y./x);
A3 = atan(z./y);

// calculate Normal distribution for each axis.
histfit(x)
histfit(y)
histfit(z)
