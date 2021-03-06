%% scaled up truebelievers model
% 29 june 16


% need to construct Is, Ps

 n = 2;
 I = [.85, .15; .0001, .9999];
 u_0 = [0; 0;.5;1];
 p = [0.5; 0];
 
% n = 1;
% I = 1;
% u_0 = [0;.85];
% p = .15;

rhs = @(t, u) [(1 - u(1:n) - u((n+1):(2*n)) - p).*(I*(u(1:n) + p)) ...
    - u(1:n).*(I*u((n+1):(2*n)));
    (1 - u(1:n) - u((n+1):(2*n)) - p).*(I*u((n+1):(2*n))) ...
    - u((n+1):(2*n)).*(I*(u(1:n) + p))];

% amount of time
tend = 250.0;


% solve ODE
[T,U] = ode45(@(t,u) rhs(t,u),[0:0.1:tend],u_0);

figure(1);
plot(T,U(:,1),'b',T,U(:,2),'c',T,U(:,3),'r',T,U(:,4),'m');
%plot(T,U(:,1),'b',T,U(:,2),'r')
xlabel('Time')
ylabel('population proportion')

nA = U(2501,1);
nB = U(2501,2);

(nB^2) + (p-1)*nB == (nA+p)^2 - nA 

