function PSE=b_PSEfitAllsubMLE(  )

dataName(1)={'KappaExp-1-0.xlsx'};
dataName(2)={'KappaExp-2-0.xlsx'};
dataName(3)={'KappaExp-3-0.xlsx'};
dataName(4)={'KappaExp-4-0.xlsx'};
dataName(5)={'KappaExp-5-0.xlsx'};
dataName(6)={'KappaExp-6-0.xlsx'};
dataName(7)={'KappaExp-7-0.xlsx'};
dataName(8)={'KappaExp-8-0.xlsx'};
dataName(9)={'KappaExp-9-0.xlsx'};
dataName(10)={'KappaExp-10-0.xlsx'};
dataName(11)={'KappaExp-11-0.xlsx'};
dataName(12)={'KappaExp-12-0.xlsx'};
dataName(13)={'KappaExp-13-0.xlsx'};
dataName(14)={'KappaExp-14-0.xlsx'};
dataName(15)={'KappaExp-15-0.xlsx'};
dataName(16)={'KappaExp-16-0.xlsx'};
dataName(17)={'KappaExp-17-0.xlsx'};
dataName(18)={'KappaExp-18-0.xlsx'};
dataName(19)={'KappaExp-19-0.xlsx'};
dataName(20)={'KappaExp-20-0.xlsx'};
dataName(21)={'KappaExp-21-0.xlsx'};
dataName(22)={'KappaExp-22-0.xlsx'};
dataName(23)={'KappaExp-23-0.xlsx'};
dataName(24)={'KappaExp-24-0.xlsx'};
dataName(25)={'KappaExp-25-0.xlsx'};
dataName(26)={'KappaExp-26-0.xlsx'};
dataName(27)={'KappaExp-27-0.xlsx'};
dataName(28)={'KappaExp-28-0.xlsx'};
dataName(29)={'KappaExp-29-0.xlsx'};
dataName(30)={'KappaExp-30-0.xlsx'};
dataName(31)={'KappaExp-31-0.xlsx'};
dataName(32)={'KappaExp-32-0.xlsx'};
dataName(33)={'KappaExp-33-0.xlsx'};
dataName(34)={'KappaExp-34-0.xlsx'};
dataName(35)={'KappaExp-35-0.xlsx'};
dataName(36)={'KappaExp-36-0.xlsx'};
dataName(37)={'KappaExp-37-0.xlsx'};
dataName(38)={'KappaExp-38-0.xlsx'};
dataName(39)={'KappaExp-39-0.xlsx'};
dataName(40)={'KappaExp-40-0.xlsx'};
dataName(41)={'KappaExp-41-0.xlsx'};
dataName(42)={'KappaExp-1-1.xlsx'};
dataName(43)={'KappaExp-2-1.xlsx'};
dataName(44)={'KappaExp-3-1.xlsx'};
dataName(45)={'KappaExp-4-1.xlsx'};
dataName(46)={'KappaExp-5-1.xlsx'};
dataName(47)={'KappaExp-6-1.xlsx'};
dataName(48)={'KappaExp-7-1.xlsx'};
dataName(49)={'KappaExp-8-1.xlsx'};
dataName(50)={'KappaExp-9-1.xlsx'};
dataName(51)={'KappaExp-10-1.xlsx'};
dataName(52)={'KappaExp-11-1.xlsx'};
dataName(53)={'KappaExp-12-1.xlsx'};
dataName(54)={'KappaExp-13-1.xlsx'};
dataName(55)={'KappaExp-14-1.xlsx'};
dataName(56)={'KappaExp-15-1.xlsx'};
dataName(57)={'KappaExp-16-1.xlsx'};
dataName(58)={'KappaExp-17-1.xlsx'};
dataName(59)={'KappaExp-18-1.xlsx'};
dataName(60)={'KappaExp-19-1.xlsx'};
dataName(61)={'KappaExp-20-1.xlsx'};
dataName(62)={'KappaExp-21-1.xlsx'};
dataName(63)={'KappaExp-22-1.xlsx'};
dataName(64)={'KappaExp-23-1.xlsx'};
dataName(65)={'KappaExp-24-1.xlsx'};
dataName(66)={'KappaExp-25-1.xlsx'};
dataName(67)={'KappaExp-26-1.xlsx'};
dataName(68)={'KappaExp-27-1.xlsx'};
dataName(69)={'KappaExp-28-1.xlsx'};
dataName(70)={'KappaExp-29-1.xlsx'};
dataName(71)={'KappaExp-30-1.xlsx'};
dataName(72)={'KappaExp-31-1.xlsx'};
dataName(73)={'KappaExp-32-1.xlsx'};
dataName(74)={'KappaExp-33-1.xlsx'};
dataName(75)={'KappaExp-34-1.xlsx'};
dataName(76)={'KappaExp-35-1.xlsx'};
dataName(77)={'KappaExp-36-1.xlsx'};
dataName(78)={'KappaExp-37-1.xlsx'};
dataName(79)={'KappaExp-38-1.xlsx'};
dataName(80)={'KappaExp-39-1.xlsx'};
dataName(81)={'KappaExp-40-1.xlsx'};
dataName(82)={'KappaExp-41-1.xlsx'};

