# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appfluxo_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appfluxo_autogen.dir\\ParseCache.txt"
  "appfluxo_autogen"
  )
endif()
