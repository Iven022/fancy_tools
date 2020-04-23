
if [[ -d ~/bin ]] #checking if bin folder exsists
then
	echo "No need to create the bin folder, you already have one."
else 
	mkdir ~/bin #creating bin folder	
fi

cd ~/bin
dir=$(pwd)
if ! [[ $PATH =~ "$dir" ]]; then #checking if folder is in the path already
	echo "export PATH=$PATH:$dir" >> "$FILE" #adding the folder to the path
fi

if [[ -d ~/src ]] #checking if src folder exists
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

LINE="source ~/src/fancy_tools/fancy_functions.sh"
FILE=~/.bashrc
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE" #checking if line exists in .bashrc

LINE2="source ~/src/fancy_tools/.aliases"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"

cp ~/src/fancy_tools/bin/updateFancyTools ~/bin/updateFancyTools #copying the file updatefancytools to the bin folder which is in the path. 


echo "Installation completed !"
