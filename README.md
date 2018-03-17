# Generic makefile
A generic C++ makefile using g++ with automatic dependencies and subfolder support.

- By default, cpp files must be in a 'source' subdirectory and header files must be in a 'include' subdirectory (see SRCDIR and INCDIR variables)
- Comment 'DEBUG' variable if you want to compile in release mode
- By default, target executable will be generated in './bin/debug/' directory and dependency files will be placed in './bin/debug/dep/' (see OUTPUT_DIR, RELEASEDIR, DEBUGDIR and DEPDIR variables)
- Generated executable will be named after 'EXE_NAME' variable
- You can customize compiler options via 'CPPFLAGS' and 'DEBUGFLAGS' variables
- External libraries should be added to 'LIBS' variable (e.g. 'LIBS = -L./antlr/runtime_source/dist/ -l:libantlr4-runtime.a')
- Include paths should be appended to 'INCLUDES' variable (e.g. 'INCLUDES = -I ./$(INCDIR) -I /my/lib/include/')
- This makefile only support .h and .cpp file extensions for now (see 'SRC_EXT' and 'HDR_EXT' variables)
