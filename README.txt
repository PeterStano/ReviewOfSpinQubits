Summary
-------


The document explains 
A. how the review database is stored; versioning, copyright
B. how to report errors or omissions
C. how to produce your own table
D. how to produce your own figure




A. How the review database is stored; versioning, copyright
-----------------------------------------------------------


The review database is provided in GitHub project
https://github.com/PeterStano/ReviewOfSpinQubits
It contains the article body and its tables as text files. The tables include all data shown in review figures. The repository versions are controlled by GitHub commits, using Tags to highlight article arXiv or published versions.


The directory "reviewSources" contains the tables as latex-format text files named "Table-I-1.txt" and similar. It also includes the bibtex files with all references cited in the review, named "spinReview-bibtex-Western.1.bib" and "spinReview-bibtex-Western.2.bib". Here, bibtex is the format (that is, the files are NOT in the biblatex format) and Western is the font encoding. Finally, there is the arXiv-version of the main latex source file, spinReviewTables.tex, and its separately stored part Glossary.txt. The main file is included so that incremental changes to the review text can be inspected using GitHub.


This GitHub project is licensed under CC-BY-4.0. In short, it means that you can freely use the material upon giving proper credit to the source. Especially, you can download the data files and change them, for example, to produce stand-alone tables and similar.
Giving credit means acknowledging, in a form reasonable for your document, the following as the source:
P. Stano, D. Loss, Review of performance metrics of spin qubits in gated semiconducting nanostructures, arxiv:2107.06485.






B. How to report an error in the review
---------------------------------------


1. The preferred way is to create a git pull request directly on the text file which contains the wrong entry: 
 - locate the Table-X-Y.txt file containing the error in the GitHub directory "reviewSources"
 - edit the file, correcting the error
 - create a new Pull request in GitHub, explaining why a change is needed in the Pull request Comment.


2. The alternative way is to send an email to the corresponding author identifying the coordinates (table number, subtable number, table row, table column) of the wrong entry and explaining what and why needs a change. For example:

What is wrong: In Table-I-1, Column "Material" Row 1, the correct entry should be: "Si/SiGe" instead of the wrong entry: "28Si/SiGe".
Why it is wrong: The sample material is stated in Methods Section 1 on page 8.




C. How to produce your own table
--------------------------------


The simplest way is to use the script makeTable-script.txt in the GitHub project parent directory.
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
 

