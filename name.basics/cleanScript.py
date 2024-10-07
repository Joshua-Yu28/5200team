import csv 
import os 

def delete_output_files(file_list):
    for file in file_list:
        try:
            os.remove(file)
            print(f"Deleted file: {file}")
        except FileNotFoundError:
            print(f"File not found: {file}")
        except Exception as e:
            print(f"Error deleting file {file}: {e}")


def create_people_titles_mapping(input_file, output_file, mapping_file):
    
    with open(input_file, 'r', encoding='utf-8') as infile:
        reader = csv.reader(infile, delimiter='\t')

        with open(mapping_file, 'w', encoding='utf-8', newline='') as mappingfile, \
            open(output_file, 'w', encoding='utf-8', newline='') as outfile:
            
            mapping_writer = csv.writer(mappingfile, delimiter='\t')
            output_writer = csv.writer(outfile, delimiter='\t')

            header_row = next(reader)
            output_writer.writerow(header_row[:5])

            mapping_writer.writerow(['nconst', 'tconst'])

            PeopleCounter = 0

            for row in reader:
                nconst = row[0]
                known_for_titles = row[5]

                if nconst[:2] != 'nm':
                    print(f"Invalid nconst: {nconst}")
                if len(nconst) > 10:
                    print(f"nconst too long: {nconst}")

                output_row = row[:5]
                output_writer.writerow(output_row)

                PeopleCounter += 1

                if known_for_titles and known_for_titles != '\\N':
                    title_list = known_for_titles.split(',')

                    for titleId in title_list:
                        if titleId[:2] != 'tt':
                            print(f"Invalid titleId: {titleId}")
                        if len(titleId) > 10:
                            print(f"titleId too long: {titleId}")
                        mapping_writer.writerow([nconst.strip(), titleId.strip()])

            print(f"Total people: {PeopleCounter}")



input_file = 'name.basics/name.basics.tsv'
output_file = 'name.basics/name_basics_no_knownForTitles.tsv'
mapping_file = 'name.basics/people_titles_mapping.tsv'

fileList = [output_file, mapping_file]


delete_output_files(fileList)


create_people_titles_mapping(input_file, output_file, mapping_file)