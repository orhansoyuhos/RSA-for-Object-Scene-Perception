clear 
close all

%% Save the lower part of the models as vectors
%% Setting paths
models_raw = [pwd '\models\'];


%% Info
models_name = {'Control Model', 'Object Model', 'Scene Model'};
numMod = size(models_name, 2);

for m = 1:numMod
    
    filename = fullfile([models_raw, models_name{m}]);
    load(filename, 'model');
    
    dissimilarity = model;
    mod(:, :, m) = dissimilarity;
    
end

%% Reshape models (keep lower triangle)
for ii = 1:size(mod, 3)
    
    temp = mod(:, :, ii);
    temp_mod = temp';
    
    for i = 1:size(temp_mod, 1)
        temp_mod(i, i:end) = nan;
    end
    
    temp_lower = temp_mod;
    lower = temp_lower(~isnan(temp_lower));
    lower_models_vect(:, ii) = lower;
end

%% Save models
models = struct;
models.names = models_name;
models.lower_vect = lower_models_vect;

name_file = fullfile([models_raw, 'lowerModelsVect']);
save(name_file, 'models');
