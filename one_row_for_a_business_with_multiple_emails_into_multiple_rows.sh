#README: 
#source: https://superuser.com/questions/1008939/splitting-a
#row-with-one-company-in-a-column-and-multiple-email-addresses
#in-oth/1008990
#I have data in Excel that looks like this:

#column1 column2 column3, column4, column5
#Company1 email1 email2 email3
#Company2 email1 email2
#Company3 email1 email2 email3 email4 email5
#I have about 25k rows of this data some maybe 25k companies #and 40k email addresses. I'd like to make the data look like #this:

#Company1 email1
#Company1 email2
#Company1 email3
#Company2 email1
#etc.

#Explanation:

#awk reads in the file line by line, it splits up each line into
#'fields' (i.e. columns) using the comma as delimiter (-F,),
#each field is called $1 up. It skips the first line (headers),
#then for each line it creates a series of lines where each
#field is on a separate line preceded by the first field. The
#output is written back to a new file. You can open this new
#file in Excel.  Test

awk -F, '{if (NR>1) {if (NF==1) {print $1} else {for (f=2; f<=NF; c++) printf}}}' ./contact list.csv >./mynewfile.csv


