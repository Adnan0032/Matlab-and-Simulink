% Définition des données d'entrée et des étiquettes
X = [0 0; 0 1; 1 0; 1 1]; % Données d'entrée
Y = [0; 1; 1; 1]; % Étiquettes correspondantes

% Initialisation des poids et du biais
w = randn(1, size(X, 2)); % Initialisation aléatoire des poids
b = randn(); % Initialisation aléatoire du biais

% Paramètres d'apprentissage
learning_rate = 0.1;
epochs = 100;

% Entraînement du perceptron
for epoch = 1:epochs
    for i = 1:size(X, 1)
        % Calcul de la sortie prédite
        z = dot(w, X(i, :)) + b;
        y_pred = z >= 0;
        
        % Mise à jour des poids et du biais
        w = w + learning_rate * (Y(i) - y_pred) * X(i, :);
        b = b + learning_rate * (Y(i) - y_pred);
    end
    
    % Calcul de l'erreur de classification
    error = sum((Y - (X * w' + b)) ~= 0);
    
    % Affichage de l'erreur
    fprintf('Epoch %d, Erreur : %d\n', epoch, error);
    
    % Si l'erreur est nulle, on arrête l'entraînement
    if error == 0
        break;
    end
end

% Affichage des résultats
disp('Poids finaux :');
disp(w);
disp('Biais final :');
disp(b);

% Test du perceptron
test_inputs = [0 0; 0 1; 1 0; 1 1];
predicted_outputs = test_inputs * w' + b;
disp('Sorties prédites pour les données de test :');
disp(predicted_outputs >= 0);
