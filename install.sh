
dir=$(pwd) #getting current directory pathway of the fancy_tools folder

LINE="source ~/src/fancy_tools/fancy_functions.sh"
FILE=~/.bashrc
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE" #checking if line exists in .bashrc

LINE2="source $dir/.aliases"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"


temp="$dir/bin"
if ! [[ $PATH =~ "$temp" ]]; then #checking if path already exists in .bashrc
	echo "export PATH=$PATH:$dir/bin" >> "$FILE"
fi




if [[ -d ~/src ]]
then
	echo "No need to create the src folder, you already have one."
else 
	mkdir ~/src	
fi




cd ~/src #going to the src folder



if [[ -d ~/src/fancy_tools ]]
then
	echo "No need to clone the fancy tools repository in the src folder, you already have it. Update it from the updateFancyTools script if necessary"
else 
	git clone --single-branch --branch master https://github.com/Iven022/fancy_tools.git
fi


