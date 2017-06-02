﻿        function Remove-NSServer{
            <#
            .SYNOPSIS
                Remove a NetScaler Server from the NetScalerConfiguration
            .DESCRIPTION
                Remove a NetScaler Server from the NetScalerConfiguration
            .PARAMETER NSSession
                An existing custom NetScaler Web Request Session object returned by Connect-NSAppliance
            .PARAMETER Name
                Name of the Server.
            .EXAMPLE
                Remove-NSServer -NSSession $Session -Name $ServerName
            .NOTES
                Copyright (c) cognition IT. All rights reserved.
            #>

            [CmdletBinding()]
            param (
                [Parameter(Mandatory=$true)] [PSObject]$NSSession,
                [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] [string]$Name
            )
            Begin {
                Write-Verbose "$($MyInvocation.MyCommand): Enter"
            }
            Process {
                $response = Invoke-NSNitroRestApi -NSSession $NSSession -OperationMethod DELETE -ResourceType server -ResourceName $Name -Verbose:$VerbosePreference
            }
            End {
                Write-Verbose "$($MyInvocation.MyCommand): Exit"
            }
        }
