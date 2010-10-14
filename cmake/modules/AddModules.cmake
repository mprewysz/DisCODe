# =======================================================================
# Additional macro definitions
# =======================================================================

#
# Add variable controlling whether to build given corresponding component or not
# and - if set to TRUE - include component's subdirectory
#
# Optionally you can give additional argument to specify platform on which 
# component can be built (use WIN32 for Windows-only and !WIN32 for *nix-only)
#
MACRO(ADD_PROCESSOR PROC_NAME)
	if ( ${ARGC} LESS 2 )
		set( ARGV1 1 )
	endif (${ARGC} LESS 2 )
	
	if (${ARGV1})
		set(PROCESSORS_${PROC_NAME} ON CACHE BOOL "Build ${PROC_NAME} processor")
		if (PROCESSORS_${PROC_NAME})
			MESSAGE(STATUS "\t${PROC_NAME}")
			ADD_SUBDIRECTORY(${PROC_NAME})
		endif(PROCESSORS_${PROC_NAME})
	endif (${ARGV1})
ENDMACRO(ADD_PROCESSOR)

MACRO(ADD_SOURCE SRC_NAME)
	if ( ${ARGC} LESS 2 )
		set( ARGV1 1 )
	endif (${ARGC} LESS 2 )
	
	if ( ${ARGV1})
		set(SOURCES_${SRC_NAME} ON CACHE BOOL "Build ${SRC_NAME} source")
		if (SOURCES_${SRC_NAME})
			MESSAGE(STATUS "\t${SRC_NAME}")
			ADD_SUBDIRECTORY(${SRC_NAME})
		endif(SOURCES_${SRC_NAME})
	endif( ${ARGV1})
ENDMACRO(ADD_SOURCE)

MACRO(ADD_SINK SINK_NAME)
	if ( ${ARGC} LESS 2 )
		set( ARGV1 1 )
	endif (${ARGC} LESS 2 )

	if (${ARGV1})
		set(SINKS_${SINK_NAME} ON CACHE BOOL "Build ${SINK_NAME} sink")
		if (SINKS_${SINK_NAME})
			MESSAGE(STATUS "\t${SINK_NAME}")
			ADD_SUBDIRECTORY(${SINK_NAME})
		endif(SINKS_${SINK_NAME})
	endif (${ARGV1})
ENDMACRO(ADD_SINK)

#
# Set component's install directory and group
#
MACRO(INSTALL_PROCESSOR PROC_NAME)
    install(
        TARGETS ${PROC_NAME}
        LIBRARY DESTINATION bin
        ARCHIVE DESTINATION bin
        COMPONENT processors
    )
ENDMACRO(INSTALL_PROCESSOR)

MACRO(INSTALL_SOURCE SRC_NAME)
    install(
        TARGETS ${SRC_NAME}
        LIBRARY DESTINATION bin
        ARCHIVE DESTINATION bin
        COMPONENT sources
    )
ENDMACRO(INSTALL_SOURCE)

MACRO(INSTALL_SINK SINK_NAME)
    install(
        TARGETS ${SINK_NAME}
        LIBRARY DESTINATION bin
        ARCHIVE DESTINATION bin
        COMPONENT sinks
    )
ENDMACRO(INSTALL_SINK)