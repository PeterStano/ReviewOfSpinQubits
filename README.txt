Summary
-------


The document explains 
A. how the review database is stored; versioning, copyright
B. how to report errors or omissions
C. how to produce your own table
D. how to produce your own figure




A. How the review database is stored; versioning, copyright
-----------------------------------------------------------


The review database is provided in github project
https://github.project.com/
It contains the review tables as text files in latex format. These tables include all data used in review figures.

The most recent version is in folder "latestVersion".
Previous versions are in folders with the following name format:
"previousVersion-YYYY-MM-DD-arxiv-vAA",
where "YYYY-MM-DD" is the version date and "vAA" is the corresponding arxiv version.

These directories contain the latex input files used to create the review article as text files named "Table-I-1.txt" and similar. It also contains the bibtex files with all references cited in the review, named "2021-spin-review-bibtex-Western.bib" and "Selected-bibtex-Western.bib". Here, bibtex is the format (e.g. the files are not in the biblatex format) and Western is the font encoding.


Upon giving proper credit to the source, you can download the data files from github and change them, for example, to produce stand-alone tables and similar.
PLEASE INSERT MORE ON COPYRIGHT (FOR EDITOR).




B. How to report an error in the review
---------------------------------------


1. The preferred way is to create a git pull request directly on the text file which contains the wrong entry: 
 - locate the Table-X-Y.txt file containing the error in the github directory "latestVersion"
 - edit the file, correcting the error
 - create a new Pull request in github, explaining why a change is needed in the Pull request Comment.


2. The alternative way is to send an email to the corresponding author identifying the coordinates (table number, subtable number, table row, table column) of the wrong entry and explaining what and why needs a change. For example:

What is wrong: In Table-I-1, Column "Material" Row 1, the correct entry should be: "Si/SiGe" instead of the wrong entry: "28Si/SiGe".
Why it is wrong: The sample material is stated in Methods Section 1 on page 8.




C. How to produce your own table
--------------------------------


The simplest way is to use the script makeTable-script.txt in the parent directory.
The result of running the script for "Table-I-1.txt", by 
makeTable-script.txt --tableName=Table-I-1
is the file "Table-I-1.pdf".
(tested with Tex installation TexLive2021 on MacOS Catalina 10.15.7) 


Alternatively, one can produce the table manually, possibly making additional changes, by:

1) Editing three lines in the provided file makeTable.tex (see comments inside that file)

2) processing it by 
pdflatex makeTable.tex
bibtex 	 makeTable
pdflatex makeTable.tex
pdflatex makeTable.tex




D. How to produce your own figure (not yet available)
-----------------------------------------------------

We plan to provide an interface to produce figures analogous to those in the review. The user will be able to choose the quantities on the x and y axis, what to sort by colors and symbols, and what additional filters to apply on the data.  
 

