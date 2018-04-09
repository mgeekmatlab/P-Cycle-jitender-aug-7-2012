clear all
clc
nhopg=input('enter no of hops for global model')
nhopp=input('enter no of hops pcycle model')
nooflinksg=input('enter no of links for global model')
nooflinksp=input('enter no of links for pcycle model')
sprop=200000 % in km/s
l1=input(['enter length of link in km '])
% linklengthg=ones(1,nooflinksg)*l1;
% linklengthp=ones(1,nooflinksp)*l1;
linklengthg=rand(1,nooflinksg)*l1;
linklengthp=rand(1,nooflinksp)*l1;
% for i=1:nooflinks
%     linklength(1,i)=input(['enter length of link in km ' num2str(i) ])
% end
llinkg=linklengthg
llinkp=linklengthp
tpropg=llinkg/sprop
tpropp=llinkp/sprop

l2=input(['enter P_size in bits'])
psizeg=ones(1,nooflinksg)*l2;
psizep=ones(1,nooflinksp)*l2;

% for i=1:nooflinks
%     psize(1,i)=input(['enter P_size in bits ' num2str(i) ])
% end
slink=input('enter Slink in bits/sec ')
ttransg=psizeg/slink
ttransp=psizep/slink
tnpi1=input('enter min Tnpi in msecs ')
tnpi2=input('enter max Tnpi in msecs ')
steps=input('enter Tnpi steps')
tnpisteps=(tnpi2-tnpi1)/steps;
mintnpi=min([tnpi1,tnpisteps,tnpi2]);
tnpi=[tnpi1/mintnpi:tnpisteps/mintnpi:tnpi2/mintnpi]*mintnpi/1000
pdelayg=sum(tpropg)+sum(ttransg)+tnpi*nooflinksg;
pdelayp=sum(tpropp)+sum(ttransp)+tnpi*nooflinksp;
trecg=(nhopg-1).*pdelayg
trecp=(nhopp-1).*pdelayp
save('tempname')
clc
disp('pdelay for global in msec')
disp(pdelayg)
disp('trec for global in msec')
disp(round(trecg*1000))
disp('pdelay for pcycle in msec')
disp(pdelayp)
disp('trec for pycle in msec')
disp(round(trecp*1000))
close all
hold on
plot(tnpi*1000,trecg*1000,'-k^')
plot(tnpi*1000,trecp*1000,'-r*')

legendname=({['global'];['p_{cycle}']});
title('Test Network')
xlabel('T_{npi} _{(ms)}')
ylabel('Recovery Time _{(ms)}');
legend(legendname)

saveas(gcf,'compare T_npi','pdf')