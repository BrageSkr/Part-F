clc;
clear all;
close all;
Dataset = zeros(1001,4);%
Dataset(:,1)=0 + (0.7-0) .* rand(1001,1);% between 0-10 increment by 0.1
Dataset(:,2)=0 + (1-0) .* rand(1001,1);
Dataset(:,3)=0 + (1-0) .* rand(1001,1);
fis = readfis('systemFIS');

Dataset(:,4)=evalfis(fis,[Dataset(:,1) Dataset(:,2) Dataset(:,3)]);

n = size(Dataset, 1); % Get the number of rows
shuffledIndices = randperm(n); % Generate random permutation of row indices
shuffledData = Dataset(shuffledIndices, :); % Reorder the dataset based on the random permutation

trainRatio = 0.7; % 70% for training set
splitPoint = round(n * trainRatio); % Calculate the split point

trainData = shuffledData(1:splitPoint, :); % Training set (70%)
testData = shuffledData(splitPoint+1:end, :); % Test set (30%)
%%

DatasetOutRange = zeros(300,4);%
DatasetOutRange(:,1)=0 + (1.2-0) .* rand(300,1);
DataDatasetOutRangeset(:,2)=0 + (1.4-0) .* rand(300,1);
DatasetOutRange(:,3)=0 + (1.4-0) .* rand(300,1);
fis = readfis('systemFIS');

DatasetOutRange(:,4)=evalfis(fis,[DatasetOutRange(:,1) DatasetOutRange(:,2) DatasetOutRange(:,3)]);
neuroFis = readfis('neuroDes');
output_values = evalfis(neuroFis,[DatasetOutRange(:,1) DatasetOutRange(:,2) DatasetOutRange(:,3)] );
target_values = DatasetOutRange(:,4);% Load or define the target values

% Calculate mean
mean_value = mean(output_values)

% Calculate error
error = output_values - target_values;

% Calculate mean squared error (MSE)
mse = mean(error.^2)
std_value = std(error)

% Calculate root mean squared error (RMSE)
rmse = sqrt(mean(error.^2))
