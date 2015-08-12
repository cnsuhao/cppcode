if(CMAKE_CXX_FLAGS_DEBUG MATCHES "/RTC1")
   string(REPLACE "/RTC1" " " CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
endif()

if(CMAKE_CXX_FLAGS MATCHES "/EHsc")
   string(REPLACE "/EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
endif()

macro(add_executable_clr cppname deb_info_template)
    add_executable(${cppname} ${ARGN})
    set_target_properties(${cppname} PROPERTIES VS_DOTNET_REFERENCES "System;System.Data;System.Drawing;System.Xml")
    set_target_properties(${cppname} PROPERTIES COMPILE_FLAGS "/clr /EHa")
    configure_file(
        ${deb_info_template}
        ${CMAKE_CURRENT_BINARY_DIR}/${cppname}.vcxproj.user
    )
endmacro()

macro(add_library_clr cppname)
    add_library(${cppname} SHARED ${ARGN})
    set_target_properties(${cppname} PROPERTIES VS_DOTNET_REFERENCES "System;System.Data;System.Drawing;System.Xml")
    set_target_properties(${cppname} PROPERTIES COMPILE_FLAGS "/clr /EHa")
    set_target_properties(${cppname} PROPERTIES LINKER_LANGUAGE CXX)
endmacro()

macro(add_reference target ref)
    get_target_property(Exist_VS_DOTNET_REFERENCES ${target} VS_DOTNET_REFERENCES)
    if(NOT Exist_VS_DOTNET_REFERENCES)
        set_target_properties(${target} PROPERTIES VS_DOTNET_REFERENCES "${ref}")
    else()
        set_target_properties(${target} PROPERTIES VS_DOTNET_REFERENCES "${Exist_VS_DOTNET_REFERENCES};${ref}")
    endif()
    add_dependencies(${target} ${ref})
endmacro()