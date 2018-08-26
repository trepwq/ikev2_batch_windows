Remove-VpnConnection -Name "成都办公室" -Force

Add-VpnConnection -Name "成都办公室" -ServerAddress "chengdu.example.com" -AuthenticationMethod "Eap" -EncryptionLevel "Maximum" -RememberCredential -TunnelType "Ikev2"

Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256"

Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule"

New-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1 -propertyType dword

New-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule" -value 2 -propertyType dword

Set-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1

Set-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2
