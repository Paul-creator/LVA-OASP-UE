close all;

[rc, colors] = plotrc();

%% Example Realization
N = 1000;

w = sigma*randn(1, N);

A = 1;
r = 1.005;
n = linspace(0, N-1, N);
x_n = A*power(r, n) + w;

figure
plot(n, x_n)
xlabel("n")
ylabel("x[n]")
title("Signal x[n]")

%% PDF
sigma = 2;
x = linspace(-10, 10, N);
pdf = 1/sqrt(2*pi*sigma.^2) * exp(-1/2 * (x/sigma).^2);
plot(x, pdf)
