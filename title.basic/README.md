Copy the title.basics.tsv file into this folder
1. Run the cleanScript.py 
2. Run the title.basic.sql in your mySQL workbench




This folder only works on the title.basics.tsv file from the IMDB dataset. 
To clean the data simple run the cleanScript.py script, and it will prepare the neceessary files to load into mySQL. 

Since mySQl does not support array, we will have to normalize the genres column into separate tables 

Creating a Genres table that represent all the genres, and assign a uniqu id to the genres 
And creating a TitleGenres table that maps the titleId to the genreId 


NOTE. There are a lot of \N values in the runtimeMinutes column, and when loading into mySQL, it somehow doesn't recognize it as NULL automatically, instead you will get a bunch of "Incorrect integer value: 'NULL ' for column 'runtimeMinutes' at row 19" warnings. Idk why it somehow adds a extra empty space after the NULL, but this should not affect the dataset itself. 