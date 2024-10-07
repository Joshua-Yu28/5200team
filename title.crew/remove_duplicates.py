import csv

# File paths
writer_input_file = 'title.crew/writers.tsv'
director_input_file = 'title.crew/directors.tsv'

writer_output_file = 'title.crew/writers_no_dup.tsv'
director_output_file = 'title.crew/directors_no_dup.tsv'

# Function to remove duplicates from a file
def remove_duplicates(input_file, output_file):
    unique_pairs = set()
    duplicate_count = 0

    # Open the input and output files
    with open(input_file, 'r', newline='', encoding='utf-8') as infile, \
         open(output_file, 'w', newline='', encoding='utf-8') as outfile:

        reader = csv.reader(infile, delimiter='\t')
        writer = csv.writer(outfile, delimiter='\t')

        # Write the header (if applicable)
        header = next(reader)
        writer.writerow(header)

        # Iterate through the rows and remove duplicates
        for row in reader:
            tconst, nconst = row[0], row[1]
            pair = (tconst, nconst)

            if pair not in unique_pairs:
                unique_pairs.add(pair)
                writer.writerow([tconst, nconst])
            else:
                duplicate_count += 1

    return duplicate_count

# Remove duplicates for both files
writer_dup_count = remove_duplicates(writer_input_file, writer_output_file)
director_dup_count = remove_duplicates(director_input_file, director_output_file)

# Output the results
print(f"Total writer duplicates removed: {writer_dup_count}")
print(f"Total director duplicates removed: {director_dup_count}")
