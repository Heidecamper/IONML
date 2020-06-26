How to validate the SWC morphologies. This software to validate SWC files is obtained from neuroMorpho.org (http://neuromorpho.org/StdSwc1.21.jsp).

I used the tool to validate the obtained SWC files.

The command used to do this. Go into the folder and run the following command:

java StdSwc1_31 [output] -in [input(swc_File)]
Example: java StdSwc1_31 ./output.std -in ./morphologies/Preprocessed_cells/Oringal/input.std

This generates a file name output.std that flags all the irregularites and errors. For the type of errors this software looks for I suggest you read the manual StdSwc.docx