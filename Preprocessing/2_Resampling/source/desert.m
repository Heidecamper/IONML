function desert(trees_out, resample)
    %calls the export to swc_format function from the TREES toolbox for
    %multiple trees.
    for ii=1:length(trees_out)   
        swc_tree(trees_out{ii},char(strcat(trees_out{1,ii}.name,'_resample_',string(resample),'.swc'))); 
    end
end

