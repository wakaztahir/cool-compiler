# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "D:\Software\Installed\Jetbrains\CLion 2021.1.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "D:\Software\Installed\Jetbrains\CLion 2021.1.2\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\wakaztahir\CLionProjects\CoolCompiler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\CoolCompiler.dir\depend.make

# Include the progress variables for this target.
include CMakeFiles\CoolCompiler.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\CoolCompiler.dir\flags.make

CMakeFiles\CoolCompiler.dir\main.cpp.obj: CMakeFiles\CoolCompiler.dir\flags.make
CMakeFiles\CoolCompiler.dir\main.cpp.obj: ..\main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/CoolCompiler.dir/main.cpp.obj"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1429~1.300\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoCMakeFiles\CoolCompiler.dir\main.cpp.obj /FdCMakeFiles\CoolCompiler.dir\ /FS -c C:\Users\wakaztahir\CLionProjects\CoolCompiler\main.cpp
<<

CMakeFiles\CoolCompiler.dir\main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CoolCompiler.dir/main.cpp.i"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1429~1.300\bin\Hostx64\x64\cl.exe > CMakeFiles\CoolCompiler.dir\main.cpp.i @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\wakaztahir\CLionProjects\CoolCompiler\main.cpp
<<

CMakeFiles\CoolCompiler.dir\main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CoolCompiler.dir/main.cpp.s"
	C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1429~1.300\bin\Hostx64\x64\cl.exe @<<
 /nologo /TP $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) /FoNUL /FAs /FaCMakeFiles\CoolCompiler.dir\main.cpp.s /c C:\Users\wakaztahir\CLionProjects\CoolCompiler\main.cpp
<<

# Object files for target CoolCompiler
CoolCompiler_OBJECTS = \
"CMakeFiles\CoolCompiler.dir\main.cpp.obj"

# External object files for target CoolCompiler
CoolCompiler_EXTERNAL_OBJECTS =

CoolCompiler.exe: CMakeFiles\CoolCompiler.dir\main.cpp.obj
CoolCompiler.exe: CMakeFiles\CoolCompiler.dir\build.make
CoolCompiler.exe: CMakeFiles\CoolCompiler.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable CoolCompiler.exe"
	"D:\Software\Installed\Jetbrains\CLion 2021.1.2\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\CoolCompiler.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x64\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x64\mt.exe --manifests -- C:\PROGRA~2\MICROS~1\2019\COMMUN~1\VC\Tools\MSVC\1429~1.300\bin\Hostx64\x64\link.exe /nologo @CMakeFiles\CoolCompiler.dir\objects1.rsp @<<
 /out:CoolCompiler.exe /implib:CoolCompiler.lib /pdb:C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug\CoolCompiler.pdb /version:0.0 /machine:x64 /debug /INCREMENTAL /subsystem:console  kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\CoolCompiler.dir\build: CoolCompiler.exe

.PHONY : CMakeFiles\CoolCompiler.dir\build

CMakeFiles\CoolCompiler.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\CoolCompiler.dir\cmake_clean.cmake
.PHONY : CMakeFiles\CoolCompiler.dir\clean

CMakeFiles\CoolCompiler.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Users\wakaztahir\CLionProjects\CoolCompiler C:\Users\wakaztahir\CLionProjects\CoolCompiler C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug C:\Users\wakaztahir\CLionProjects\CoolCompiler\cmake-build-debug\CMakeFiles\CoolCompiler.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\CoolCompiler.dir\depend

