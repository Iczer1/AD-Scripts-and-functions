Function GetPDCFQDN {
        #Find the PDCEmulator in the domain and uses that to perform all AD tasks that require consistent AD data
        #Find PDC
        Try{
            $DC = Get-ADDomain -ErrorAction Stop | Select -ExpandProperty PDCEmulator -First 1
        }#Try
        Catch {
            Throw $_
        }#Catch
        #Test connection
        If (Get-ADDomain -Server $DC) {
            Return $DC
        }#If
        Else {
            Throw "Can't connect to found PDC ($DC)" 
        }#Else
}#Function GetPDCFQDN 
