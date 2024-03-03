% Création du modèle Simulink
model = 'DSRC_Modulation_Model';
open_system(new_system(model));

% Ajout des blocs
add_block('simulink/Commonly Used Blocks/Pulse Generator', [model '/Binary Signal']);
add_block('simulink/Comm Sources/ASK Modulator Baseband', [model '/ASK Modulator']);
add_block('simulink/Commonly Used Blocks/Scope', [model '/Scope']);

% Configuration des blocs
set_param([model '/Binary Signal'], 'Amplitude', '1', 'Frequency', '1', 'PulseWidth', '0.5');
set_param([model '/ASK Modulator'], 'ModulationOrder', '2', 'SymbolRate', '1');
set_param([model '/Scope'], 'Position', [300,100,600,300]);

% Connexion des blocs
add_line(model, 'Binary Signal/1', 'ASK Modulator/1');
add_line(model, 'ASK Modulator/1', 'Scope/1');

% Configuration du modèle
set_param(model, 'Solver', 'FixedStepDiscrete', 'FixedStep', '0.1');

% Lancement de la simulation
sim(model);

% Affichage du modèle
open_system(model);
