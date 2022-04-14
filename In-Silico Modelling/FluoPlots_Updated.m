xb=linspace(-5, 5, 100);
yb=-2*xb.^2;
plot(xb,yb,'b','linewidth',0.5)
hold on
xg=linspace(5, 15, 100);
yg=-2*xb.^2;
plot(xg,yg,'g','linewidth', 0.5)
hold on
xr=linspace(15, 25, 100);
yr=-2*xb.^2;
plot(xr,yr,'r','linewidth', 0.5)
hold off

figure()

%%Time specifications:
   Fs = 800;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 83.4; %0.25;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   tb=(0:dt:16.5-dt)'; %temp flag of 16.5 hrs
   tg=(16.5-dt:dt:50-dt)';
   tr=(50-dt:dt:StopTime-dt)';
   %blue green red
   %%Sine wave:
   Fcb = 0.5;%2;                     % hertz
   bluefluo = cos(0.06*pi*Fcb*tb);
   Fcg=0.5;%2;
   %indexg=find(t>16.5);
   greenfluo= cos(0.06*pi*Fcg*tg);
   Fcr=0.5;%2;
   %indexr= find(t>32); %ballpark value where fluo changes (temp flag)
   redfluo= cos(0.06*pi*Fcr*tr);
   
    
   plot(tb,abs(bluefluo)*100,'color', 'b');
   hold on
   plot(tg,abs(greenfluo)*100,'color', 'g');
   hold on
   plot(tr,abs(redfluo)*100,'color', 'r');
   
   xlim([0 90])
   
 
   xlabel('Time (in hrs)');
   ylabel('Fluorescence Intensity (%)')
   title('Fluorescence');
   zoom xon;
   
   hold off


