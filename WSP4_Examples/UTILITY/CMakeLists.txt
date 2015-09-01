set(UTILITY_Source_Files
	GETARGS.C
	OPTIONS.C
	PRINTMSG.C
	REPRTERR.C
	SKIPARG.C
	VersionOK.c
	WSTRINGS.C
)

add_library(UTILITY SHARED ${UTILITY_Source_Files})