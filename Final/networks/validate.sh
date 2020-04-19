echo "Validating all nml files"
echo "Validating all nml files in directory original and writing them to orginal.txt"
./jnml -validate ./Original/*.nml >Original.txt

echo "Validating all nml files in directory Renml10 and writing them to Renml10.txt"
./jnml -validate ./Renml10/*.nml > Renml10.txt
echo "Validating all nml files in directory Renml10-modified and writing them to Renml10-modified.txt"
./jnml -validate ./Renml10-modified/*.nml> Renml10-modified.txt
echo "Validating all nml files in directory Renml20 and writing them to Renml20.txt"
./jnml -validate ./Renml20/*.nml> Renml20.txt
echo "Validating all nml files in directory Renml20-modified and writing them to Renml20-modified.txt"
./jnml -validate ./Renml20-modified/*.nml > Renml20-modified.txt
echo "all files have been validated"