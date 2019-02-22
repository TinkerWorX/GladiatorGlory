# Gladiator Glory
An open source gladiator map for Warcraft III.

# Build
1. Clone the repository.
2. Run build.bat
3. Edit environment.bat and add the path to your Warcraft III.exe

With the above steps done, you should now be ready to work on the map.

# Scripts
* clean.bat will clean up temporary files
* build.bat will build the map into the out folder
* build-test.bat will build the map into the out folder and then launch wc3

# Visual Studio Code
The project comes with a preconfigured Visual Studio Code workspace that can be used to work in.
Inside Visual Studio Code you can run the different scripts using `Terminal/Run Task...` and Ctrl+Shift+B will build and run the map.

# Technical
The project uses a few different tools to do its thing. They can all be found in the `tools` folder.

## mcpp -- a portable C preprocessor
This allows the script to use preprocessor syntax like #include to include files, #pragma once to avoid duplicates and #define for conditional features.

## JassHelper
JassHelper enables the map to use vJASS

## Grimex
Grimex handles importing and converting files automatically by simply placing them in the `src/Imports` folder
