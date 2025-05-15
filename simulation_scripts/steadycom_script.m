%addpath(genpath('/home/arog/cobratoolbox'));
%initCobraToolbox(false);
%changeCobraSolver('ibm_cplex');

% Load the first model
load('/home/arog/models/mat/ic_1306.mat');

% Load the second model
load('/home/arog/models/mat/iEcSMS35_1347.mat');

% Create community
community = createMultipleSpeciesModel({ic_1306, ic_1306}, 'two_species_community');

