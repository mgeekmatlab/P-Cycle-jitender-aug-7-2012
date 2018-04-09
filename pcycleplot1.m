function[noofpcycles]=pcycleplot1(noofnodes,loop,newname)
[r,c]=size(loop);
for i=1:noofnodes
    noofpcycles(1,i)=0;
    if i<=c
        if numel(loop{i})>0
            a=loop{i};
            [r2,c2]=size(a);
        else
            r2=0;
        end
        noofpcycles(1,i)=r2;
    end
end
subplot(2,1,2);
plot([1:noofnodes],noofpcycles,'-o');
title('the no of candidate p cycles')
xlabel('no of nodes')
ylabel('no of cycles')
axis([0,noofnodes+1,0,max(noofpcycles)+2])
saveas(gcf,newname,'jpg')
end