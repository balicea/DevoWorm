p = which('AT3_1m4_01.tif');
filelist = dir([fileparts(p) filesep 'AT3_1m4_*.tif']);
fileNames = {filelist.name}'
fileNames = 

    'AT3_1m4_01.tif'
    'AT3_1m4_02.tif'
    'AT3_1m4_03.tif'
    'AT3_1m4_04.tif'
    'AT3_1m4_05.tif'
    'AT3_1m4_06.tif'
    'AT3_1m4_07.tif'
    'AT3_1m4_08.tif'
    'AT3_1m4_09.tif'
    'AT3_1m4_10.tif'

I = imread(fileNames{1});
imshow(I)
text(size(I,2),size(I,1)+15, ...
    'Image files courtesy of Alan Partin', ...
    'FontSize',7,'HorizontalAlignment','right');
text(size(I,2),size(I,1)+25, ...
    'Johns Hopkins University', ...
    'FontSize',7,'HorizontalAlignment','right');
segmentedCells = batchDetectCells(I);
figure, imshow(segmentedCells)
type batchDetectCells

function segmentedCells = batchDetectCells(I)
%batchDetectCells Algorithm to detect cells in image.
%   segmentedCells = batchDetectCells(I) detects cells in the cell
%   image I and returns the result in segmentedCells.
%
%   Supports batch processing example, BatchProcessImageExample. 

%   Copyright 2005-2013 The MathWorks, Inc.

% Use |edge| and the Sobel operator to calculate the threshold
% value. Tune the threshold value and use |edge| again to obtain a
% binary mask that contains the segmented cell.

[~, threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BW = edge(I,'sobel', threshold * fudgeFactor);

se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWdilate = imdilate(BW, [se90 se0]);
BWnobord = imclearborder(BWdilate, 4);
BWopen = bwareaopen(BWnobord,200);
BWclose = bwmorph(BWopen,'close');
BWfill = imfill(BWclose, 'holes');
BWoutline = bwperim(BWfill);
segmentedCells = I;
segmentedCells(BWoutline) = 255;

type batchProcessFiles

function segmentedCellSequence = batchProcessFiles(fileNames,fcn)
%batchProcessFiles Process image files.
%   SEQUENCE = batchProcessFiles(FILENAMES,FCN) loops over all the files
%   listed in FILENAMES, calls the function FCN on each of them, and combines
%   the results in SEQUENCE. FCN is a function handle for a function with
%   signature: B = FCN(A).
%
%   Supports batch processing example, BatchProcessImageExample.

%   Copyright 2007-2013 The MathWorks, Inc.

I = imread(fileNames{1});

[mrows,ncols] = size(I);
nImages = length(fileNames);

segmentedCellSequence = zeros(mrows,ncols,nImages,class(I));

parfor (k = 1:nImages)    

    I = imread(fileNames{k});
    segmentedCellSequence(:,:,k) = fcn(I);     %#ok<PFBNS> % 'fcn' is not an array but a function handle. The Code Analyzer warning is not relevant here.  
    
end

pool = parpool

segmentedCellSequence = batchProcessFiles(fileNames,@batchDetectCells);

delete(pool);

implay(segmentedCellSequence)

