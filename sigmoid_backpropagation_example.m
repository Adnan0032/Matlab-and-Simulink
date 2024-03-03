function sigmoid_backpropagation_example()
    % Function definitions
    function y = sigmoid(x)
        y = 1 ./ (1 + exp(-x));
    end

    function y = sigmoid_prime(x)
        y = sigmoid(x) .* (1 - sigmoid(x));
    end

    % Définition de la fonction à approximer
    f = @(x) x;

    % Définition des paramètres du réseau
    nb_neurones_cache = 2;
    nb_neurones_sortie = 1;
    taux_apprentissage = 0.01;
    epochs = 100;

    % Initialisation des poids et des biais
    W1 = randn(nb_neurones_cache, 1);
    b1 = randn(nb_neurones_cache, 1);
    W2 = randn(nb_neurones_sortie, nb_neurones_cache);
    b2 = randn(nb_neurones_sortie, 1);

    % Entraînement du réseau
    for epoch = 1:epochs
        % Propagation avant
        x = randn(); % Génération d'une entrée aléatoire
        z1 = W1 * x + b1;
        a1 = sigmoid(z1); % Activation de la couche cachée (sigmoïde)
        z2 = W2 * a1 + b2;
        y_pred = z2; % Pas de fonction d'activation pour la sortie

        % Calcul de l'erreur
        erreur = y_pred - f(x);

        % Rétropropagation
        delta_W2 = erreur * a1';
        delta_b2 = erreur;
        delta_a1 = W2' * erreur;
        delta_z1 = delta_a1 .* sigmoid_prime(z1); % Dérivée de la sigmoïde
        delta_W1 = delta_z1 * x';
        delta_b1 = delta_z1;

        % Mise à jour des poids et des biais
        W1 = W1 - taux_apprentissage * delta_W1;
        b1 = b1 - taux_apprentissage * delta_b1;
        W2 = W2 - taux_apprentissage * delta_W2;
        b2 = b2 - taux_apprentissage * delta_b2;
    end

    % Vérification de la performance du réseau
    x_test = linspace(-1, 1, 100);
    y_test_pred = zeros(size(x_test));
    for i = 1:length(x_test)
        z1_test = W1 * x_test(i) + b1;
        a1_test = sigmoid(z1_test);
        z2_test = W2 * a1_test + b2;
        y_test_pred(i) = z2_test;
    end

    % Affichage des résultats
    figure;
    plot(x_test, f(x_test), 'b', x_test, y_test_pred, 'r');
    xlabel('x');
    ylabel('f(x)');
    legend('f(x)', 'Prédiction du réseau');
    title('Approximation de la fonction f(x)');
end
