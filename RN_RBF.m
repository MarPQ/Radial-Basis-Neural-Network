clear all
close all
clc

load funcion2

x = X;
d = Y';

K = length(x);

M = 30;
sigma = 1.2;

%Paso no supervisado
[~,mu] = kmeans(x',M);

%Paso supervisado
G = zeros(K,M);

for k=1:K
    for j=1:M    
        G(k,j) = exp((-(norm(x(k)-mu(j))^2))/(sigma^2));
    end
end

W = pinv(G)*d;

%Genralizacion
y = G*W;

figure(1)
hold on
grid on
plot(x,d,'o','LineWidth',2,'MarkerSize',10)
plot(x,y,'r-','LineWidth',2,'MarkerSize',10)
xlabel('x')
ylabel('y')
legend('Datos de entrenamiento','Salida de la red','Location', 'best')