import sys
import json

stdin_fileno = sys.stdin

stdout_fileno = sys.stdout

f = json.loads(stdin_fileno.read())
print('\t'.join(["stat"] + list(f.keys())).replace(" ", "_"))
stats_to_parse = f[list(f.keys())[0]].keys()
levels = f.keys()
for s in stats_to_parse:
#	print([str(f[l][s]) for l in levels])
	print(s + "\t" + '\t'.join([str(f[l][s]) for l in levels]))
