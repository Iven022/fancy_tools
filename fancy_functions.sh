function gco
{
	branch_name="$(git symbolic-ref HEAD 2>/dev/null)" || echo "Error"  
	branch_name=${branch_name##refs/heads/}
	
	git commit -m "[$branch_name] $*"		
	
}


