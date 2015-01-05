// calculating information for cell positions in an embryo.

// create a "null embryo" where cells are evenly spaced across the volume.
x = -100:1/100:100;
y = -25:1/400:25;
z = -10:1/1000:10;

// take out potential spatial correlation.
x = randperm(length(x));
y = randperm(length(y));
z = randperm(length(z));
scatter3(x,y,z);

// plot distribution of locations in embryo.
xbin = histfit(x,100,'Gaussian');
ybin = histfit(y,100,'Gaussian');
zbin = histfit(z,100,'Gaussian');

// how to generate a random subsample from data (using peudo-data in x).
x = -12:1/100:12;
y = randperm(length(x));
z = y(:,1:1000);
m = min(x);
n = max(x);
i = 0:1/((length(x)-length(z))):1;
j = i-i;
k = horzcat(z,m,n,j);
hist(k,500)
// histogram gives you a large value for the zero-bin. Extract components of histogram (N,X) and plot on 
// bar graph.
[N,X] = hist(k,500)
N = N(:,4:500);
X = X(:,4:500);
bar(X,N)
// the starting point of thee new vectors for N and X are arbitrary. check to see where the zero bins are 
// classified, and cut from the next bin. N and X need to be the same length.

// calculate information for each dimension. xinfo, yinfo, zinfo are information for three axes (here they 
// are characterized as Hmax).
// for reference sake, xbin, ybin, zbin are the values of N from "bar(X,N)" line of code calculated for the 
// x-, y-, and z-axes.
xsum = xbin/sum(xbin);
ysum = ybin/sum(ybin);
zsum = zbin/sum(zbin);
logxbin = log(xsum);
logybin = log(ysum);
logzbin = log(zsum);
xinf = xsum .* logxbin;
yinf = ysum .* logybin;
zinf = zsum .* logzbin;
xinfo = sum(xinf);
yinfo = sum(yinf);
zinfo = sum(zinf);