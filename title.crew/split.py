import os

def split_tsv_file(input_file, output_dir, fileName, rows_per_file=1000000):
    # Ensure the output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Initialize variables
    file_count = 0
    current_row_count = 0
    output_file = None

    with open(input_file, 'r', encoding='utf-8') as infile:
        # Read the header
        header = infile.readline()

        # Loop through each row in the input file
        for line in infile:
            if current_row_count == 0:
                # Create a new output file when starting a new batch
                file_count += 1
                output_file_path = os.path.join(output_dir, f'{fileName}_{file_count}.tsv')
                output_file = open(output_file_path, 'w', encoding='utf-8')
                # Write the header to the new output file
                output_file.write(header)
            
            # Write the current line to the output file
            output_file.write(line)
            current_row_count += 1

            # If we've reached the desired row count, close the file and reset the counter
            if current_row_count >= rows_per_file:
                output_file.close()
                current_row_count = 0

        # Close the last output file if it exists
        if output_file is not None:
            output_file.close()

# Usage
director_input_file = 'title.crew/directors_no_dup.tsv'
writer_input_file = 'title.crew/writers_no_dup.tsv'
director_output_dir = 'title.crew/directors'
writer_output_dir = 'title.crew/writers'

split_tsv_file(director_input_file, director_output_dir, 'directors', rows_per_file=3000000)
split_tsv_file(writer_input_file, writer_output_dir, 'writers', rows_per_file=3000000)