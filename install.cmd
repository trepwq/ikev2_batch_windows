@echo off&PUSHD %~DP0 &TITLE ikev2 VPN安装/卸载程序
mode con cols=160 lines=50
set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
if exist %TempFile_Name% (
del %TempFile_Name% 1>nul 2>nul&&goto :address
) else (
echo;请以管理员身份运行，按任意键退出 &&goto :end
)

:address
cls
echo;请输入办公地点：
echo;1：北京
echo;2：成都
echo;3：重庆
set/p choose1=请输入选项并按回车：
echo %choose1%|findstr /i "[123]">nul&&goto :install
goto :address

:install
cls
echo;请选择安装或者卸载VPN（ikev2）：
echo;i：安装
echo;u：卸载
echo;q：退出
set/p choose2=请输入选项并按回车：
echo %choose2%|findstr /i "[iuq]">nul&&goto :%choose1%%choose2%
goto :install

:1i
cls
echo;安装北京VPN
echo;===========================
echo;***步骤1：删除同名VPN***
(powershell -Command "& {Remove-VpnConnection -Name "北京办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤2：安装新的VPN***
powershell -Command "& {Add-VpnConnection -Name "北京办公室" -ServerAddress "beijing.example.com" -AuthenticationMethod "Eap" -EncryptionLevel "Maximum" -RememberCredential -TunnelType "Ikev2" -PassThru;}"
echo;成功
echo;
echo;***步骤3：清理注册表***
(powershell -Command "& {Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256"; Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule ";}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤4：添加注册表***
(powershell -Command "& {New-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1 -propertyType dword; New-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2 -propertyType dword;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤5：设置注册表***
powershell -Command "& {Set-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1; Set-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2;}"
echo;成功
echo;
echo;***步骤6：重启电脑***
echo;按任意键重启电脑，或按右上角 X 退出后手动重启电脑
pause>nul
shutdown -r -t 0
goto :end

:1u
cls
echo;卸载北京VPN
echo;===========================
(powershell -Command "& {Remove-VpnConnection -Name "北京办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功,按任意键退出...
goto :end

:2i
cls
echo;安装成都VPN
echo;===========================
echo;***步骤1：删除同名VPN***
(powershell -Command "& {Remove-VpnConnection -Name "成都办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤2：安装新的VPN***
powershell -Command "& {Add-VpnConnection -Name "成都办公室" -ServerAddress "chengdu.example.com" -AuthenticationMethod "Eap" -EncryptionLevel "Maximum" -RememberCredential -TunnelType "Ikev2" -PassThru;}"
echo;成功
echo;
echo;***步骤3：清理注册表***
(powershell -Command "& {Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256"; Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule ";}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤4：添加注册表***
(powershell -Command "& {New-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1 -propertyType dword; New-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2 -propertyType dword;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤5：设置注册表***
powershell -Command "& {Set-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1; Set-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2;}"
echo;成功
echo;
echo;***步骤6：重启电脑***
echo;按任意键重启电脑，或按右上角 X 退出后手动重启电脑
pause>nul
shutdown -r -t 0
goto :end

:2u
cls
echo;卸载成都VPN
echo;===========================
(powershell -Command "& {Remove-VpnConnection -Name "成都办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功,按任意键退出...
goto :end

:3i
cls
echo;安装重庆VPN
echo;===========================
echo;***步骤1：删除同名VPN***
(powershell -Command "& {Remove-VpnConnection -Name "重庆办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤2：安装新的VPN***
powershell -Command "& {Add-VpnConnection -Name "重庆办公室" -ServerAddress "chongqing.example.com" -AuthenticationMethod "Eap" -EncryptionLevel "Maximum" -RememberCredential -TunnelType "Ikev2" -PassThru;}"
echo;成功
echo;
echo;***步骤3：清理注册表***
(powershell -Command "& {Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256"; Remove-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule ";}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤4：添加注册表***
(powershell -Command "& {New-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1 -propertyType dword; New-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2 -propertyType dword;}") 1>nul 2>nul
echo;成功
echo;
echo;***步骤5：设置注册表***
powershell -Command "& {Set-ItemProperty HKLM:\System\CurrentControlSet\Services\Rasman\Parameters -name "NegotiateDH2048_AES256" -value 1; Set-ItemProperty HKLM:\System\CurrentControlSet\Services\PolicyAgent -name "AssumeUDPEncapsulationContextOnSendRule " -value 2;}"
echo;成功
echo;
echo;***步骤6：重启电脑***
echo;按任意键重启电脑，或按右上角 X 退出后手动重启电脑
pause>nul
shutdown -r -t 0
goto :end

:3u
cls
echo;卸载重庆VPN
echo;===========================
(powershell -Command "& {Remove-VpnConnection -Name "重庆办公室" -Force -PassThru;}") 1>nul 2>nul
echo;成功,按任意键退出...
goto :end

:end
pause>nul
