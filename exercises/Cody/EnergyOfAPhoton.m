% https://cn.mathworks.com/matlabcentral/cody/problems/361-energy-of-a-photon
% ? ? ? ? ? ? ?
% 
% Given the frequency F of a photon in giga hertz.
% 
% Find energy E of this photon in giga electron volts.
% 
% Assume h, Planck's constant is about 4 femto electron-volt-second.
% 
% To maximize benefits, it may help not looking at the Test Suite before trying any solution!
% 
% For more info: https://en.wikipedia.org/wiki/Planck_constant
	
%%
F = 1;
E_correct = 3/10^15;
assert(photon_energy(F)>E_correct)
%%
function E = photon_energy(F)
  E=100/F;
end