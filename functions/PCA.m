%% Clear workspace and command window
clear; clc;

%% Load hyperspectral dataset
load('data/Botswana.mat');
data = Botswana;

%% Get the size of the hyperspectral cube
[m, n, p] = size(data);  
t = m * n;                

%% Reshape data for PCA
data = reshape(data, t, p);

%% Perform PCA (Principal Component Analysis)
[pc, score, latent, tsquare] = pca(data);

%% Select the first 3 principal components
feature_after_PCA = score(:, 1:3);

%% Reshape back into image format
RES = reshape(feature_after_PCA, m, n, 3);

%% Save the result as an image
% The image is saved in TIFF format as 'BW.tif'.
imwrite(RES, 'BW.tif');
