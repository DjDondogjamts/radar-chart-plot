%Plotting circle with radius (r) and center (x0,y0) with timestep(t)
% 
%   circle(x0,y0,r,t)
%
%       x0, y0 --> the coordinates for the center of the circle
%       r      --> the radius
%       t      --> the timestep (i.e. t=0:0.01:2*pi)


function circle(x0,y0,r,t)
x=r*cos(t)+x0;
y=r*sin(t)+y0;

plot(x,y,'k')
end
