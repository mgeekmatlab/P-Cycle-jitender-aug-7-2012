function[sparereduction,sparebeforepcycle,spareafterpcycle]=improvement(finalspare,spare)
sparebeforepcycle=0;
spareafterpcycle=0;
for i=1:length(spare)
sparebeforepcycle=sparebeforepcycle+sum(spare{i});
spareafterpcycle=spareafterpcycle+sum(finalspare{i});
end
sparereduction=sparebeforepcycle-spareafterpcycle;
end