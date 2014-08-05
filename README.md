POSH-Commander
==============

Invoke remote powershell scripts in memory of compromised hosts.

This Cortana script works with a Metasploit module to allow you to utilize Powershell's Invoke Expression (IEX) 
and .Net functionalities to download and run a script in memory on your target Windows host. Once a compromised Windows host
is activated in Armitage/Cortana, a menu is presented upon right-click of the host. 

Prerequisite: Place the remote_powershell.rb Metasploit module in your "metasploit-framework/modules/post/windows/manage/" directory.

Created by: rvrsh3ll

Veil Project: https://github.com/Veil-Framework/
PowerView and PowerUp blog by harmj0y: http://blog.harmj0y.net/
Misc. Powershell Commands: http://ss64.com/ps/
