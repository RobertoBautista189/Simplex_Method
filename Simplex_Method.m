% Roberto Bautista

function [tab] = Simplex_Method(A,b,c)


Asb= [A b]                  % puts A and b in tabuleu form as one matrix
numofvariables = size(c,2)  % number of variables of c
P =zeros(1,size(Asb,2))     % P is a vector of zeros
P(1:numofvariables)= c      % c becomes P

tab = [Asb;P]               % Puts Asb and P in tabular form as one matrix

RUN = true
while RUN                   % while RUN is true loop
    if any ((tab(end,:))<0) % if any value in the last row of tab is less than zero
        [entercol,pvtcol] = min(tab(end,:)) % the minimum value of the last row, and outputs the value and the number of the pivot column 
        if all (tab(:,pvtcol)>= 0) % if values are great than zero, print the folowing
            error('All entries are >= o in column %d',pvtcol) 
        else % otherwise do the following
            sol = tab(:,end) %sets b column in the tab matrix equal to sol
            Pivot_Column = tab(:,pvtcol) % pivot column is equal to the column where the pivot was located in line 16
            for i = 1:size(tab,1) %i goes from i to the number of rows in the tab matriz
                if Pivot_Column(i)> 0 %  calls each value in the pivot column by row and if any value is greater than zero do the following 
                    ratio(i) = abs(sol(i)/Pivot_Column(i)) % takes the absolute value ratio of b and the pivot column by row
                else % if any value is less than zero in the pivot collumn
                    ratio(i) = inf % set the ratio equal to inf
                end
            end
                    [Ratio_Min,pvtrow] = min(ratio) % locates the minimum ratio of the pivot column and saves the ratio and the row 
        end
        pvtkey = tab(pvtrow,pvtcol) % sets the pivot row and column eqaul to pvtkey
        tab(pvtrow,:) = tab(pvtrow,:)/pvtkey % divides the row pivot row by the pvtkey
        for i=1:size(tab,1) % for i to the number of rows in tab do the following
            if i ~= pvtrow % if i is not equal to pivot row do the following
                tab(i,:) = tab(i,:)-tab(i,pvtcol)*tab(pvtrow,:) % row reduces
                
            end
        end
    
else
    RUN =false
    fprintf('\n Optimal Solution \n')
end
end
end
           
      
