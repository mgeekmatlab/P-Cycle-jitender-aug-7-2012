clear all
clc
x2=sprintf(' calculate Packet loss for pcycle model ');
disp(x2)
sprop1=200000 % in km/s
llink1=input(['enter length of link ''llink'' in km '])
tpr1=llink1/sprop1
dnot1=input('enter Notification distance Dnot ')
tnot1=tpr1*dnot1
thof1=input('enter handoff time Thof in sec')
tdel1=input('enter failure detection time tdel in sec')
trec_pl1=tdel1+thof1+tnot1
pfl1=input('enter packet loss in the faulty link time Pfl ')
rtr1=input('enter transmission rate in bits/sec ')

pls1=rtr1*trec_pl1+pfl1;
clc
x=sprintf(' calculate Packet loss for global model ');
disp(x2)
sprop2=200000 % in km/s
llink2=input(['enter length of link ''llink'' in km '])
tpr2=llink2/sprop2
dnot2=input('enter Notification distance Dnot ')
tnot2=tpr2*dnot2
thof2=input('enter handoff time Thof in sec')
tdel2=input('enter failure detection time tdel in sec')
trec_pl2=tdel2+thof2+tnot2
pfl2=input('enter packet loss in the faulty link time Pfl ')
rtr2=input('enter transmission rate in bits/sec ')

pls2=rtr2*trec_pl2+pfl2;

clc
a1=sprintf('Packet loss for pcycle = %d bits',pls1);
disp(a1)
a2=sprintf('Packet loss for global = %d bits',pls2);
disp(a2)
