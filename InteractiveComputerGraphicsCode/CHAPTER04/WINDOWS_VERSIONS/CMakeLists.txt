cmake_minimum_required(VERSION 2.6.2)

project(CHAPTER04)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/bin" CACHE PATH "Install prefix" FORCE)

include_directories(../../include)

set(hehe_Binary_Dir ${CMAKE_INSTALL_PREFIX} ) #Used to configure Debug info

foreach(index 1 2 3)
	add_executable(Example${index} ../../Common/InitShader.cpp example${index}.cpp)
	target_link_libraries(Example${index} ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/freeglut.lib ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/glew32.lib)

	install(TARGETS Example${index}
		  RUNTIME DESTINATION "release" CONFIGURATIONS Release 
		  RUNTIME DESTINATION "debug" CONFIGURATIONS Debug 
		)
	if(NOT ${index} EQUAL 3)
		install(FILES ../../lib/freeglut.dll ../../lib/glew32.dll ./fshader4${index}.glsl ./vshader4${index}.glsl

			DESTINATION "release" CONFIGURATIONS Release 
			DESTINATION "debug" CONFIGURATIONS Debug 
			)
	endif()
	configure_file(../../VisualStudioUserFile.vcproj.user.in
		${CMAKE_CURRENT_BINARY_DIR}/Example${index}.vcproj.user
		@ONLY
	)
endforeach()