for isub=1:82
      
    data=xlsread(char(dataName(isub)));
    
    sizData=size(data);
    
    xDis=[1 2 4 8 16 32];
    yDis=[3];            
    t1=[1];              
    
    
    sxDis=size(xDis);
    syDis=size(yDis);
    stDis=size(t1);
    
    
    nc1=0;
    nc2=0;
    
    for i1=1:sxDis(2)
        for j1=1:syDis(2)
            for k1=1:stDis(2)
                        
                        indx1=find(data(:,1)==xDis(i1)); %data(:,1) is standard distance
                        indx2=find(data(:,2)==yDis(j1)); %data(:,2) is Vertical distance
                        indx3=find(data(:,3)==t1(k1));   %data(:,3) is standard time interval
                        
                        indx12=intersect(indx1,indx2); % C = intersect(A,B) returns the data common to both A and B, with no repetitions. C is in sorted order.
                        indx123=intersect(indx12,indx3); 
                        
                        k.data=data(indx123,:);                        
                        
                        % begin to fit data
                        % options = optimset(optimfun) creates options with all parameter names and default values relevant to the optimization function optimfun.
                        options=optimset('fminsearch');
                        % the optimization function = fminsearch, Find minimum of unconstrained multivariable function using derivative-free method
                        options.TolX=0.001;
                        % Termination tolerance on x, a positive scalar. The default value is 1e-4. Unlike other solvers, fminsearch stops when it satisfies both TolFun and TolX.
                        options.Display='final';
                        % Level of display,'final' displays just the final output.
                                                
                        r0=rand(1,2)*0.09;
                        c0=[1 0.6];
                        c1=c0+r0;                     

                        [a1,sfval,sexit,soutput]=fminsearch(@pseFun,c1,options,k);
                        pse(k1,j1,i1,isub)=a1(1);
                        sd(k1,j1,i1,isub)=a1(2);                       
                
            end
        end
    end   
    
end


PSE.pse=squeeze(pse);
PSE.sd=squeeze(sd);

clear pse;
clear sd;

savepath='./';
save(strcat(savepath,'PSE_MLE.mat'),'PSE');




function E=pseFun(a1,k)

sizets=size(k.data);

data=k.data;

pse=a1(1);
sigm=a1(2);

zscore=(data(:,4)-pse)./sigm;  % data(:,4) is comparison time interval

% p = normcdf(x,mu,sigma) returns the cdf of the normal distribution with mean mu and standard deviation sigma, evaluated at the values in x.

probs=normcdf(zscore,0,1); % p(r_i=1¨O¦È)=¦µ(zscore) 

for ii=1:sizets(1)
    if k.data(ii,5)==0   % data(:,5) is comlong, if the vaule is 0, the comparison interval is shorter.
        probs(ii)=1-probs(ii);
    end
end

p1= probs;

logPro=-log(p1);

E=sum(logPro);
