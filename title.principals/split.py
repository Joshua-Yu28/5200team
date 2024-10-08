import csv
import os

input_file = 'title.principals/title.principals.tsv'
output_folder = 'title.principals/split_files/'
output_file_prefix = 'title.principals_part_'
rows_per_file = 10_000_000  # Split every 10 million rows

# Create the output directory if it doesn't exist
os.makedirs(output_folder, exist_ok=True)

# Open the input file
with open(input_file, 'r', newline='', encoding='utf-8') as infile:
    reader = csv.reader(infile, delimiter='\t')
    
    # Read the header
    header = next(reader)
    
    file_count = 1
    row_count = 0
    output_file = os.path.join(output_folder, f"{output_file_prefix}{file_count}.tsv")
    
    # Open the first output file
    outfile = open(output_file, 'w', newline='', encoding='utf-8')
    writer = csv.writer(outfile, delimiter='\t')
    
    # Write the header to the new file
    writer.writerow(header)
    
    for row in reader:
        if row_count >= rows_per_file:
            # Close the current output file and start a new one
            outfile.close()
            file_count += 1
            output_file = os.path.join(output_folder, f"{output_file_prefix}{file_count}.tsv")
            outfile = open(output_file, 'w', newline='', encoding='utf-8')
            writer = csv.writer(outfile, delimiter='\t')
            writer.writerow(header)  # Write the header to the new file
            row_count = 0  # Reset row count for the new file
        
        # Write the row to the current file
        writer.writerow(row)
        row_count += 1

    # Close the last output file
    outfile.close()

print(f"Splitting complete! {file_count} files created in {output_folder}")
