%% 
clear 
clc % clean the command window
close all %close any figures 


%% 
n=7;
%add other parametrers to inform transfection efficicency


transfec=0.7;
percentstaysblue=0.3;
percentstaysgreen=0.3;

yb = rand(n,1);
xb= rand(n,1);
probdiv=rand;
k=0.25;
movecell=0.1;
dxi=0;
dyi=0;
traxb=round(transfec*length(xb));
trayb=round(transfec*length(yb));
ybt=randsample(yb,trayb);
xbt=randsample(xb,traxb);
outyb=ismember(yb,ybt);
outxb=ismember(xb,xbt);
blackxbind=find(outxb==0) ;%pos will be 0 since not transfected
blackybind=find(outyb==0) ;%pos will be 0 since not transfected
plotblxb=xb(blackxbind);
plotblyb=yb(blackybind);



plot(plotblxb,plotblyb,'ko', 'markersize', 10, 'linewidth', 2)
title("Number of cells = 7 , Transfection Efficiency = 70% ")
hold on
xlim([0,1]);
ylim([0,1]);
grid on
for i=0:10
    plot(xbt,ybt,'bo', 'markersize', 10, 'linewidth', 2, 'MarkerEdgeColor',[0, 0, i*0.1])
    hold on
    pause(0.5)
   
    
end



pause(1);

keepblue=round(percentstaysblue*length(xbt));
chooseblue=randsample(xbt,keepblue);
keepxb=ismember(xbt,chooseblue);
posxfory=find(keepxb==1);
choosebluey=ybt(posxfory);
keepyb=ismember(ybt,choosebluey);
keepbluex=find(keepxb==0) ;%variable name is opposite of what it is doing - storing things that are going to chnage colour
keepbluey=find(keepyb==0) ;%variable name is opposite of what it is doing- storing things that are going to chnage colour
plotblongx=xbt(find(keepxb==1));
plotblongy=ybt(find(keepyb==1));

xbt=xbt(keepbluex);
ybt=ybt(keepbluey);



hold on
plot(xbt,ybt,'bo', 'markersize', 10, 'linewidth', 2);
pause(1);
hold on
for i=0:10
    plot(xbt,ybt,'bo', 'markersize', 10, 'linewidth', 2, 'MarkerEdgeColor',[0, 0, 1-(i*0.1)])
    hold on
    pause(0.5)
   
    
end

hold on

xlim([0,1]);
ylim([0,1]);

pause(1.0);
if probdiv < k
   dxi = movecell;
  elseif probdiv < 2*k
   dxi =-movecell;
  elseif probdiv < 3*k
   dyi = movecell;
  elseif probdiv < 4*k
   dyi = -movecell;
end

hold on
ygadd=rand(((n*2)+length(yb)),1);%+dyi;
xgadd=rand((n*2)+length(xb),1);%+dxi;

%not transfected div
lbx=length(plotblxb);
lby=length(plotblyb);


plotblxg=[plotblxb',(rand(lbx*2,1))'];
plotblyg=[plotblyb',(rand(lby*2,1))'];

plot(plotblxg,plotblyg,'ko', 'markersize', 10, 'linewidth', 2)

posyb=length(yb);
posxb=length(xb);
ygaddex=ygadd(posyb+1+length(plotblyg):end);
xgaddex=xgadd(posxb+1+length(plotblxg):end);


yg=[ybt',ygaddex']; %only successfully tranfected that decay after ecxpression move on to having green
xg=[xbt',xgaddex'];


hold on
for i=0:10
   plot(xg,yg,'go', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[0 i*0.1 0])
    hold on
    pause(0.5)
   
    
end

pause(1.0);

keepgreen=round(percentstaysgreen*length(xg));
choosegreen=randsample(xg,keepgreen);
keepxg=ismember(xg,choosegreen);
posxforyg=find(keepxg==1);
choosegreeny=yg(posxforyg);
keepyg=ismember(yg,choosegreeny);
keepgreenx=find(keepxg==0) ;%variable name is opposite of what it is doing - storing things that are going to chnage colour
keepgreeny=find(keepyg==0) ;%variable name is opposite of what it is doing- storing things that are going to chnage colour
plotglongx=xg(find(keepxg==1));
plotglongy=yg(find(keepyg==1));
oglengthxg=length(xg);
oglengthyg=length(yg);
ogxg=xg;
ogyg=yg;
xg=xg(keepgreenx);
yg=yg(keepgreeny);
hold on
plot(xg,yg,'go', 'markersize', 10, 'linewidth', 2)
pause(1.0);
hold on
%plot(xg,yg,'go', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[0 0.7 0])
for i=0:10
   plot(xg,yg,'go', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[0 1-(i*0.1) 0])
    hold on
    pause(0.5)
   
    
end
xlim([0,1]);
ylim([0,1]);
grid on
pause(1.0);

probdiv=rand;
if probdiv < k
   dxi = movecell;
  elseif probdiv < 2*k
   dxi =-movecell;
  elseif probdiv < 3*k
   dyi = movecell;
  elseif probdiv < 4*k
   dyi = -movecell;
end



yradd=rand(((length(ygadd)-length(yb))*2+length(ygadd)),1);%+dyi;
xradd=rand(((length(xgadd)-length(xb))*2+length(ygadd)),1);%+dxi;

%not transfected div
lgx=length(plotblxg);
lgy=length(plotblyg);


plotblxr=[plotblxg,(rand((lgx-lbx)*2,1))'];
plotblyr=[plotblyg,(rand((lgy-lby)*2,1))'];

plot(plotblxr,plotblyr,'ko', 'markersize', 10, 'linewidth', 2)

hold on

posyg=length(ogyg);
posxg=length(ogxg);
yraddex=yradd(posyg+1+length(plotblyr):end);
xraddex=xradd(posxg+1+length(plotblxr):end);


yr=[yg,yraddex'];
xr=[xg,xraddex'];
%long blue decay


for i=0:10
   plot(xr,yr,'ro', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[i*0.1 0 0])
    hold on
    pause(0.5)
   plot(plotblongx,plotblongy,'bo', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[0 0 1-(i*0.1)])
   pause(0.5)
    
end


hold on 
pause(1.0)

plot(xr,yr,'ro', 'markersize', 10, 'linewidth', 2)
hold on 
pause(1.0)

for i=0:10
   plot(xr,yr,'ro', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[1-(i*0.1) 0 0])
    hold on
    pause(0.5)
    plot(plotglongx,plotglongy,'go', 'markersize', 10, 'linewidth', 2,'MarkerEdgeColor',[0 1-(i*0.1) 0])
   pause(0.5)
   
    
end
xlim([0,1]);
ylim([0,1]);
grid on

%% plot #cells on y vs #divisons on x
numcellsblue=length(xbt);
%div1=numcellsblue;
numcellsgreen=length(xg);
numcellsred=length(xr);
div1=(numcellsgreen-numcellsblue)/2;
div2=(numcellsred-numcellsgreen)/2;
numdiv=[1 2];
numcells=[div1 div2 ];
bar(numdiv, numcells);

xlabel('Number of cell divisions');
ylabel('Number of cells');






