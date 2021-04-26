red='\e[1;31m'
function error()
{
 ts=$?
 if [ $ts != 0 ]; then
   echo -e $red ""
   echo "  An Error Was Occured ! "
   echo
 fi
}
error
