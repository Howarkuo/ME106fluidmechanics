C = 0.05;

[x,y] = meshgrid(-5:1:5, -5:1:5);
% x = -5, -4 ... 5
% y = -5, -4... 5

% 2D vector field for matlab v = <u,v> = <dx/dt, dy/xt>

u = C*x.^2;
v = C*y.^2;


figure;
quiver(x,y,u,v,0);   % 0 means do not autoscale vectors
hold on;

% Streamlines satisfy dy/dx = v/u = y.^2/x.^2
% Analytical form: 1/y - 1/x = constant

% version1 : bug
%startx = -5:1:5;
%starty = 5*ones(size(startx));

% [1 1 1 1 1 1 1 1 1 1 1]*5 = starty =[5 5 5 5 5 5 5 5 5 5 5]
% start point [(-5,5), (-4, 5)....(1,5))
% top of velocity in y domain: y = 5 ! 
% v(y=5): [v=C(5)^2=0.05(25)=1.25>0.]
% no more space to move up!

% to fix: move start y to the bottom


startx = -5:1:5;
starty = -5*ones(size(startx));


streamline(x,y,u,v,startx,starty);
%streamline(x,y,u,v,startx,starty);
% v / u = (dy/dt) / (dx/dt) = dy / dx 
% syntax: location where the velocity is known ; x-compo= u ; y compo=v;
% starting point from which matlab trace streamline


xlabel('x');
ylabel('y');
axis equal;
xlim([-5 5]);
ylim([-5 5]);
grid on;
title('Velocity Field and Streamlines: u = Cx^2, v = Cy^2');