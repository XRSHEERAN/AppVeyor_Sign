# AppVeyor_Sign
Signing C# program on Appveyor
---
* AppVeyor has windows sdk (signtool)
```yml
C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Bin\signtool.exe" sign /f "C:\projects\logviewer\logviewer.pfx" /p PWD /t http://timestamp.globalsign.com/scripts/timstamp.dll /v /d "logviewer" /du https://github.com/aegoroff/logviewer "bin\Release\logviewer.engine.dll
```
* Sign the dll in post build phase

## TB Solved
* Secure file
