% function[finalspare,finalsparepath,hoplimitspare,hoplimitsparepath]=selectaltpath(cycle,validpath,validpathspare,spare)
function[finalspare,finalsparepath,hoplimit]=selectaltpath(cycle,validpath,validpathspare,spare)
for i=1:length(cycle)
    hoplimit(1,i)=0;
    finalspare{i}=[];
    finalsparepath{i}=[];
    alt1=sum(validpathspare{i}< spare{i});
    if alt1==0
        finalspare{i}=spare{i};
        finalsparepath{i}=i;
    end
    if alt1>0
        vps=validpathspare{i};
        vp=validpath{i};
        s=spare{i};
        [r,c]=find(vps==min(vps));
        
        
        
        
        
        
        
        if numel(r)==1
            finalspare{i}=vps(r(1,1),:);
            finalsparepath{i}=vp{r};
            hoplimit(1,i)=0;
        elseif numel(r)>1
            for r1=1:numel(r)
                x(r1,1)=functionf2(vp{r(r1,:)},cycle);
                x2(r1,:)=numel(x{r1});
            end
            [r2,c2]=find(x2==min(x2));
            r(r2,c2);
            finalspare{i}=vps(r(r2,c2),:);
            finalsparepath{i}=vp{r(r2,c2)};
            hoplimit(1,i)=1;
        end
    end
end


end


% for i=1:length(cycle)
%     hoplimitspare{i}=[];
%     hoplimitsparepath{i}=[];
%     alt1=sum(validpathspare{i}==spare{i});
%     if alt1==0
%         hoplimitspare{i}=finalspare{i};
%         hoplimitsparepath{i}=finalsparepath{i};
%     end
%     if alt1>0
%         vps=validpathspare{i};
%         vp=validpath{i};
%         s=spare{i};
%         [r,c]=find(vps==min(vps));
%         for r1=1:r
%             x(r1,1)=functionf2(vp{r1},cycle);
%             x2=numel(x(r1,1));
%         end
%         [r2,c2]=find(x2==min(x2));
%         
%         if numel(cycle{i})<x2(r2,:)
%             hoplimitsspare{i}=vps(r2,:);
%             hoplimitssparepath{i}=vp{r2};
%         else
%             hoplimitspare{i}=finalspare{i};
%             hoplimitsparepath{i}=finalsparepath{i};
%         end
%     end
% end
% end
    
function[cover]=functionf2(x,cycle)
[r,c]=size(x);
% coverweight=[];
for i=1:r
    in=[];
    in=cycle{x(i,1)};
%     wt=0;
    for j=1:c
%         in=intersect(in,cycle{x(i,j)});
%         in;
%         x(i,j);
        in=union(in,cycle{x(i,j)});
%         wt=wt+spare{x(i,j)};
    end
    cover{i}=in;
%     coverweight=cat(2,coverweight,wt);
end
end