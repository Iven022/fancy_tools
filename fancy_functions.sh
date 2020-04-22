function gco
{
	temp=0
	branch_name="$(git symbolic-ref HEAD 2>/dev/null)" || temp=1 
	branch_name=${branch_name##refs/heads/}
	
	if [ $temp = 0 ]
	then
		git commit -m "[$branch_name] $*"		
	else 
		echo "Not a git repository"
	fi 
}
















































