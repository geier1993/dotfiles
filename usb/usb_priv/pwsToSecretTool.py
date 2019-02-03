#!/bin/python
import subprocess as sp
import yaml 
from collections import ChainMap
from functools import reduce

data = yaml.load(open(".pws"))

for key in data:
    print(key)
    d = dict(ChainMap(*data[key]))
    if("password" in d.keys()):
        pw = d['password']
        del d['password']
        attrvals = list(reduce(lambda x,y: x+y, ChainMap(*data[key]).items()))
        com = sp.Popen(['secret-tool','store',"--label="+key]+attrvals,stdout=sp.PIPE,stdin=sp.PIPE)
        com.communicate(str.encode(pw))
