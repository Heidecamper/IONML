The github contains two directories: morphologies and preprocessing

preprocessing:
This directory contains the steps including description of the software used and needed to convert .SWC morphology files into NeuroMl format. The resulting NML files do still need to be debugged. I recommend using jneuroml for this. Also the resulting neuroml cell file will still need the biophysical properties. Just copy them from a morphology in the morphology directory and change the parameters to own preference. 

morphologies:
Contains all the inferior olive cells in neuroML format and everything needed to run simulations in OSB with them. They have been debugged using jneuroML. 