To make it work with 64-bit MATLAB + Some updates


PS5000Asdk_r10_5_0_28 - top directory

1) In the top directory, create x32 directory
move PicoIpp.dll, PS5000a.dll, ps5000a.lib to .\x32 directory
copy PicoIpp.dll, PS5000a.dll, ps5000a.lib from .\x64 directory to top directory

Rename PS5000a.dll to ps5000a.dll

2) .\Wrapper\ps5000aWrap\Release\x64\ps5000aWrap.dll to .\MATLAB\ps5000a

3) In .\MATLAB\ps5000a directory, create x32 directory
move
ps5000a_thunk_pcwin64.dll
ps5000aMFile.m
ps5000aWrap_thunk_pcwin64.dll
ps5000aWrapMFile.m

to .\MATLAB\ps5000a\x32 directory

copy 4 files in .\MATLAB\ps5000a\x64
ps5000a_thunk_pcwin64.dll
ps5000aMFile.m
ps5000aWrap_thunk_pcwin64.dll
ps5000aWrapMFile.m

to .\MATLAB\ps5000a\

4) In .\MATLAB\ps5000a
rename picotech_ps5000a_generic.mdd to picotech_ps5000a_generic_old.mdd
update picotech_ps5000a_generic.mdd with the correct version (emailed from PicoTech)
