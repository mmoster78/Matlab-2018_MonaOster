%random_walk_model
% simulations of decision making over time
%woman walking on a tight rope, taking 20 steps, then rebalancing before
%taking the next step


nsteps=20;
timepts=0:0.1:2; %taking a step every 1 second, but we give her 2 seconds to complete the step

forwardspeed=.3;
noise=0.8; %variance in the noise
stepsize=5;

footposition(1) = 0;
for i=2:length(timepts)
    footposition(i) = footposition(i-1) + forwardspeed + (noise * randn(1, 1)); %at every point in time her foot position is the foward motion + random noise
    if footposition(i) >=stepsize
       footposition(i:length(timepts))=NaN;
       i=length(timepts)+1;
    end
end



plot(timepts, footposition)

