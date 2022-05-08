clear
close all

%% Choose the trained model
trainedOn = 'COCOpascal'; % 'Imagenet' or 'Places365' or 'COCOpascal'
network = 'fcnResnet50'; % 'Alexnet' or 'Resnet50' or 'fcnResnet50'

%% Compute RSA
mod_path = [pwd '\models\'];

models_name = {'Control Model', 'Object Model', 'Scene Model'};
DNN_path = [pwd, '\DNN_features\'];

%% Load models 
nMod = size(models_name, 2);
models = [];

for i = 1:nMod
    
    name_file = fullfile([mod_path, models_name{i}, '.mat']);
    load(name_file, 'model');
    
    % lower part vector
    temp = model;
    for k = 1:size(temp, 2)
       temp(1:k, k) = NaN; 
    end
    
    upper = temp(~isnan(temp));
    upper_models_vect(:, i) = upper;
    
end


%% Load DNN models
trained_model = [trainedOn '_' network]; % e.g. 'ImagenetAlexnet' or 'Places365Alexnet'
name_file = fullfile([DNN_path, trained_model, '_RDM']);
load(name_file, 'dnn');

dnn_vect = dnn.rdm;

%% Correlation between DNN_features and Models.

RSA_parcorr = partialcorri(dnn_vect, upper_models_vect, 'Type', 'Pearson');
RSA_fisher_parcorr = atanh(RSA_parcorr);

plot(RSA_fisher_parcorr)
legend(models_name)
ylabel('Pearson ParCorr - Z');
xlabel([network '(' trainedOn ')' ' Layers']);
title([network '(' trainedOn ')'], 'FontSize', 18);
set(gcf, 'Position', get(0, 'Screensize'));

ylim([-0.05 0.2]);
if strcmp(network, 'Resnet50')
    xticks(1:6);
end

results_path = fullfile(pwd, '\figures\');
name_file = [network '(' trainedOn ')'];
print(gcf, [results_path name_file '.png'], '-dpng','-r250');
close all
