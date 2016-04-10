winsock2 internet functions

--------------------------------------------------------------------------------

this sample was contributed by steve bryndin

i have written a small mfc class that allows you to ping remote computers over internet. this class is very similar to one posted by les jordan but it doesn't use icmp.dll. instead it uses normal ws2_32.dll.

this class is a mixture of les jordan class(address resolution functions) and sdk ping example.

you must make sure that ws2_32.dll and ws2_32.lib is present on your system(nt4.0 with service pack 3 normally should have this dll on the system, i didn't see on the windows 95, but microsoft claims that it is available for 95 as well).

include winsock2.h in stdafx.h file. in linker specify ws2_32.lib.

you would have to call wsastartup from application entry point. don't call afxsocketinit(), it will not work.

this class performs following functions: 

pings remote computer. 
retrieves time on remote computer(if their time service is running). 
checks alive ports on remote computer. 
resolves ip address to host name. 
resolves host name to ip address. 
this class includes 5 public functions:

	cstring getremotetime(cstring strhost);
	bool scanports(cstring strhost, live_ports *pports, uint nport);
	cstring ping(cstring strhost, uint npacketsize);
	cstring resolvehosttoip(cstring strhost);
	cstring resolveiptohost(cstring strip);

getremotetime: 
accepts host name in form "anyhost.anydomain.com". it returns formatted cstring that contain remote computer's time.

scanports:
strhostorip - cstring with host name in form "anyhost.anydomain.com".
pports - address of structure: 

	typedef struct taglive_ports
	{
		cstring	strname;      // name of service running on this port
		cstring	straliases;   // service aliases.
		short       s_port;   // port number.
   		cstring     strproto; // protocol used.
	}live_ports;

nport - unsigned integer port number.
return value: if functions succeeds return value is true and structure live_ports is populated with port data. if the function fails, return value is false, structure is empty.

ping: 
strhost - host name in form "anyhost.anydomain.com".
npacketsize - size of packet in bytes. if the value is 0, then default 32 bytes sent to the remote computer.
return value: formatted cstring in form "64 bytes from 10.10.0.1: icmp_seq=0, time = 3.1 ms". 

resolvehosttoip: accepts host name in form "anyhost.anydomain.com". it returns ip address in form "xxx.xxx.xxx.xxx".

resolveiptohost: accepts ip address in form "xxx.xxx.xxx.xxx". it returns host name in form "anyhost.anydomain.com". 

download source

posted on: april 10, 98. 

