C = 0.05;

[x,y] = meshgrid(-5:1:5, -5:1:5);

% 2D vector field for matlab v = <u,v> = <dx/dt, dy/xt>

u = C*y;
v = C*x;


figure;
quiver(x,y,u,v,0);   % 0 means do not autoscale vectors
hold on;

% Streamlines from dy/dx = v/u
% Analytical form: y^2 - x^2 = constant

% startx = -5:1:5;
% starty = 5*ones(size(startx));
s = linspace(-5,5,21)

startx = [s, s, -5*ones(size(s)), 5*ones(size(s))];
starty = [-5*ones(size(s)), 5*ones(size(s)), s, s];

streamline(x,y,u,v,startx,starty);
%streamline(x,y,u,v,startx,starty);
% du / dv = (dy/ds) / (dx/ds) = dy / dx 
% syntax: location where the velocity is known ; x-compo= u ; y compo=v;
% starting point from which matlab trace streamline


xlabel('x');
ylabel('y');
axis equal;
xlim([-5 5]);
ylim([-5 5]);
grid on;
title('Velocity Field and Streamlines: u = Cy, v = Cx');