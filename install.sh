
dir=$(pwd) #getting current directory of the fancy_tools directory

LINE="source $dir/fancy_functions.sh"
FILE=~/.bashrc
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE" #checking if line exists in .bashrc

LINE2="source $dir/.aliases"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"


temp="$dir/bin"
if ! [[ $PATH =~ "$temp" ]]; then #checking if path already exists in .bashrc
	echo "export PATH=$PATH:$dir/bin" >> "$FILE"
fi
