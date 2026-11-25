close all;

[rc, colors] = plotrc();

%% Model parameters
N = 1000;
A = 1;
r = 1.005;
sigmaW = 2;
n = 0:N-1;

%% Example realization
w = sigmaW * randn(1, N);
x_n = A * r.^n + w;

figure;
plot(n, x_n, '.', 'DisplayName', 'Noisy observation');
hold on;
plot(n, A * r.^n, '--', 'DisplayName', 'Mean $A r^n$');
hold off;
xlabel('$n$', 'Interpreter', 'latex');
ylabel('$x[n]$', 'Interpreter', 'latex');
title('Exponential signal in additive white Gaussian noise');
legend('Location', 'best');

%% Noise probability density
x = linspace(-10, 10, 500);
noisePdf = 1 / sqrt(2 * pi * sigmaW^2) * exp(-x.^2 / (2 * sigmaW^2));

figure;
plot(x, noisePdf);
xlabel('$w$', 'Interpreter', 'latex');
ylabel('$p(w)$', 'Interpreter', 'latex');
title(sprintf('Noise PDF ($\\sigma_w^2 = %.1f$)', sigmaW), ...
    'Interpreter', 'latex');

%% CRLB and Fisher information versus the number of observations
Nmax = 200;
nBounds = 0:Nmax-1;
rValues = [0.95, 1.00, 1.05];

fisherInformationByN = cumsum(rValues'.^(2 * nBounds), 2) / sigmaW^2;
crlbByN = 1 ./ fisherInformationByN;

figure;
semilogy(1:Nmax, crlbByN', 'LineWidth', rc{"lineWidth"});
xlabel('Number of observations, $N$', 'Interpreter', 'latex');
ylabel('$\mathrm{CRLB}(A)$', 'Interpreter', 'latex');
title('CRLB versus observation length');
legend('r = 0.95', 'r = 1.00', 'r = 1.05', 'Location', 'best');

figure;
semilogy(1:Nmax, fisherInformationByN', 'LineWidth', rc{"lineWidth"});
xlabel('Number of observations, $N$', 'Interpreter', 'latex');
ylabel('$I(A)$', 'Interpreter', 'latex');
title('Fisher information versus observation length');
legend('r = 0.95', 'r = 1.00', 'r = 1.05', 'Location', 'best');

%% CRLB versus the known exponential factor for fixed N
Nfixed = 100;
nFixed = 0:Nfixed-1;
rSweep = linspace(0.8, 1.2, 201);
fisherInformationByR = sum(rSweep'.^(2 * nFixed), 2) / sigmaW^2;
crlbByR = 1 ./ fisherInformationByR;

figure;
semilogy(rSweep, crlbByR);
hold on;
plot(1, sigmaW^2 / Nfixed, 'o', 'HandleVisibility', 'off');
hold off;
xlabel('Known exponential factor, $r$', 'Interpreter', 'latex');
ylabel('$\mathrm{CRLB}(A)$', 'Interpreter', 'latex');
title(sprintf('CRLB versus $r$ for $N = %d$', Nfixed), ...
    'Interpreter', 'latex');
