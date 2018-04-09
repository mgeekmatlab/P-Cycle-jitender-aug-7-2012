clc
clear all
close all
% global linkweight
noofnodes=7;

fromfile=2; % 1-- data file,  2--  example  3-- random
minedgeonnode=1;
maxnoofcylclestoprotectonecycle=3;
examplelinks=[];
examplelinksweight=[];


if fromfile~=3 %data file or example below
    
%     %% example1
%     noofnodes=6
%     examplelinks={[2,6];[3,5];[2,4];[5,6];[2,4,6];[1,4,5]};
%     examplelinksweight=[20;19;19;21;20;11;24;20];

%     %% example2
%     noofnodes=6
%     examplelinks={[2,3,4];[1,3];[1,2,4,6];[1,3,5];[4,6];[1,3,5]};
%     examplelinksweight=[20;23;19;30;17;20;20;20;19];

%     %% example3  for hop limit
    noofnodes=6;
    examplelinks={[2,3,4];[1,3];[1,2,4,6];[1,3,5];[4,6];[1,3,5]};
    examplelinksweight=[20;50;19;30;17;20;20;20;19];


[net,noofnodes,matrix,links,noofedges,newname,linkweight,linkrowweight]=generategraph(noofnodes,minedgeonnode,examplelinks,examplelinksweight,fromfile);
end
if fromfile==3 %random
    fromfile=2
    [net,noofnodes,row,matrix,links,noofedges,newname,linkweight,linkrowweight]=generategraph2(noofnodes,minedgeonnode,fromfile);
end


delete([newname '.txt'])
diary off
diary(cat(2,newname,'.txt'));
subplot(2,1,1);
plotgraph(noofnodes,matrix,5,linkrowweight);
[pcycle,cycle]=findpcycle(net,noofnodes);
[cycleweight,working,spare]=capacity(cycle,linkweight);
noofpcycles=pcycleplot1(noofnodes,pcycle,newname);
[noofaltpath,validpath,validpathspare]=findaltpath(cycle,cycleweight,spare,maxnoofcylclestoprotectonecycle);
[hameltonianpath,hameltoniancycle]=checkhameltonianpath(pcycle,cycle,linkweight,noofnodes);
% [finalspare,finalsparepath,hoplimitspare,hoplimitsparepath]=selectaltpath(cycle,validpath,validpathspare,spare)
[finalspare,finalsparepath,hoplimit]=selectaltpath(cycle,validpath,validpathspare,spare);
totalworking=sum(cell2mat(working));
[sparereduction,sparebeforepcycle,spareafterpcycle]=improvement(finalspare,spare);
result=[];
for i=1:length(cycle)
    result{i}.cycleno=i;
    result{i}.cycle=cycle{i};
    result{i}.weight=cycleweight{i};
    result{i}.working=working{i};
    result{i}.spare=spare{i};
    result{i}.finalspare=finalspare{i};
    result{i}.finalsparepath=finalsparepath{i};
    result{i}.hoplimitexist=hoplimit(1,i);
end
for i=1:length(cycle)
    result{i}
end
working
spare
finalspare
totalworking
sparebeforepcycle
spareafterpcycle
sparereduction

save(newname);
diary off