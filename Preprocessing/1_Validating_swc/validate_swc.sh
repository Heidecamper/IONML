#Bash script that goes through all the input swc files and outputs an output file
#The bash script uses the software package obtained from neuroMorpho,org (http://neuromorpho.org/StdSwc1.21.jsp)
printf "This script standardizes swc_files using the Java software program StdSwc obtained from http://neuromorpho.org/StdSwc1.21.jsp. The link contains the documentation explaining how to use the software.\n\n"
printf "This bash script is written to make it more convenient to quickly input multiple swc files and retrieve individual output files.\n\n\n\n"
printf "NB for this script to work you need to be in the path where the java class script is located!!!!!!!!\n"
printf "Please insert the name of the java.class file name \n"

#Ask for the name of the class executable. Standard was StdSwc1_31. insert name of executable
#If downloaded and not altered( StdSwc1_31)
read java_Class

#Output the name of the the input class given
echo java.class name is: $java_Class

#Ask for the location where the swc files that need to be standardized are stored.
printf "Insert the full path of the folder in which the .swc files are stored ~/$mypath$/swc_folder\n"
read swc_folder

#Create an output directory.
mkdir output

#Standard for loop that loops through all the swc files and outputs them as .std files with the corrections that need to be made.
#It only points out the errors. Does not fix any types. 
for swc_files in "$swc_folder"/*.swc
do
	#The two temp statements remove the path and the file extension from the file name.
	temp=${swc_files##*/}  
	temp1=${temp%.swc*}
	output=$temp1.std
 	echo $output
 	java $java_Class ./output/$output -in $swc_files
done

