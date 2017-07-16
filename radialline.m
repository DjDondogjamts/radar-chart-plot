%Plot Radial Line at angle (theta) with length (r)
%
%   radialline(theta,r)
%
%       theta --> the angular location on the polar coordinate
%       r     --> the length of the line

function radialline(theta,r)

r=linspace(0,r,r*100);
[x,y]=pol2cart(theta,r);


plot(x,y,'k')
end
