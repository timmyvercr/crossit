
#Workgroup
#
function Get-WorkgroupUser-SID {

    $account = Get-User-Input("Username:")
    $objUser = New-Object System.Security.Principal.NTAccount($account)
    $strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
    $strSID.Value
    }
    #
    # Domain
    #
    
    Function Get-domainuser-SID {
    
    $domain = Get-User-Input ("Domain: ")
    $account = Get-User-Input("User Name: ")
    $objUser = New-Object System.Security.Principal.NTAccount($domain,$account)
    $strSID = $objUser.Translate({System.Security.Principal.SecurityIdentifier})
    $strSID.Value
    }
    
    
    #
    # Local User
    #
    function Get-LocalUser-SID {
    $user = $env:USERNAME
    $domain = $env:USERDOMAIN
    $objUser = New-Object System.Security.Principal.NTAccount($domain,$user)
    $strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
    $strSID.Value
    }
    
    function SID2Name {
    $inputSID = Get-User-Input("What is the SID")
    
    $objSID = New-Object System.Security.Principal.SecurityIdentifier `
        ($inputSID)
    $objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
    Write-Output ($objUser.Value)
    
    }
    
    function Get-User-Input($displayText){
    $displayText = $displayText + "? "
    $variableName=read-host $displayText
    return($variableName)
    }
    

$sid = New-Object System.Security.Principal.SecurityIdentifier ("S-1-5-21-105005785-2143699225-541720777-501") 
$c = New-Object 'byte[]' $sid.BinaryLength 
$sid.GetBinaryForm($c, 0) 