@echo off
if [%1] == [] goto noexec
if ["%key_secret%"] == [""] goto nokey
if [%SIGNTOOL_PATH%] == [] set "SIGNTOOL_PATH=%~dp0"

echo "%SIGNTOOL_PATH%\signtool.exe" sign /v /f particle-code-signing-cert.p12 /p "%%WINDOWS_CODE_SIGNING_CERT_PASSWORD%%" /tr http://tsa.starfieldtech.com %1
"%SIGNTOOL_PATH%\signtool.exe" sign /v /f particle-code-signing-cert.p12 /p "%WINDOWS_CODE_SIGNING_CERT_PASSWORD%" /tr http://tsa.starfieldtech.com %1
goto done

:nokey
echo Set the code signing certificate decryption key in the environment variable key_secret
goto done

:noexec
echo Specify an exe file to sign
goto done

:done
