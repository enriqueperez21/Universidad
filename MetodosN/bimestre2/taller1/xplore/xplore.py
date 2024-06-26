import json
from collections import defaultdict

# Datos de entrada
N = 10
entries = [
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Echo"}, {"author_order": 2,"affiliation": "","full_name": "Bravo"}, {"author_order": 3,"affiliation": "","full_name": "Alfa"}]},"title": "Article Title 1","article_number": "1","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 9,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Charlie"}, {"author_order": 2,"affiliation": "","full_name": "Bravo"}]},"title": "Article Title 2","article_number": "2","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 9,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Echo"}, {"author_order": 2,"affiliation": "","full_name": "Delta"}, {"author_order": 3,"affiliation": "","full_name": "Alfa"}, {"author_order": 4,"affiliation": "","full_name": "Charlie"}]},"title": "Article Title 3","article_number": "3","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 4,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Charlie"}]},"title": "Article Title 4","article_number": "4","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 9,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Charlie"}, {"author_order": 2,"affiliation": "","full_name": "Echo"}, {"author_order": 3,"affiliation": "","full_name": "Alfa"}]},"title": "Article Title 5","article_number": "5","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 5,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Charlie"}, {"author_order": 2,"affiliation": "","full_name": "Echo"}]},"title": "Article Title 6","article_number": "6","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 6,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Delta"}]},"title": "Article Title 7","article_number": "7","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 4,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Charlie"}]},"title": "Article Title 8","article_number": "8","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 9,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Delta"}, {"author_order": 2,"affiliation": "","full_name": "Charlie"}]},"title": "Article Title 9","article_number": "9","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 4,"publisher": "IEEE"}',
    '{"authors": {"authors": [{"author_order": 1,"affiliation": "","full_name": "Bravo"}, {"author_order": 2,"affiliation": "","full_name": "Echo"}]},"title": "Article Title 10","article_number": "10","publication_title": "Publication Title 1","publication_number": "7","citing_paper_count": 6,"publisher": "IEEE"}'
]

# Procesar los datos
author_citations = defaultdict(list)

for entry in entries:
    data = json.loads(entry)
    citing_paper_count = data['citing_paper_count']
    for author in data['authors']['authors']:
        author_name = author['full_name']
        author_citations[author_name].append(citing_paper_count)

# Calcular el h-index de cada autor
def calculate_h_index(citations):
    citations.sort(reverse=True)
    h_index = 0
    for i, c in enumerate(citations):
        if i + 1 <= c:
            h_index = i + 1
        else:
            break
    return h_index

author_h_index = {author: calculate_h_index(citations) for author, citations in author_citations.items()}

# Paso 4: Ordenar los autores por h-index y por nombre alfabético en caso de empate
sorted_authors = sorted(author_h_index.items(), key=lambda x: (-x[1], x[0]))

# Paso 5: Imprimir los resultados
for author, h_index in sorted_authors:
    print(f"{author} {h_index}")