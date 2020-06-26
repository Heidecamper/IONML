function elec = elecs(x1)
%plots the Steady state electrotonic potential of multiple trees and in
%combination with the line in main saves them as png file.
if length(x1)==1
    x1=repair_tree(x1);
    fprintf("Input contains one file name ");
    x1.Cm=1;
    x1.Ri=100;
    x1.Gm=0.0005;
    elec=sse_tree(x1,[],'-s');
    fprintf("did it work");
end
    
if length(x1)>1
    elec=cell(1,length(x1));
    for ii=1:length(x1);
        x1{ii}= repair_tree(x1{ii});
        x1{ii}.Cm=1;
        x1{ii}.Ri=100;
        x1{ii}.Gm=0.0005;
        [temp]=sse_tree(x1{ii},[],'-s');
        elec{ii}=temp;
        
    end
end

end
