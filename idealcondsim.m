plot_timestep=10;
movie_frame=1; % set the first frame number for the movie we of the simulation we will be recording
littransfec=0.81;
litfludec=0.5;

for t=1:plot_timestep %iterate through time

plot(rand, rand, 'go', 'markersize', 10, 'linewidth', 2)


hold on
M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one

end

for t=1:plot_timestep 
for i=1:2 %can add a factor here for cell viability (would probably have to round it up/down)

plot(rand, rand, 'ro', 'markersize', 10, 'linewidth', 2)
ylim([-0.5 1.5])
xlim([-0.5 1.5])

hold on

end
M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one

end

for t=1:plot_timestep 
for j=1:((i*2)) %factor here for transfection efficiency(would probably have to round it up/down)

    plot(rand,rand, 'bo', 'markersize', 10, 'linewidth', 2)
end

hold on



M(movie_frame,1,1) = getframe; % get the plotted frame to make a movie
       movie_frame=movie_frame+10; % increase the frame number by one
end


%writing video data to v
v = VideoWriter('myFile','Archival');
v.VideoCompressionMethod;
open(v);
writeVideo(v,M);
close(v);


title('Single Cell Division Simulation');
   %xlabel('Time (in days)');
   %ylabel('Percentage Fluoresence (%)')
