function output=imprint(input)
%This function takes multiple files as input and puts them in a cell and
%extracts the name of the files and puts them in a cell structure.
dinfo=dir(input);
output1={dinfo.name};
    for ii=1:length(output1)
        output(ii)=[string(output1{ii})];
    end

end




