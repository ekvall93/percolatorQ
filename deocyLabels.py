import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--input',required=True)
parser.add_argument('--output',required=True)

args = parser.parse_args()

print(args.input)



def checkFile(path):
    try:
        f = open(path)
        rows = f.readlines()
        f.close()
        return rows
    except IOError:
        print("File not accessible")

def setDecoys(rows, output):
    with open(output, 'w') as f:
        for i, line in enumerate(rows):
            cols = line.split("\t")
            name = cols[-1]
            if "rev_" in name:
                cols[1] = "-1"
            
            new_row = "\t".join(cols)
            f.write(new_row)




rows = checkFile(args.input)
setDecoys(rows, args.output)



