cmake_minimum_required(VERSION 3.18)

set(LLVM_MOS_PLATFORM c64)

find_package(llvm-mos-sdk REQUIRED)
project(llvm-mos-sdk-example LANGUAGES C CXX)

# Install examples to root example dir, not bin/
set(CMAKE_INSTALL_BINDIR .)

function(create_prg target)
  install(TARGETS ${target})
  install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${target}.elf TYPE BIN)
endfunction()

add_executable(foo.prg foo.c)
create_prg(foo.prg)

add_custom_command(
  TARGET foo.prg POST_BUILD
  COMMAND llvm-objdump -S foo.prg.elf > foo.lst
  BYPRODUCTS foo.lst
  VERBATIM
  )