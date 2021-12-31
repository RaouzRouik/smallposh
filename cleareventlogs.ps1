Get-EventLog -LogName * | ForEach { Clear-EventLog $_.Log }
