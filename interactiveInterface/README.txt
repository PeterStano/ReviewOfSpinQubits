Summary
-------


The document explains the database interactive interface.

A. Requirements and installation
C. An interactive table
D. An interactive figure






A. Requirements and installation
--------------------------------

You need a recent version of Mathematica or its functional equivalent installed on your computer. There is no installation needed apart from downloading (or 'cloning') the github repository on your local disk. The repository folder contains subfolder 'interactiveInterface' which contains the Mathematica notebook interactiveInterface_User.nb. To access the database, open the notebook and execute the command interactiveInterface[].

Note: The provided Mathematica code was created on a Mac with macOS Catalina with Mathematica version 12.2 and MacTeX 2022. It was tested successfully on various Macs with Mathematica versions 12.2, 12.0, and 13.0.1. It fails with Mathematica version 9.0 and it runs with issues in the figure design with version 10.4. Based on this experience, different versions of Mathematica often result in slight differences in the figure appearance (such as padding, background color, and similar). I will appreciate feedback if you find the code not working properly.




B. An interactive table
-----------------------

The interactive interface is implemented through Mathematica command Manipulate. There are a few controls, mostly pulldown menus, selecting what is shown and how. I describe them as they are shown on the screen from top to bottom.


A comment to understand the pulldown menus:
Some of them are choosing database "attributes". Each attribute has both a short and a long version of its name. For example, for the attribute "coherence time" the two are "coherenceTime" and "Time" respectively. Some controls use long names (for unambiguous discrimination) and some short names (to fit the table on the screen).
 


The table controls:

"Database records for:" 
selects the primary quantity of interest. Typically, it will be one of the first 5 items offered. Table columns (below) are reset to default values upon changing the selection. 

"Filter records" 
optionally applies filters to the selected database records. A filter consists of an attribute and a value, related by one of four relation operators: exists, equals-to, differs-from, and contains-string (for String-valued attributes only). There can be an arbitrary number of filters applied. They are combined through the logical AND.

"Show first 1/10/50/all"
restricts number of rows to show. Since Mathematica Manipulate might be responding slowly, showing less rows while designing the table might help a bit.

"Export all records to LaTeX"
It produces a new TeX file with a name something like table-X.tex in subfolder 'output' of the interactiveInterface folder. This file can be directly compiled by processing it by the standard commands pdflatex-bibtex-pdflatex-pdflatex (tested on MacTex 2022; you might need to install additional LaTeX packages, depending on the status of your local LaTeX installation). The file will include references, taken from bib-files 'spinReview-bibtex-Western.1.bib' and 'spinReview-bibtex-Western.2.bib' provided in the github repository in 'reviewSources' directory. The LaTeX table will include / not include notes depending on the setting on the right.

A row of pulldown menus selecting the table columns. The strings shown are the short names of the attributes. You can delete any column by choosing 'None".

A row of pulldown menus selecting how the table rows are sorted. A dash means no sorting, "SortKey-X" means the value in the column will be used in sorting, the priority decided by the value of "X".






D. An interactive figure
------------------------


Once satisfied with the table design (see the above point), its data can be plotted. Since plotting is slower (few seconds on my machine), it is not updated automatically, but manually, by clicking the button "Refresh plot".

Two choices for the figure are made by designing the table. First, the figure will plot the 'primary quantity of interest' chosen by the first table control. Second, the table columns will be included in figure data-point tooltips. The remaining controls are as follows.


The figure controls:



"x-axis"
attribute serving as the plot abscissa.

"data-point color" and "data-point marker"
attribute defining the data-point colors and markers. It can be None.

"Preview plot/Full plot"
a preview will plot only 10 data points. It will be faster to design a plot using preview.

"Refresh plot"
shows the plot for current choices.

"export format"
format for exporting into a file.

"Export plot to -format-"
export the current plot into a file into folder 'interactiveInterface/output'.

"Basic controls / Advanced controls"
choosing advanced controls allows further choices for fine tuning the plot appearance.



The advanced controls:


"merge materials"
whether or not merge material into groups, such as GaAs and InAs becoming III-V.

"Legends"
	"separator"
	True = insert an empty legend item between legends for color and marker

	"split by hand"
	True = split legend items to groups by hand

	"group counts"
	the Mathematica List specifying the number of items in each group

"x/y-label replacement"
must be a Mathematica List of Rule[ String, String ]

"Panel box"
True = insert a boxed text in a figure corner

	"text"
	text in the box

	"position"
	in which corner to put the box

The remaining controls should be self-explanatory. The last control expects a list of Mathematica Options which will be handed over to Mathematica Plot function. It might help in fine-tuning the figure or solving issues related to different versions of Mathematica.
