FILE=~/.bashrc

#checking if bin folder exists and if not create one in home. 
if [[ -d ~/bin ]] 
then
	echo "No need to create the bin folder, you already have one."
else 
	mkdir ~/bin 	
fi

#checking if ~/bin is in the path and if not put it in.
cd ~/bin
dir=$(pwd)
if ! [[ $PATH =~ "$dir" ]]; then
	echo "export PATH=$PATH:$dir" >> "$FILE" 
fi

#checking if `/src already exists and if not create it.
if [[ -d ~/src ]] 
then
	echo "No need to create the src folder, you already have one."
else 
	mkdir ~/src 	
fi

#going to the src folder and checking if fancy_tools has already been clone there and if not, clone it.
cd ~/src 
if [[ -d ~/src/fancy_tools ]]
then
	echo "No need to clone the fancy tools repository in the src folder, you already have it. Update it from the updateFancyTools script if necessary"
else 
	git clone --single-branch --branch master https://github.com/Iven022/fancy_tools.git
fi

#adding the source lines to the file .bashrc
LINE="source ~/src/fancy_tools/fancy_functions.sh"
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE" #checking if line exists in .bashrc

LINE2="source ~/src/fancy_tools/.aliases"
grep -qF -- "$LINE2" "$FILE" || echo "$LINE2" >> "$FILE"


#copying the updtaefancytools file to the bin folder which is in the path
cd ~/bin
cp ~/src/fancy_tools/bin/updateFancyTools ~/bin/updateFancyTools
chmod +x updateFancyTools #giving it executable rights

echo -e " \e[5mInstallation Completed \e[25m!"

