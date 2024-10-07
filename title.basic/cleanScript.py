import csv
import os  # import os to delete all the previous result files before running the script

# Function to remove quotes and clean runtime minutes
# Some of the titles have single and double quotes in their titles which will cause scripts to have issue. 
# This function will remove quotes from the input file
# Also the runtimeMinutes field has some N values instead of \N that represent NULL, 
# this function will clean the runtimeMinutes field and update the cleaned TSV file
def clean_data(input_file, cleaned_file):
    with open(input_file, 'r', encoding='utf-8') as infile, open(cleaned_file, 'w', encoding='utf-8') as outfile:
        for line in infile:
            # Remove double and single quotes
            cleaned_line = line.replace('"', '').replace("'", '')

            # Split the line into fields
            row = cleaned_line.strip().split('\t')

            # Skip header row
            if row[0] == 'tconst':
                outfile.write('\t'.join(row) + '\n')
                continue

            # Clean the runtimeMinutes field
            runtime_minutes = row[7].strip()  # Eighth column: runtimeMinutes
            if runtime_minutes == '\\N' or not runtime_minutes.isnumeric():
                row[7] = 'NULL'  # Convert to NULL for SQL
            else:
                row[7] = str(int(runtime_minutes))  # Convert to integer

           
            outfile.write('\t'.join(row) + '\n')

    print(f"Data has been cleaned. Cleaned data is saved in '{cleaned_file}'.")

# Function to split genres and write them to genres.csv
def split_genres(cleaned_file, genres_file):
    noGenreCount = 0
    totalCount = 0

    with open(cleaned_file, 'r', encoding='utf-8') as infile, open(genres_file, 'w', newline='', encoding='utf-8') as outfile:
        csv_writer = csv.writer(outfile)
        # Write header for genres.csv
        csv_writer.writerow(['tconst', 'genre'])

        for line in infile:
            # Split line by tab
            row = line.strip().split('\t')
            # Skip header row
            if row[0] == 'tconst':
                continue

            # Extract tconst and genres
            tconst = row[0]  # First column: tconst
            genres = row[8]  # Ninth column: genres

            # Handle missing or malformed genres
            if genres and genres != '\\N':
                # Split genres by comma and write each to the CSV
                genre_list = genres.split(',')
                for genre in genre_list:
                    csv_writer.writerow([tconst, genre.strip()])
            else:
                noGenreCount += 1
            totalCount += 1

    print(f"Genres have been extracted to '{genres_file}'.")
    print(f"Total records: {totalCount}")
    print(f"Records with no genre: {noGenreCount}")

# this runction simply remove the genres column from the cleaned file
# So that mySQL doesn't throw a warning saying the row is truncated
def remove_genres(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as infile:
        with open(output_file, 'w', encoding='utf-8', newline='') as outfile:
            reader = csv.reader(infile, delimiter='\t')
            writer = csv.writer(outfile, delimiter='\t')

            for row in reader:
                cleaned_row = row[:-1]
                writer.writerow(cleaned_row)
    print(f"Genres column removed and saved to {output_file}.")

    # Double check the output file, should only print the header row
    with open(output_file, 'r', encoding='utf-8') as infile:
        reader = csv.reader(infile, delimiter='\t')
        for row in reader:
            if row[-1] == 'NULL' or row[-1].isnumeric():
                continue
            else:
                print(row)


def get_genres_list(input_file, genres_outfile, title_to_genre_outfile):
    genres = {}

    with open(input_file, 'r', encoding='utf-8') as infile:
        reader = csv.reader(infile)

        with open(genres_outfile, 'w', encoding='utf-8', newline='') as genres_outfile:
            with open(title_to_genre_outfile, 'w', encoding='utf-8', newline='') as title_to_genre_outfile:
                
                genres_writer = csv.writer(genres_outfile)
                title_to_genre_writer = csv.writer(title_to_genre_outfile)

                genres_writer.writerow(['genreId', 'genreName'])  # Header for genres
                title_to_genre_writer.writerow(['tconst', 'genreId'])  # Header for title to genre mapping


                idCounter = 1

                for row in reader:
                    if row[0] == 'tconst':
                        continue

                    tconst = row[0].strip()
                    genre = row[1].strip()

                    if genre not in genres:
                        genres[genre] = idCounter
                        genres_writer.writerow([idCounter, genre])
                        idCounter += 1

                    title_to_genre_writer.writerow([tconst, genres[genre]])

# Function to delete specified output files
def delete_output_files(file_list):
    for file in file_list:
        try:
            os.remove(file)
            print(f"Deleted file: {file}")
        except FileNotFoundError:
            print(f"File not found: {file}")
        except Exception as e:
            print(f"Error deleting file {file}: {e}")

    


input_file = 'title.basic/title.basics.tsv'
cleaned_file = 'title.basic/cleaned_title_basics.tsv'
genres_file = 'title.basic/TitleGenres.csv'

no_genre_file = 'title.basic/cleaned_title_basics_no_genres.tsv'

genres_list_file = 'title.basic/genres_list.csv'
title_to_genre_mapping_file = 'title.basic/title_to_genre_mapping.csv'

# List of output files to delete
output_files = [
    cleaned_file,
    genres_file,
    no_genre_file,
    genres_list_file,
    title_to_genre_mapping_file,
]

# Delete existing output files
delete_output_files(output_files)



# Run the functions to clean the data
clean_data(input_file, cleaned_file)
split_genres(cleaned_file, genres_file)
remove_genres(cleaned_file, no_genre_file)


# Now since we are normallizing the data, we will have to create a new table for genres
# We can just list out all the genres in a separate file and then import it into the genres table
# then we can just use SQL to import the TitleGenres mapping table 
get_genres_list(genres_file, genres_list_file, title_to_genre_mapping_file)
