import csv

input_file = 'title.principals/title.principals.tsv'

categories = set()


with open(input_file, 'r', newline='', encoding='utf-8') as f:
    reader = csv.DictReader(f, delimiter='\t')
    for row in reader:
        categories.add(row['category'])


print(categories)