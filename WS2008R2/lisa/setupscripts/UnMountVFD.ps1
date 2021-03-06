########################################################################
#
# Linux on Hyper-V and Azure Test Code, ver. 1.0.0
# Copyright (c) Microsoft Corporation
#
# All rights reserved. 
# Licensed under the Apache License, Version 2.0 (the ""License"");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0  
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR CONDITIONS
# OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
# ANY IMPLIED WARRANTIES OR CONDITIONS OF TITLE, FITNESS FOR A PARTICULAR
# PURPOSE, MERCHANTABLITY OR NON-INFRINGEMENT.
#
# See the Apache Version 2.0 License for specific language governing
# permissions and limitations under the License.
#
########################################################################


<#
.Synopsis
    

.Description
    

.Parameter vmName
    

.Parameter hvServer
    

.Parameter testParams
    

.Example
    
#>
#######################################################################
#
# UnMountVFD
#
# Description:
#   Unmount a .vfd file from a VMs floppy drive.
#
#######################################################################
param([string] $vmName, [string] $hvServer, [string] $testParams)

"UMountVFD.ps1 -vmName $vmName -hvServer $hvServer -testParams $testParams"

$sts = get-module | select-string -pattern HyperV -quiet
if (! $sts)
{
    Import-module .\HyperVLibV2Sp1\Hyperv.psd1
}

#
# If a .vfd is mounted, unmount it.
#
$vfd = Get-VMFloppyDisk -vm $vmName -server $hvServer
if ($vfd -ne $null)
{
    Remove-VMFloppyDisk -vm $vmName -server $hvServer -Force
    ".vfd file successfully unmounted"
}
else
{
    "No .vfd file was mounted"
}

return $true