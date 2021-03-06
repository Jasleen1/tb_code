%% Replicating Strogatz Paper
% d nA / dt = nAB*(nA + p) - nA*nB
% d nB / dt = nAB*nB - nB*(nA + p)
% nAB = 1 - nA - nB - p
% nA = u(1), nB=u(2)

% initializing
p = .1344;

% right hand side of system of DEs
% u(1) = n_A
% u(2) = n_B
% p = A zealots
rhs = @(t,u) [(1 - u(1) - u(2) - p)*(u(1) + p) - u(1)*(u(2)) ; ...
    (1 - u(1) - u(2) - p)*(u(2)) - u(2)*(u(1) + p)];

% amount of time
tend = 250.0;

% initial conditions
u0 = [ 0; 1-p ];

% solve ODE
[T,U] = ode45(@(t,u) rhs(t,u),[0:0.1:tend],u0);

% plot results
figure(1);
plot(T,U(:,1),'b',T,U(:,2),'r');
xlabel('Time')
ylabel('population proportion')

figure(2);
plot(U(:,1),U(:,2),'r');
xlabel('nA')
ylabel('nB')

%% 2 sites, influence factor 
% initalizing
p1 = .2;
p2 = .1;
i1 = .3;
i2 =.3;

% right hand side of system
% u(1) = n1A, u(2) = n1B, u(3) = n2A, u(4) = n2B, p1 = A_zealots from city
% 1, p2 = A_zealots from city 2.
rhs = @(t,u) ...
    [(1 - u(1) - u(2) - p1)*((1 - i2)*(u(1) + p1) + i2*(u(3) + p2)) - u(1)*((1 - i2)*(u(2)) + i2*u(4)) ; ...
    (1 - u(1) - u(2) - p1)*((1 - i2)*u(2)+i2*u(4)) - u(2)*((1 - i2)*(u(1) + p1) + i2*(u(3) + p2)) ; ...
    (1 - u(3) - u(4) - p2)*((1 - i1)*(u(3) + p2) + i1*(u(1) + p1)) - u(3)*((1 - i1)*u(4) + i1*u(2)) ; ...
    (1 - u(3) - u(4) - p2)*((1 - i1)*u(4)+i1*u(2)) - u(4)*((1 - i1)*(u(3) + p2) + i1*(u(1) + p1))];

% IC + time scale to solve DEs
u0 = [ 0 ; 1 - p1 ; 0 ; 1 - p2 ];
tend = 50.00;

% solve ODE
[T,U] = ode45(@(t,u) rhs(t,u),[0:0.1:tend],u0);

% plot results
figure(1);
plot(T,U(:,1),'b',T,U(:,2),'r',T,U(:,3),'c',T,U(:,4),'m');
xlabel('Time')
ylabel('population proportion')


