%%Time specifications:
   Fs = 800;                   % samples per second
   dt = 1/Fs;                   % seconds per sample
   StopTime = 8; %0.25;             % seconds
   t = (0:dt:StopTime-dt)';     % seconds
   
   %blue green red
   %%Sine wave:
   Fcg = 0.5;%2;                     % hertz
   greenfluo = cos(0.5*pi*Fcg*t);
   Fcr=0.5;%2;
   redfluo= sin(0.5*pi*Fcr*t);
   Fcb=0.5;%2;
   index= find(t>4); %ballpark value where fluo changes (temp flag)
   bluefluo= cos(0.5*pi*Fcb*t);
   
    
   plot(t,greenfluo,'color', 'b');
   hold on
   plot(t,redfluo,'color', 'g');
   hold on
   
   xlim([0 8])
   plot(t(index),bluefluo(index),'color', 'r');
 
   xlabel('Time (in days)');
   title('Fluorescence');
   zoom xon;
   
   hold off
   
   %ideal conditions
   tenth=10;
   cellinc=2;
   %green
   f= figure;
   xg=0:cellinc; %0:5;
   yg=(4*xg+2)*tenth;%2*xg+1;
   plot(xg,yg,'color', 'b');
   hold on
   ylast=yg(length(yg));
   xlast=xg(length(xg));
   xlastvec=xlast:xlast+cellinc;
   ylastvec=repelem(ylast,length(xlastvec));
   plot(xlastvec,ylastvec,'color', 'b');
   hold on
   
     %red
   xr=xlast:xlast+cellinc;
   yr=(4*xg+2)*tenth;
   plot(xr,yr,'color', 'g');
   hold on
   ylastr=yr(length(yr));
   xlastr=xr(length(xr));
   xlastvecr=xlastr:xlastr+cellinc;
   ylastvecr=repelem(ylastr,length(xlastvec));
   plot(xlastvecr,ylastvecr,'color', 'g');
   
   %blue
   xb=xlastr:xlastr+cellinc;
   yb=(4*xg+2)*tenth;
   plot(xb,yb,'color', 'r');
   hold on
   ylastb=yb(length(yb));
   xlastb=xb(length(xb));
   xlastvecb=xlastb:xlastb+cellinc;
   ylastvecb=repelem(ylastb,length(xlastvec));
   hold on
   plot(xlastvecb,ylastvecb,'color', 'r');
   

   title('Fluorescence');
   xlabel('Time (in days)');
   ylabel('Percentage Fluoresence (%)')
   
   