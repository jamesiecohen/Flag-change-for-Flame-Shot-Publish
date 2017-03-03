#!/usr/bin/python

import os
import sys

#python interpreter changes to the directory of the python script
os.chdir(os.path.dirname(sys.argv[0]))
base = os.getcwd()
#confirm that worked
print "Searching in this directory {0}".format(base)

#blank list of files we will change
list_of_files_to_change = []

#looking for files with this extension
extension_to_match = '.export_node'

text_to_search = '<VersionFollowIteration>False'
text_to_replace = '<VersionFollowIteration>True'

#do a recursive search through directories for files ending in extension_to_match
for root, dirs, files in os.walk(base):
    for file in files:
        if file.endswith(extension_to_match):
            #append those file names with full path to list         
            list_of_files_to_change.append(os.path.join(root, file))
             

for i in list_of_files_to_change:
    # Read in the file
    with open(i, 'r') as file :
        filedata = file.read()

    # Replace the target string
    if text_to_search in filedata:
        print "Replacing {0} with {1} in file named {2}".format(text_to_search, text_to_replace, i)
    filedata = filedata.replace(text_to_search, text_to_replace)

    # Write the file out again
    with open(i, 'w') as file:
        file.write(filedata)

    
