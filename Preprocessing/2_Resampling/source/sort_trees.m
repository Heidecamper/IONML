function output = sort_trees(input1)
%This function sorts the tree conform BCT formalism. This is a set of
%criteria to preserve the uniqueness of a neural tree. It calls the
%function of the treestoolbox. This is just a simple for loop that calls
%the function for multiple trees at once.
output=cell(1,length(input1));

for jj=1:length(input1)
    output{jj}=sort_tree(input1{jj});
end



