function[alternativepathfound,cyclecombination,cyclecombinationspare]=findaltpath(cycle,cycleweight,spare,maxnoofcylclestoprotectonecycle)
global linkweight
alternativepathfound=zeros(1,length(cycle));
if nargin~=4
    if exist('maxnoofcylclestoprotectonecycle','var')~=1
        maxnoofcylclestoprotectonecycle=2;
    end
end
for i=1:maxnoofcylclestoprotectonecycle% renge of combinations of cycles for alternative cycles
    x=nchoosek(1:length(cycle),i);
    [cover,coverweight]=functionf1(x,cycle,spare);
    [r,c]=size(cycle);
    for j=1:c
        if i==1
            cyclecombination{j}=[];
            cyclecombinationspare{j}=[];
        end
        [r2,c2]=size(x);
        for k=1:r2      
%                         if x(k,:)==[2,6]
%                 y=0;
%             end
            if freshpath(x(k,:),j,cyclecombination{j})==1              
%             if numel(intersect(x(k,:),j))==0
% 
%                 cycle{j}
%                 cover{k}
                if checkcover(cycle{j},cover{k})==1
                    alternativepathfound(1,j)=alternativepathfound(1,j)+1;
    %                 cyclecombination{i}{numel(cyclecombination{i})+1}=x(k,:);
%                     x(k,:)
                    cyclecombination{j}=cat(1,cyclecombination{j},{x(k,:)});
%                     cyclecombination{j};
                    temp=0;
                    for ii=1:c2
                        temp=temp+spare{x(k,ii)};
                    end
                    cyclecombinationspare{j}=cat(1,cyclecombinationspare{j},temp);
                end     
%             end
            end
        end     
    end
end
end

%%

function[cover,coverweight]=functionf1(x,cycle,spare)
[r,c]=size(x);
coverweight=[];
for i=1:r
    in=[];
    in=cycle{x(i,1)};
    wt=0;
    for j=1:c
%         in=intersect(in,cycle{x(i,j)});
%         in;
%         x(i,j);
        in=union(in,cycle{x(i,j)});
        wt=wt+spare{x(i,j)};
    end
    cover{i}=in;
    coverweight=cat(2,coverweight,wt);
end
end
    
function[out]=checkcover(a,b)
out=0;
if numel(intersect(a,b))==numel(a)
    out=1;
end
end

function[out]=freshpath(a,j,b)
    out=0;
    c1=0;
    if numel(intersect(a,j))~=0
        c1=c1+1;
    end
    [r,c]=size(b);
    for i=1:r
        if numel(intersect(a,b{i}))~=0
            c1=c1+1;
        end
    end
    if c1==0
        out=1;
    end
end