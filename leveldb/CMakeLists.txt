macro(use_cxx11)
	if (CMAKE_VERSION VERSION_LESS "3.1")
		if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
			set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=gnu++11")
		endif ()
	else ()
			set (CMAKE_CXX_STANDARD 11)
	endif ()
endmacro(use_cxx11)
use_cxx11()
include_directories ("./") 

# 下面是FILE加入模式
#FILE(GLOB_RECURSE SOURCE_FILES ./port/*.cc ./db/*.cc ./table/*.cc ./util/*.cc )
#add_library (leveldb ${SOURCE_FILES})

# 下面是aux_source_模式
aux_source_directory(./port SOURCE_FILES)
aux_source_directory(./helpers/memenv SOURCE_FILES)
aux_source_directory(./table SOURCE_FILES)
aux_source_directory(./util SOURCE_FILES)
aux_source_directory(./db  SOURCE_FILES)
add_library (leveldb ${SOURCE_FILES})

#xcode 文件分目录支持
function(assign_source_group)
	foreach(_source IN ITEMS ${ARGN})
		if (IS_ABSOLUTE "${_source}")
			file(RELATIVE_PATH _source_rel "${CMAKE_CURRENT_SOURCE_DIR}" "${_source}")
		else()
			set(_source_rel "${_source}")
		endif()
		get_filename_component(_source_path "${_source_rel}" PATH)
		string(REPLACE "/" "\\" _source_path_msvc "${_source_path}")
		source_group("${_source_path_msvc}" FILES "${_source}")
	endforeach()
endfunction(assign_source_group)
assign_source_group(${SOURCE_FILES})

# 下面是aux_source_模式
#aux_source_directory(./port DIR_LIB_SRCS)
#aux_source_directory(./helpers/memenv DIR_LIB_SRCS)
#aux_source_directory(./table DIR_LIB_SRCS)
#aux_source_directory(./util DIR_LIB_SRCS)
#aux_source_directory(./db  DIR_LIB_SRCS)
#add_library (leveldb ${DIR_LIB_SRCS})
