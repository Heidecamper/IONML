function output = resample_trees(input1,resampling, options)
%depending on the input parameters it calls the resample tree with
%different parameters. The function calls the function resample tree
%which resamples the tree and reduces the number of nodes needed to
%describe the morphology of the cell. 

    switch nargin     
        % Case 1:Default version of resample tree is called and if no
        % resample length is inserted. 
        case 1
            output=cell(1,length(input1));
            resampling = 5; % Default value of 5 microM is none is given 
            for jj=1:length(input1)
               output{jj}=resample_tree(input1{jj},resampling);
            end
        %case 2 similar to case 1 but resample length is given by user.
        case 2
            output=cell(1,length(input1));
            for jj=1:length(input1)
                output{jj}=resample_tree(input1{jj},resampling);
            end
            
        %case 3 multiple input arguments are given so path length is
        %preserved.
        case 3
            output=cell(1,length(input1));
            disp('case 3 ');
            for jj=1:length(input1)
                output{jj}=resample_tree(input1{jj},resampling, '-l');
            end  
        otherwise
            %otherwise exit and print requirements for the function
            disp('Number of input arguments need to be between one and three');
            disp('First argument are the swc files, second argument the resampling length and if there is a third argument total path length will be preserved');
    end
end

    



