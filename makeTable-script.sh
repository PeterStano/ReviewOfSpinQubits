#tested with GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin19)

########### script usage ##########
usage="usage:
makeTable-script.txt --tableName=Table-X-Y
where X is the table number and Y is the table subnumber, as used in the review.

The script makes minor changes in the file makeTable.tex and processes it by latex and bibtex. Amend directly the file makeTable.tex for more flexibility."


########### reading arguments ##########
while [ $# -gt 0 ]; do
  case "$1" in
    --tableName=*)
      tableName="${1#*=}"
      ;;
    *)
      echo "****************************"
      echo "* Error: invalid argument. *"
      echo "****************************"
      echo "${usage}"
      exit 1
  esac
  shift
done


########### checking arguments ##########
if [ -z "$tableName" ]; then 
  echo "*******************************************"
  echo "* Error: argument tableName not provided. *"
  echo "*******************************************"
  echo "${usage}"
  exit
fi

if [ -f "reviewSources/${tableName}.txt" ]; then
    #echo "file '${tableName}.txt' found."
    :
  else
    echo "**********************************"
    echo "* Error: ${tableName}.txt not found. *"
    echo "**********************************"
    echo "${usage}"
    exit 1
fi


########### amend the latex file  ##########
cd reviewSources
cp ../makeTable.tex  tmp.tex
sed -i '' 's/\\Roman{table}-\\arabic{subtable}/'"${tableName:6}"'/g' tmp.tex 
#sed -i 's/%PLACEHOLDER/\\renewcommand\\thetable{'"${tableName:6}}"'/g' tmp.tex
sed -i '' 's/\\input{Table-I-1/\\input{'"${tableName}"'/g' tmp.tex


########### process the latex file  ##########
pdflatex tmp.tex
bibtex tmp
pdflatex tmp.tex
pdflatex tmp.tex

########### finish  ##########
mv tmp.pdf ${tableName}.pdf
rm tmp.*  tmpNotes.bib
cd ..



