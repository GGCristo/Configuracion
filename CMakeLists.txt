cmake_minimum_required(VERSION "3.10")

project()

set(SOURCES
  )

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
add_executable(main ${SOURCES})
#add_executable("($PROJECT_NAME)" src/main.cpp)
#
#install(TARGETS "($PROJECT_NAME)" DESTINATION bin)
#install(FILES "src/main.cpp" DESTINATION src)
