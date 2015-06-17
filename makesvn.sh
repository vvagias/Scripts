#/bin/sh
# Get user input and create a basic svn project
echo "What would you like to call this project"
read project
mkdir $project
mkdir $project/trunk
mkdir $project/tags
mkdir $project/branches
echo "Project $project has been created"
echo "import to svn ? (y/n): "
read svnimp
if test $svnimp = "y";
	then
	echo "Enter svn user:"
	read svnuser
	#echo "Enter Hostname:"
	#read H
	# substitute  $H ==> $HOSTNAME bellow and uncomment above for specified hostname at prompt...

	svn import $project svn://$svnuser@$H/Users/vv/DevTools/svn/$project -m "automated import of project $project "
	rm -R $project
	svn co svn://$svnuser/Users/vv/DevTools/svn/$project
	echo "All done master"
else
	echo "Then you're using the wrong fucking tool jack ;)"
fi
