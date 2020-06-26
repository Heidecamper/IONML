%%% This script imports the swc files, resamples them using the MATLAB Trees TOOLBOX and exports them as swc files again. 

%%% Specify the method of resampling you want
%  0: Basic Resampling
%  1: Sort the tree first in so-called BCT order and in Lexicograph order (See the treestoolbox for more information.
%  2: Do both methods 0 and 1.

function output = main(input_files,Routine,resampling_length)
    if(nargin == 0)
        disp('No input arguments were given');
        disp('Need the location of the swc files and preferable the resampling ');
        return;
    end
    %Routine = 0;


    %%Strings
    %files_in = "./treestoolbox-master/Pre_processed_cells/*.swc";

    %%variables
    %resampling_length = 20; % in micrometers. 

    %%Go through the folder and stores all the file names in an array of strings 
    tree_txt = imprint(input_files);
    trees_in = insert(tree_txt); %Go through the swc files and load the corresponding tree of every neuron.

    switch Routine
        %This is routine 0. Performs basic resampling while preserving path
        %length. 
        case 0
            disp('Performing basic resampling preserving path length (method 0)');
            trees_resampled = resample_trees(trees_in, resampling_length, 'l');
            disp('Exporting trees ');
            desert(trees_resampled,resampling_length);
            disp('Trees have been exported and have been saved in the current directory');
        %This is routine 1. Performs basic resampling whitout preserving path
        %length.
        case 1
            disp('Performing basic resampling ');
            trees_resampled = resample_trees(trees_in, resampling_length);
            disp('Exporting trees ');
            desert(trees_resampled,resampling_length);
            disp('Trees have been exported and have been saved in the current directory');
        %This is routine 2. First sorts the tree conform BCT criteria
        %Then performs basic resampling with preserving path
        %length.
        case 2       
            disp('Create equivalent BCT tree, perform basic resampling and preserve path length');
            BCT_trees = sort_trees(trees_in);
            BCT_trees_resampled = resample_trees(trees_in, resampling_length, 'l');
            disp('Exporting trees');
            desert(BCT_trees_resampled,resampling_length);
            disp('Trees have been exported and have been saved in the current directory');
        %This is routine 3. First sorts the tree conform BCT criteria
        %Then performs basic resampling without preserving path
        %length.
        case 3             
            disp('Create equivalent BCT tree, perform basic resampling');
            BCT_trees = sort_trees(trees_in);
            BCT_trees_resampled = resample_trees(trees_in, resampling_length);
            disp('Exporting trees');
            desert(BCT_trees_resampled,resampling_length);
            disp('Trees have been exported and have been saved in the current directory');   
        %This is routine 4. Plots the electronic signature of each tree and
        %stores them as an image. Note: the saved image doesnt include the
        %axis. I suggest using the GUI (cgui_tree) to plot the sse_tree
        %inluding axis.
        case 4
            disp('Plot sse tree');
            output = elecs(trees_in);
            length(output)
            if(length(output) ==0)
                sse = output;
                clf; 
                imagesc  (sse);
                colorbar;
                axis     image;
                xlabel   ('node #');
                ylabel   ('node #');
                title    ('potential distribution [mV]');          
                imwrite( ind2rgb(im2uint8(mat2gray(sse)), parula(256)), char(strcat(trees_in.name,'.png')))
            else
                for ii=1:length(output)                
                    sse = output{ii};             
                    clf; 
                    imagesc  (sse);
                    colorbar;
                    axis     image;
                    xlabel   ('node #');
                    ylabel   ('node #');
                    title    ('potential distribution [mV]');          
                    imwrite( ind2rgb(im2uint8(mat2gray(sse)), parula(256)), char(strcat(trees_in{1,ii}.name,'.png')))
                end
                disp('Exporting trees');
            end

        otherwise
            disp('Note: No valid routine has been assigned. Attempt to execute routine 0');
            disp('Performing basic resampling preserving path length (method 0)');
            trees_resampled = resample_trees(trees_in, resampling_length);
            disp('Exporting trees ');
            desert(trees_resampled,resampling_length);
            disp('Trees have been exported and have been saved in the current directory');

    end
end
     




