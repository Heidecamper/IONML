import sys
import numpy as np

#Location of nml files
cell_locat = '<include href="../cells/'

#parameters for pulse generator
pulse_id = "iclamp0"
pulse_delay = "500 ms"
pulse_duration = "200 ms"
pulse_amplitude = "-1 nA"


# parameters for the type of network
net_id = "net"
net_type = "networkWithTemperature"
net_temp = "35 degC"

# parameters for the population 
pop_num = "number_of_cells" # currently not used. Every cell has its private population by default
pop_id = "pop"
pop_type = "populationList"
pop_size = "1"
spacing_1d = 200

# important that file naming of the cells starts with the components name and is separated by a _. 
# parameters for the inputlist

#counters used
line_count = 0


if(len(sys.argv) == 1):
	print("I need an input!")
	exit(1)

file_names = open(sys.argv[1],'r')
output_file = open("nml_grid.net.nml",'w')
line = file_names.readline()
output_file.write('<?xml version="1.0" encoding="UTF-8"?>\n')
output_file.write('<neuroml xmlns="http://www.neuroml.org/schema/neuroml2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.neuroml.org/schema/neuroml2  https://raw.github.com/NeuroML/NeuroML2/development/Schemas/NeuroML2/NeuroML_v2beta3.xsd" id="net">\n\n')

while line:
	output_file.write('<include href="../Optimized/ResLength5/')
	output_file.write(line.strip())
	output_file.write('"/>\n')
	line = file_names.readline()
	line_count +=1 

output_file.write('\n')
print(line_count)
# writing the pulsegenerator line
output_file.write('<pulseGenerator id="')
output_file.write(pulse_id)
output_file.write('" delay="')
output_file.write(pulse_delay)
output_file.write('" duration="')
output_file.write(pulse_duration)
output_file.write('" amplitude="')
output_file.write(pulse_amplitude)
output_file.write('"/>\n\n')

#writing the network
output_file.write('<network id="')
output_file.write(net_id)
output_file.write('" type="')
output_file.write(net_type)
output_file.write('" temperature="')
output_file.write(net_temp)
output_file.write('">\n\n')


number_of_cells = line_count*int(pop_size)
dim = float(number_of_cells)**(1.0/2.0)
dim = int(dim)+1
print(number_of_cells)
print(dim)

# writing the population file
line = file_names.seek(0)
line = file_names.readline()
cnt_pop = 0
cnt_spacing = 0
pop = int(pop_size)
coordinates = [0,0,0]
counting_grid = 0
while line:
	cnt_pop_size = 0
	temp = line.strip().split('_')
	output_file.write('\t<population id="')
	output_file.write(pop_id)
	output_file.write(str(cnt_pop))
	output_file.write('" component="')
	output_file.write(temp[0])
	output_file.write('" type="')
	output_file.write(pop_type)
	output_file.write('" size="')
	output_file.write(pop_size)
	output_file.write('">\n')
	for x in range(pop):
		output_file.write('\t\t<instance id="')
		output_file.write(str(cnt_pop_size))
		output_file.write('">\n')
		output_file.write('\t\t\t<location x="')
		output_file.write(str(coordinates[0]))
		output_file.write('" y="')
		output_file.write(str(coordinates[1]))
		output_file.write('" z="')
		output_file.write(str(coordinates[2]))
		output_file.write('"/>\n')
		if x!=pop-1:
			output_file.write('\t\t</instance>\n\n')
		else:
			output_file.write('\t\t</instance>\n')
		
		cnt_pop_size+=1
		cnt_spacing +=1
		coordinates[0]+=spacing_1d
		if cnt_spacing%dim == 0:
			coordinates[0] = 0
			counting_grid += 1
			coordinates[1] = counting_grid * spacing_1d


	output_file.write('\t</population>\n\n')

	line = file_names.readline()
	cnt_pop+=1

#writing the input files 
output_file.write('</network>\n')
output_file.write('</neuroml>\n')

file_names.close()
output_file.close()

