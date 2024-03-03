function sigmoid_backpropagation()
    % Function definitions
    function y = sigmoid(x)
        y = 1 ./ (1 + exp(-x));
    end

    function y = sigmoid_prime(x)
        y = sigmoid(x) .* (1 - sigmoid(x));
    end
