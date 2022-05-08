addpath(genpath('C:/Users/ASUS/Desktop/MATLAB/CoSMoMVPA-master')); 

%% For Alexnet; Val set
clear
format long

%% Please SELECT !!
dataset = 'Places365'; % 'Imagenet' or 'Places365'

name_dnn = 'Alexnet'; % fixed
idx_layer = 8; % fixed
k = 0; % fixed

%% Load features from python script
% basic info
alexnet_layers = 8;
n_val = 64+64+64;

% either imagenet or places365 trained
% load the features
if strcmp(dataset, 'Imagenet')
    imagenet_alexnet = load('..\Python_extractFeatures\resultDic\RSA_resultDic_imagenet_alexnet.mat');
    results_alexnet = imagenet_alexnet;
elseif strcmp(dataset, 'Places365')
    places365_alexnet = load('..\Python_extractFeatures\resultDic\RSA_resultDic_places365_alexnet.mat');
    results_alexnet = places365_alexnet;
end

%% Compute RDM for deepnn
N_layer = alexnet_layers;

% make features flat for each sample
AlexnetLayer_samples = cell(1,N_layer);
fns = fieldnames(results_alexnet);

for ii = 3:N_layer+2
    tmp_array = results_alexnet.(fns{ii});
    AlexnetLayer_samples{ii-2} = reshape(tmp_array, n_val, []);
end

dnn = struct;
ds_dnn = struct;
ds_dsm_unflatten = zeros(n_val, n_val, N_layer);

for i = 1:N_layer
    
    tmp_later = AlexnetLayer_samples{i};
    
    % construct ds
    ds_dnn.samples = tmp_later;
    ds_dnn.sa.targets = 1:n_val;
    
    % compute RDM
    ds_dsm = cosmo_dissimilarity_matrix_measure(ds_dnn, 'metric', 'correlation', 'center_data', true);
    [samples, labels, values] = cosmo_unflatten(ds_dsm, 1, 'set_missing_to', NaN);
    ds_dsm_unflatten(:,:,i) = samples;
    
    dnn.rdm(:,i) = ds_dsm.samples;
    dnn.unflatten{i} = samples;
    
end
dnn.layer = {fns{3:end}};
dnn.name = name_dnn;

results_path = fullfile(pwd, '\DNN_features\');
mkdir(results_path);
name_file = fullfile([results_path, dataset, '_', name_dnn, '_RDM']);
save(name_file, 'dnn');

%% Figure
% All layers
figure;

n = length(dnn.layer);
tmp = divisors(n);
max_d = max(tmp(1:end-1));

for i = 1:size(dnn.unflatten, 2)
    
    tmp_mat = dnn.unflatten{i};
    tmp_mat(:,:,2) = tmp_mat';
    rdm_mat = nansum(tmp_mat, 3);
    
    subplot(max_d, n/max_d, i);
    imagesc(rdm_mat)
    
    axis equal tight
    axis on
    yticks([0:32:n_val-32])
    xticks([0:32:n_val-32])
    ynames = ["----------", "objects", "----------", "both", "----------", "scenes"];
    xnames = ["I", "obj", "I", "both", "I", "sce"];
    yticklabels(ynames)
    xticklabels(xnames)
    
    set(gcf, 'color', 'w');
    
    title(dnn.layer{i});
    
    hold on
end

% save figure
set(gcf, 'Position', get(0, 'Screensize'));
results_path = fullfile(pwd, '\figures\');
name_file = [dataset,  '_', name_dnn, '_RDM'];
print(gcf, [results_path name_file '.png'], '-dpng','-r250');
close all

% The final layer
figure;

tmp_mat = dnn.unflatten{idx_layer+k};
tmp_mat(:,:,2) = tmp_mat';
rdm_mat = nansum(tmp_mat, 3);

imagesc(rdm_mat)

axis equal tight
axis on
yticks([0:32:n_val-32]);
xticks([0:32:n_val-32]);
ynames = ["----------", "objects", "----------", "both", "----------", "scenes"];
xnames = ["I", "objects", "I", "both", "I", "scenes"];
yticklabels(ynames)
xticklabels(xnames)

set(gcf, 'color', 'w');
title(dnn.layer{idx_layer+k});

% save figure
set(gcf, 'Position', get(0, 'Screensize'));
results_path = fullfile(pwd, '\figures\');
name_file = [dataset,  '_', name_dnn, '_', dnn.layer{idx_layer+k} '_RDM'];
print(gcf, [results_path name_file '.png'], '-dpng','-r250');
close all