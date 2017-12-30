% https://cn.mathworks.com/matlabcentral/cody/problems/44307-the-glass-half-full
% Identical glasses are placed in a triangular tower structure, such that the top level (L = 1) comprises one glass, the next level down (L = 2) comprises three glasses, the next level down (L = 3) comprises six glasses, and so on.
% Follow the link to see a diagram shows the first three levels. The glasses in each levels are represented by the blue circles, while the yellow circles represent the positions of the glasses in the next higher level.
% 
% Water is poured into the top glass at a constant volumetric flow rate. When the glass is filled, the water starts spilling over and into the glasses below. Note that water only spills outward , meaning that at some point, some glasses will remain empty.
% v, the volume of a glass in liters 
% u, the volumetric flow rate in liters per second
% L, a level in the glass structure

% g, the number of glasses in that level
% f, the number of glasses in that level that will be filled with water
% t, the time, in seconds
%%
	
%%
[g, f, t] = filltime(0.25, 0.1, 2);
assert(isequal([g f t],[3 3 10]));
%%
function [g, f, t] = filltime(v, u, L)
    n = L;
    g = (1+n)*n/2;
    f = 3*n-3;
    t = (1+1.5*n*(n-1))*v/u;
    disp([g, f, t]);
end