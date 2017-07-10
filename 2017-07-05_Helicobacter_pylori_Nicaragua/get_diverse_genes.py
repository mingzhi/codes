import operator
with open("runs.txt") as reader:
    runs = [line.rstrip() for line in reader]

counts = {}
idproduct = {}
for run in runs:
    corr_file = "data/%s.corr.txt" % run
    with open(corr_file) as reader:
        header = reader.readline().rstrip().split('\t')
        for line in reader:
            terms = line.rstrip().split('\t')
            p2 = float(terms[header.index('P2')])
            ks = float(terms[header.index('Ks')])
            geneid = terms[header.index('GeneId')]
            product = terms[header.index('GeneProduct')]
            if ks > 0.0001 and p2/ks > 0.01:
                counts[geneid] = counts.get(geneid, 0) + 1
                idproduct[geneid] = product
sorted_x = sorted(counts.items(), key = operator.itemgetter(1))
for geneid, corr in sorted_x:
    print((geneid, idproduct[geneid], corr))