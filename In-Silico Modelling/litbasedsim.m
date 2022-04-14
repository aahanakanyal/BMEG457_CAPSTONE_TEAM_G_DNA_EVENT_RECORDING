plot_timestep=10;
movie_frame=1; % set the first frame number for the movie we of the simulation we will be recording
littransfec=0.81;
litfludec=0.5;

for t=1:plot_timestep*littransfec %iterate through time

plot(rand, rand, 'bo', 'markersize', 10, 'linewidth', 2)


hold on
M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one

end

for t=1:plot_timestep 
for i=1:2*littransfec %can add a factor here for cell viability (would probably have to round it up/down)
if(t>(plot_timestep*litfludec)) %half for 50% fluoresence decay
    plot(rand,rand,'ko', 'markersize', 10, 'linewidth', 2)
    %plot(rand,rand, 'markersize', 10, 'linewidth', 2,'Color',[0.75, 0.75, 0])
    

else
    plot(rand,rand, 'go', 'markersize', 10, 'linewidth', 2)
end

ylim([-0.5 1.5])
xlim([-0.5 1.5])

hold on

end
M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one

end

for t=1:plot_timestep 
for j=1:((i*2)*littransfec) %factor here for transfection efficiency(would probably have to round it up/down)
if(t>(plot_timestep*litfludec))
    plot(rand,rand, 'mo', 'markersize', 10, 'linewidth', 2)

else
    plot(rand,rand, 'ro', 'markersize', 10, 'linewidth', 2)
end

hold on

end
M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one
end



title('Single Cell Division Simulation for seeding density of 10 cells for Values based on Experimentation');
   %xlabel('Time (in days)');
   %ylabel('Percentage Fluoresence (%)')
