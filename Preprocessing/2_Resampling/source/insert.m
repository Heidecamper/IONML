function output = insert(x1)
%This function takes a cell structure with one or multiple file names of
%the swc files opens the files, extracts the data from the files and put
%thems in a cell that contains the adjacency matrix dA. The 3D coordinates
%and the radius of each node.

x1=string(x1);
% disp(length(x1))
if length(x1)==1
    fprintf("Input contains one file name ")
    [output]=load_tree(char(x1),'DEFAULT');
    fprintf("did it work")
end
    
if length(x1)>1
    output=cell(1,length(x1));
    for ii=1:length(x1)
        [temp]=load_tree(char(x1(ii)),'DEFAULT');
        output{ii}=temp;
        
    end
end

end



 

