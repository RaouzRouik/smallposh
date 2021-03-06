clear
$Hostname = Read-Host -Prompt "Please Enter the target to scan (Example: 192.168.0.1 or test.com)"
$results=@() ;$details=@()
$File = ".\ports.txt"
$_Ports = Get-Content $File #For hardcoded, use: $_Ports = @(21,22,80,443,902,3389,etc...)
$Report = "$HostName-report.csv"
echo "working..."
 If (Test-Connection -count 1 -comp $HostName -quiet) {
    $details = @{        
            Date             = get-date              
            ComputerName     = $Hostname                 
            IPAddress        = $IP
            Online           = "Yes"
            Ports            = "" 
    }                           
    foreach ($_Port in $_Ports) {     
        try {
            $TestPort = QueryPort $HostName $_Port
            if ($TestPort.Length -eq 0){ echo $_Port 
            } else { 
                echo "$_Port : $TestPort"
                $details.Ports += $TestPort + "`r`n"
            }
        } catch { }
    }
    $results += New-Object PSObject -Property $details
} Clear; $results

function QueryPort ([string]$HostName, [string]$Port) {   
    $socket = New-Object System.Net.Sockets.TCPClient
    $connected = ($socket.BeginConnect( $HostName, $Port, $Null, $Null )).AsyncWaitHandle.WaitOne(500)
    if ($connected -eq "True"){
        $stream = $socket.getStream() 
        Start-Sleep -m 1000; $text = ""
        while ($stream.DataAvailable) { $text += [char]$stream.ReadByte() }
        if ($text.Length -eq 0){ $text = "No Banner Given"}
        $text = "TCP:$Port is open : $text"
        $text
        $socket.Close()
    } else { }