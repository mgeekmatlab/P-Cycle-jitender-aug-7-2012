function[net,noofnodes,row,matrix,links,noofedges,newname,linkweight,linkrowweight]=generategraph(noofnodes,minedgeonnode,fromfile)
net.node=[];
net.edge=[];
num=0;
if fromfile==1
    name=input('enter file name   ','s');
    load(name);
else
    %%new graph
    for i=1:noofnodes
        net(i).node=1;
        repeat=2;
        while repeat==2
            while length(net(i).edge)<=minedgeonnode
                a=[];
                a=unique(randi(randi(noofnodes),1,randi(noofnodes)));
                if sum(a==i)==0
                    net(i).edge=a;
                    repeat=1;
                else
                    net(i).edge=[];
                    repeat=2;
                end
            end
        end
%         if length(net(i).edge)>maxedgeonnode
%             net(i).edge=net(i).edge(1,1:maxedgeonnode);
%         end
    end
%     for i=1:noofnodes
%         for j=1:length(net(i).edge)
%             num=num+1;
%             row(num,:)=sort([i,net(i).edge(1,j)]);
%             if i==net(i).edge(1,j)
%                 error;
%             end
%         end
%     end
%     row=sortrows(row,1);
%     newname=['noofnodes_' num2str(noofnodes)];
%     save(newname);
    %%new graph saved
end
for i=1:noofnodes
    for j=1:length(net(i).edge)
        num=num+1;
        row(num,:)=sort([i,net(i).edge(1,j)]);
        if i==net(i).edge(1,j)
            error;
        end
    end
end
row=sortrows(row,1);
newname=['noofnodes_' num2str(noofnodes)];
for i=1:noofnodes
    for j=1:length(net(i).edge)
        net(net(i).edge(1,j)).edge=unique(cat(2,net(net(i).edge(1,j)).edge,i));
    end
end
for i=1:noofnodes
    matrix(i,:)=zeros(1,noofnodes);
    for j=1:length(net(i).edge)
        matrix(i,net(i).edge(1,j))=1;
    end
end
links=unique(row,'rows');
noofnodes;
noofedges=length(links);
if fromfile~=1
    l1=randint(length(links),1,[1,length(links)])*2;
    linkweight=zeros(noofnodes,noofnodes);
    for k=1:noofedges
        linkweight(links(k,1),links(k,2))=l1(k,:);
        linkweight(links(k,2),links(k,1))=l1(k,:);
    end
end
lw=linkweight;
lwu=triu(lw);
lwr=[];
for i=1:length(lw)
    [r,c]=find(lwu(i,:)>0);
    lwr=cat(1,lwr,(lwu(i,c))');
end
linkrowweight=lwr;
save(newname,'net','noofnodes','minedgeonnode','links','linkweight','linkrowweight');
end

