import csv 

input_file = 'title.crew/title.crew.tsv'
directors_out = 'title.crew/directors.tsv'
writers_out = 'title.crew/writers.tsv'

with open(input_file, 'r', newline='', encoding='utf-8') as infile:
    with open (directors_out, 'w', newline='', encoding='utf-8') as directorsfile, \
        open (writers_out, 'w', newline='', encoding='utf-8') as writersfile:
        
        reader = csv.DictReader(infile, delimiter='\t')
        directors_writer = csv.writer(directorsfile, delimiter='\t')
        writers_writer = csv.writer(writersfile, delimiter='\t')

        directors_writer.writerow(['tconst', 'nconst'])
        writers_writer.writerow(['tconst', 'nconst'])

        directorsSet = set()
        writersSet = set()

        for row in reader:
            tconst = row['tconst'].strip()
            if len(tconst) > 10 or tconst[:2] != 'tt':
                print(f'Invalid tconst: {tconst}')


            directors = row['directors']
            if directors != '\\N':
                director_list = directors.split(',')
                for director in director_list:
                    director = director.strip()
                    if (tconst, director) in directorsSet:
                        print(f'Duplicate entry: {tconst}, {director}')
                        continue
                    if len(director) > 10 or director[:2] != 'nm':
                        print(f'Invalid nconst: {director}')

                    directorsSet.add((tconst, director))
                    directors_writer.writerow([tconst, director])
            

            writers = row['writers']
            if writers != '\\N':
                writer_list = writers.split(',')
                for writer in writer_list:
                    writer = writer.strip()
                    if (tconst, writer) in writersSet:
                        print(f'Duplicate entry: {tconst}, {writer}')
                        continue
                    if len(writer) > 10 or writer[:2] != 'nm':
                        print(f'Invalid nconst: {writer}')

                    writersSet.add((tconst, writer))
                    writers_writer.writerow([tconst, director])
