function[hp,hc]=checkhameltonianpath(pcycle,cycle,linkweight,noofnodes)
if numel(pcycle{noofnodes})==0
    hp=0;
else
    x=pcycle{noofnodes};
    [r,c]=size(x);
    [cycleweight,working,spare]=capacity({x},linkweight);
    [r1,c1]=find(cell2mat(spare)==min(cell2mat(spare)));
    index=r-c1;
    hp=numel(cycle)-index;
end
    hc = ['hameltonian path not found'];
    if hp~=0
        hc=cycle{hp};
    end
end
    