cmake_minimum_required(VERSION 2.6.2)

project(CHAPTER05)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/bin" CACHE PATH "Install prefix" FORCE)

include_directories(../../include)

set(hehe_Binary_Dir ${CMAKE_INSTALL_PREFIX} ) #Used to configure Debug info

foreach(index 1 2 3 6)
	add_executable(Example${index} ../../Common/InitShader.cpp example${index}.cpp)
	target_link_libraries(Example${index} ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/freeglut.lib ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/glew32.lib)

	install(TARGETS Example${index}
		  RUNTIME DESTINATION "debug" CONFIGURATIONS Debug 
		)
	install(TARGETS Example${index}
		  RUNTIME DESTINATION "release" CONFIGURATIONS Release 
		)
	install(FILES ../../lib/freeglut.dll ../../lib/glew32.dll ./fshader5${index}.glsl ./vshader5${index}.glsl
		DESTINATION "debug" CONFIGURATIONS Debug 
		)	
	install(FILES ../../lib/freeglut.dll ../../lib/glew32.dll ./fshader5${index}.glsl ./vshader5${index}.glsl
		DESTINATION "release" CONFIGURATIONS Release 
		)
	if(${MSVC_VERSION} EQUAL 1500)
		configure_file(../../VisualStudioUserFile.vcproj.user.in
			${CMAKE_CURRENT_BINARY_DIR}/Example${index}.vcproj.user
			@ONLY
		)
	elseif(${MSVC_VERSION} EQUAL 1600)
		configure_file(../../VisualStudioUserFile.vcxproj.user.in
			${CMAKE_CURRENT_BINARY_DIR}/Example${index}.vcxproj.user
			@ONLY
		)
	endif()
endforeach()

