
numerator = [0.8];
denominator = [4e-7 1];
G = tf(numerator, denominator);


t = 0:0.01:10; 
u = t;
[y, t] = lsim(G, u, t);

plot(t, y);
title('Réponse à une rampe inclinaison de 2');
xlabel('Temps');
ylabel('Amplitude');
grid on;
