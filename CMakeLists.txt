cmake_minimum_required( VERSION 3.4.0 )

set( OpenSSL_SOURCE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/openssl" )
set( OpenSLL_BINARY_PATH "${CMAKE_CURRENT_BINARY_DIR}" )
set( OpenSLL_INCLUDE_PATH "${CMAKE_CURRENT_BINARY_DIR}/include" )

set( OpenSSL_COMPILER_DEFINES "" )

if( WIN32 )
	list( APPEND OpenSSL_COMPILER_DEFINES 
		OPENSSL_SYSNAME_WIN32
		WIN32_LEAN_AND_MEAN 
	)
endif()

list( APPEND OpenSSL_COMPILER_DEFINES OPENSSL_NO_ASM )

# we include which means you need to use "OpenSSL_X_PATH" for your paths.
include( cmake/crypto.cmake )
include( cmake/ssl.cmake )
include( cmake/apps.cmake )
