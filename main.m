clear
clc

%Load pre-trained MLP and DTR models for each output

load mlp_ch4
load mlp_co
load mlp_co2
load mlp_h2
load mlp_hhv
load tree_ch4
load tree_co
load tree_co2
load tree_h2
load tree_hhv

% Load PCA applied feature (PCA correlation equations are given in
% Supplementary Material)

% Example features
p1 = -1827.841; 
p2 = 1063.3575;
p3 = 83.397042;

features = [p1;p2;p3];

% Predictions made by MLP, Order: CO,CO2,CH4,H2,HHV
predictions_mlp = [mlp_co(features);mlp_co2(features);mlp_ch4(features);mlp_h2(features);mlp_hhv(features)];

% Predictions made by DTR, Order: CO,CO2,CH4,H2,HHV
predictions_tree = [predict(tree_co,features'),predict(tree_co2,features'),predict(tree_ch4,features'),predict(tree_h2,features'),predict(tree_hhv,features')];

