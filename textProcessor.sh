#Text Processor
echo "Enter the filename to process: "
read file

if [[ ! -f "$file" ]]; then
echo "Error: File not found."
exit 1
fi


#Gives user options to choose an option for their file
while true; do
#Menu screen
echo "Choose an option:"
echo "1. Word count"
echo "2. Line count"
echo "3. Pattern match (grep)"
echo "4. Extract field (awk)"
echo "5. Replace text (sed)"
echo "0. Exit Program"
echo "Enter option number (1-5): "
read choice
#case program that the user will choose from
case $choice in
1)
#gets word count from file
	echo "Word Count:"
	wc -w "$file"
;;
2)
#gets line count from file
	echo "Line Count:"
	wc -l "$file"
;;
3)
#matches pattern used in file
	echo "Enter regex pattern to search: "
	read pattern
	echo "Matching lines:"
	grep -E "$pattern" "$file"
;;
4)
#Displays matching lines within file
	echo " Enter field number to extract (space-seperated fields): "
	read field
	awk "{print \$$field }" "$file"
;;
5)
#uses the field number to find the word in the field number of each line
	echo "Enter text to replace: "
	read old
	echo "Enter new text: "
	read new
	echo "Modified Text: "
	sed "s?$old/$new/g" "$file"
;;
0)
#Exits the program
echo "Exiting Program..."
break
;;
*)
#makes sure user chooses a valid choice
echo "Invalid Choice. Please enter a number from 0 to 5"
;;
esac
done
