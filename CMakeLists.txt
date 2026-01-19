cmake_minimum_required(VERSION 3.20)
project(sfml_starter VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Nice default: export compile_commands.json for clangd/IDE tooling
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(sfml_starter
  src/main.cpp
)

target_include_directories(sfml_starter PRIVATE include)

# Warnings (portable-ish)
if (MSVC)
  target_compile_options(sfml_starter PRIVATE /W4 /permissive-)
else()
  target_compile_options(sfml_starter PRIVATE -Wall -Wextra -Wpedantic)
endif()

# SFML via vcpkg (recommended)
# vcpkg will provide an SFML "config" package.
find_package(SFML COMPONENTS system window graphics audio network CONFIG REQUIRED)

target_link_libraries(sfml_starter PRIVATE
  sfml-system
  sfml-window
  sfml-graphics
  sfml-audio
  sfml-network
)

# On macOS, SFML may require linking OpenGL framework depending on build.
if(APPLE)
  find_library(OpenGL_FRAMEWORK OpenGL)
  if(OpenGL_FRAMEWORK)
    target_link_libraries(sfml_starter PRIVATE ${OpenGL_FRAMEWORK})
  endif()
endif()
