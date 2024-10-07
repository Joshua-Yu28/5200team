Copy the name.basics.tsv file in to this folder 

1. Run the cleanScript.py 
2. Run the split_mapping.py 
3. Run the name.basics.sql in your mySQL workbench





The reason we are splitting the mapping files into separate smaller chunks is because that for some reason, if you load that entire file together, not only that it takes around 25 minutes, but it also loses a lot of rows. In total it has around 22 million rows, but if you load them together, it only has 6 million something rows, which is weird... 