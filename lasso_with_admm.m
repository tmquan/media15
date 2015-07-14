clc; clear all; close all;
%% Control the random number generator, make it repeatable
rng(2020);

%% Declare the inplace functions
vec             = @(x) (x(:)); 
soft_thresh  	= @(x,th) sign(x).*max(abs(x) - th,0);
norm2      		= @(x) x(:)'*x(:);
norm1      		= @(x) sum(abs(x(:))); 

%%
dimy = 100;
dimx = 80;

%%
Y = randn(dimy, dimx);
D = randn(dimy, dimy);

C = randn(dimy, dimx);
X = zeros(dimy, dimx);
L = zeros(dimy, dimx);
%% Constant variables go here
mu_max      =   5;
mu          =   1e-4;
tau         =   1.1;
tol         =   1e-3;
beta        =   1;
max_iter    =   500;

%% Solver goes here
for iter = 1:max_iter
    %% Solve for X
    den = D'*D + mu*speye(dimy, dimy);
    num = D'*Y + mu*C - L;
    X   = den \ num;
    
    %% Solve for C
    C = soft_thresh(X + L./mu, beta/mu);
    
    %% Multiplier update
    L = L + mu*(X-C);
    
    %% Penalty update
    mu = min(tau*mu, mu_max);
    
     %% Display the cost
    % err         = 1/(2*T)*norm2( vec(x_fft) - vec(sum( d_fft .*z_fft, 2)) )...
                %+ beta*vec( sum(norm1(t), 2) )
    err = 0;
    err = 0/5  * norm2( vec(Y) - vec(D*X) )...
        + beta * norm1( vec(X) ) ...
        
    cost(iter)  = err;  

    figure(11);
    %% Draw cost
    subplot(321);plot(cost); xlabel('cost: |Y - D*X|_2 + beta*|X|_1 ');
    
    %% Draw Y
    subplot(322); stem(vec(Y),'filled');  xlabel('Y'); 
    
    %% Draw X
    subplot(323); stem(vec(X),'filled');  xlabel('X');
    
    %% Draw C
    subplot(324); stem(vec(C),'filled');  xlabel('C');
    
    drawnow;
end