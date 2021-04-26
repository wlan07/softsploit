#
#
#
red='\033[1;31m'
reset='\033[0m'
if [ ! -f ~/.android/debug.keystore ]; then
     echo -e "$red"
     echo "    NO DEBUG KEY ! "
     if [ ! -d "~/.android" ]; then
       mkdir ~/.android > /dev/null 2>&1
     fi
     echo -e "$reset"
     keytool -genkey -v -keystore ~/.android/debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000 > /dev/null 2>&1
 fi
