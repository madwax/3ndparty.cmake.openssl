cmake_minimum_required( VERSION 3.4.0 )

include( CMakeParseArguments )

project( crypto )

set( TARGET_SOURCE_DIR_TRUE "${OpenSSL_SOURCE_PATH}/ssl" )

set( TARGET_INCLUDE_DIRS ${OpenSLL_INCLUDE_PATH} )
set( TARGET_INCLUDE_DIRS_PRIVATE "${TARGET_SOURCE_DIR_TRUE}" "${OpenSSL_SOURCE_PATH}/crypto" )

set( TARGET_DEFINES "" )
set( TARGET_DEFINES_PRIVATE "${OpenSSL_COMPILER_DEFINES}" )

set( TARGET_COMPILE_FLAGS "" )
set( TARGET_COMPILE_FLAGS_PRIVATE "" )

set( TARGET_LINK crypto )
set( TARGET_LINK_PRIVATE "" )

set( XSRC 
	${TARGET_SOURCE_DIR_TRUE}/s2_meth.c   
	${TARGET_SOURCE_DIR_TRUE}/s2_srvr.c 
	${TARGET_SOURCE_DIR_TRUE}/s2_clnt.c  
	${TARGET_SOURCE_DIR_TRUE}/s2_lib.c  
	${TARGET_SOURCE_DIR_TRUE}/s2_enc.c 
	${TARGET_SOURCE_DIR_TRUE}/s2_pkt.c
	${TARGET_SOURCE_DIR_TRUE}/s3_meth.c
	${TARGET_SOURCE_DIR_TRUE}/s3_srvr.c
	${TARGET_SOURCE_DIR_TRUE}/s3_clnt.c
	${TARGET_SOURCE_DIR_TRUE}/s3_lib.c
	${TARGET_SOURCE_DIR_TRUE}/s3_enc.c
	${TARGET_SOURCE_DIR_TRUE}/s3_pkt.c
	${TARGET_SOURCE_DIR_TRUE}/s3_both.c
	${TARGET_SOURCE_DIR_TRUE}/s3_cbc.c
	${TARGET_SOURCE_DIR_TRUE}/s23_meth.c
	${TARGET_SOURCE_DIR_TRUE}/s23_srvr.c
	${TARGET_SOURCE_DIR_TRUE}/s23_clnt.c 
	${TARGET_SOURCE_DIR_TRUE}/s23_lib.c
	${TARGET_SOURCE_DIR_TRUE}/s23_pkt.c
	${TARGET_SOURCE_DIR_TRUE}/t1_meth.c
	${TARGET_SOURCE_DIR_TRUE}/t1_srvr.c 
	${TARGET_SOURCE_DIR_TRUE}/t1_clnt.c
	${TARGET_SOURCE_DIR_TRUE}/t1_lib.c
	${TARGET_SOURCE_DIR_TRUE}/t1_enc.c
	${TARGET_SOURCE_DIR_TRUE}/t1_ext.c
	${TARGET_SOURCE_DIR_TRUE}/d1_meth.c
	${TARGET_SOURCE_DIR_TRUE}/d1_srvr.c 
	${TARGET_SOURCE_DIR_TRUE}/d1_clnt.c  
	${TARGET_SOURCE_DIR_TRUE}/d1_lib.c  
	${TARGET_SOURCE_DIR_TRUE}/d1_pkt.c 
	${TARGET_SOURCE_DIR_TRUE}/d1_both.c 
	${TARGET_SOURCE_DIR_TRUE}/d1_srtp.c
	${TARGET_SOURCE_DIR_TRUE}/ssl_lib.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_err2.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_cert.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_sess.c
	${TARGET_SOURCE_DIR_TRUE}/ssl_ciph.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_stat.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_rsa.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_asn1.c
	${TARGET_SOURCE_DIR_TRUE}/ssl_txt.c
	${TARGET_SOURCE_DIR_TRUE}/ssl_algs.c
	${TARGET_SOURCE_DIR_TRUE}/ssl_conf.c
	${TARGET_SOURCE_DIR_TRUE}/bio_ssl.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_err.c 
	${TARGET_SOURCE_DIR_TRUE}/kssl.c 
	${TARGET_SOURCE_DIR_TRUE}/t1_reneg.c 
	${TARGET_SOURCE_DIR_TRUE}/tls_srp.c 
	${TARGET_SOURCE_DIR_TRUE}/t1_trce.c 
	${TARGET_SOURCE_DIR_TRUE}/ssl_utst.c
)

set( XINC 
	${TARGET_SOURCE_DIR_TRUE}/ssl.h
	${TARGET_SOURCE_DIR_TRUE}/ssl2.h
	${TARGET_SOURCE_DIR_TRUE}/ssl3.h
	${TARGET_SOURCE_DIR_TRUE}/ssl23.h
	${TARGET_SOURCE_DIR_TRUE}/kssl.h
	${TARGET_SOURCE_DIR_TRUE}/tls1.h
	${TARGET_SOURCE_DIR_TRUE}/dtls1.h
	${TARGET_SOURCE_DIR_TRUE}/srtp.h
)

file( COPY ${XINC} DESTINATION ${OpenSLL_INCLUDE_PATH}/openssl )

set( TARGET_SOURCES ${XSRC} ${XINC} )

add_library( ssl STATIC ${TARGET_SOURCES} )

target_include_directories( ssl PRIVATE ${TARGET_INCLUDE_DIRS} ${TARGET_INCLUDE_DIRS_PRIVATE} )
target_compile_definitions( ssl PRIVATE ${TARGET_DEFINES} ${TARGET_DEFINES_PRIVATE} )
target_link_libraries( ssl PRIVATE ${TARGET_LINK} ${TARGET_LINK_PRIVATE} )
target_compile_options( ssl PRIVATE ${TARGET_COMPILE_FLAGS} ${TARGET_COMPILE_FLAGS_PRIVATE} )

target_include_directories( ssl PUBLIC ${TARGET_INCLUDE_DIRS} )
target_compile_definitions( ssl PUBLIC ${TARGET_DEFINES} )
target_link_libraries( ssl PUBLIC ${TARGET_LINK} )
target_compile_options( ssl PUBLIC ${TARGET_COMPILE_FLAGS} )