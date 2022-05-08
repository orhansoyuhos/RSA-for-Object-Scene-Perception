close all
clear

%% Generate the control and two alternative models
%% Setting path
models_path = [pwd '\models\'];
results_path = fullfile(pwd, '\figures\');
mkdir(models_path)

n = 64; % fixed
disp = 1;
%% Control model
pair = 'Control Model';

model = ones(3*n,3*n);
model(1:n, 1:n) = zeros(n,n);
model(n+1:2*n, n+1:2*n) = zeros(n,n);
model(n+1:2*n, n+1:2*n) = zeros(n,n);
model(2*n+1:3*n, 2*n+1:3*n) = zeros(n,n);

for i = 1:size(model,1)
    model(i, i) = 0;
end

if disp == 1
    figure;
    imagesc(model)
    title(pair);
    
    colorbar('Ticks',[0,1], 'TickLabels', {'Sim (0)','Dissim (1)'});
    axis equal tight
    axis on
    yticks([0:32:n*3-32]);
    xticks([0:32:n*3-32]);
    ynames = ["----------", "objects", "----------", "both", "----------", "scenes"];
    xnames = ["I", "objects", "I", "both", "I", "scenes"];
    yticklabels(ynames)
    xticklabels(xnames)
    
    set(gcf, 'color', 'w');
    
    set(gcf, 'Position', get(0, 'Screensize'));
    print(gcf, [results_path pair '.png'], '-dpng','-r250');
    close all
end

save([models_path pair], 'model');

%% Object model
pair = 'Object Model';

model = ones(3*n,3*n);
model(1:n*2, 1:n*2) = zeros(n*2,n*2);
model(n*2+1:3*n, n*2+1:3*n) = zeros(n,n);

for i = 1:size(model,1)
    model(i, i) = 0;
end

if disp == 1
    figure;
    imagesc(model)
    title(pair);
    
    colorbar('Ticks',[0,1], 'TickLabels', {'Sim (0)','Dissim (1)'});
    axis equal tight
    axis on
    yticks([0:32:n*3-32]);
    xticks([0:32:n*3-32]);
    ynames = ["----------", "objects", "----------", "both", "----------", "scenes"];
    xnames = ["I", "objects", "I", "both", "I", "scenes"];
    yticklabels(ynames)
    xticklabels(xnames)
    
    set(gcf, 'color', 'w');
    
    set(gcf, 'Position', get(0, 'Screensize'));
    print(gcf, [results_path pair '.png'], '-dpng','-r250');
    close all
end

save([models_path pair], 'model');

%% Scene model
pair = 'Scene Model';

model = ones(3*n,3*n);
model(1:n, 1:n) = zeros(n,n);
model(n+1:3*n, n+1:3*n) = zeros(n*2,n*2);

for i = 1:size(model,1)
    model(i, i) = 0;
end

if disp == 1
    figure;
    imagesc(model)
    title(pair);
    
    colorbar('Ticks',[0,1], 'TickLabels', {'Sim (0)','Dissim (1)'});
    axis equal tight
    axis on
    yticks([0:32:n*3-32]);
    xticks([0:32:n*3-32]);
    ynames = ["----------", "objects", "----------", "both", "----------", "scenes"];
    xnames = ["I", "objects", "I", "both", "I", "scenes"];
    yticklabels(ynames)
    xticklabels(xnames)
    
    set(gcf, 'color', 'w');
    
    set(gcf, 'Position', get(0, 'Screensize'));
    print(gcf, [results_path pair '.png'], '-dpng','-r250');
    close all
end

save([models_path pair], 'model');

