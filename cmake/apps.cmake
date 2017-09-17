cmake_minimum_required( VERSION 3.4.0 )

project( openssl )

set( TARGET_SOURCE_DIR_TRUE "${OpenSSL_SOURCE_PATH}/apps" )

set( TARGET_INCLUDE_DIRS "${OpenSLL_INCLUDE_PATH}" "${TARGET_SOURCE_DIR_TRUE}" )
set( TARGET_DEFINES "${OpenSSL_COMPILER_DEFINES}" "MONOLITH" )
set( TARGET_COMPILE_FLAGS "" )
set( TARGET_LINK crypto ssl )

set( XSRC 
	${TARGET_SOURCE_DIR_TRUE}/openssl.c 
	${TARGET_SOURCE_DIR_TRUE}/verify.c 
	${TARGET_SOURCE_DIR_TRUE}/asn1pars.c 
	${TARGET_SOURCE_DIR_TRUE}/req.c 
	${TARGET_SOURCE_DIR_TRUE}/dgst.c 
	${TARGET_SOURCE_DIR_TRUE}/dh.c 
	${TARGET_SOURCE_DIR_TRUE}/dhparam.c 
	${TARGET_SOURCE_DIR_TRUE}/enc.c 
	${TARGET_SOURCE_DIR_TRUE}/passwd.c 
	${TARGET_SOURCE_DIR_TRUE}/gendh.c 
	${TARGET_SOURCE_DIR_TRUE}/errstr.c
	${TARGET_SOURCE_DIR_TRUE}/ca.c 
	${TARGET_SOURCE_DIR_TRUE}/pkcs7.c 
	${TARGET_SOURCE_DIR_TRUE}/crl2p7.c 
	${TARGET_SOURCE_DIR_TRUE}/crl.c 
	${TARGET_SOURCE_DIR_TRUE}/rsa.c 
	${TARGET_SOURCE_DIR_TRUE}/rsautl.c 
	${TARGET_SOURCE_DIR_TRUE}/dsa.c 
	${TARGET_SOURCE_DIR_TRUE}/dsaparam.c 
	${TARGET_SOURCE_DIR_TRUE}/ec.c 
	${TARGET_SOURCE_DIR_TRUE}/ecparam.c 
	${TARGET_SOURCE_DIR_TRUE}/x509.c
	${TARGET_SOURCE_DIR_TRUE}/genrsa.c 
	${TARGET_SOURCE_DIR_TRUE}/gendsa.c 
	${TARGET_SOURCE_DIR_TRUE}/genpkey.c 
	${TARGET_SOURCE_DIR_TRUE}/s_server.c 
	${TARGET_SOURCE_DIR_TRUE}/s_client.c 
	${TARGET_SOURCE_DIR_TRUE}/speed.c 
	${TARGET_SOURCE_DIR_TRUE}/s_time.c 
	${TARGET_SOURCE_DIR_TRUE}/apps.c 
	${TARGET_SOURCE_DIR_TRUE}/s_cb.c
	${TARGET_SOURCE_DIR_TRUE}/s_socket.c 
	${TARGET_SOURCE_DIR_TRUE}/app_rand.c 
	${TARGET_SOURCE_DIR_TRUE}/version.c 
	${TARGET_SOURCE_DIR_TRUE}/sess_id.c 
	${TARGET_SOURCE_DIR_TRUE}/ciphers.c 
	${TARGET_SOURCE_DIR_TRUE}/nseq.c 
	${TARGET_SOURCE_DIR_TRUE}/pkcs12.c 
	${TARGET_SOURCE_DIR_TRUE}/pkcs8.c 
	${TARGET_SOURCE_DIR_TRUE}/pkey.c
	${TARGET_SOURCE_DIR_TRUE}/pkeyparam.c 
	${TARGET_SOURCE_DIR_TRUE}/pkeyutl.c 
	${TARGET_SOURCE_DIR_TRUE}/spkac.c 
	${TARGET_SOURCE_DIR_TRUE}/smime.c 
	${TARGET_SOURCE_DIR_TRUE}/cms.c 
	${TARGET_SOURCE_DIR_TRUE}/rand.c 
	${TARGET_SOURCE_DIR_TRUE}/engine.c 
	${TARGET_SOURCE_DIR_TRUE}/ocsp.c 
	${TARGET_SOURCE_DIR_TRUE}/prime.c 
	${TARGET_SOURCE_DIR_TRUE}/ts.c
	${TARGET_SOURCE_DIR_TRUE}/srp.c	
)

set( XINC "" )

set( TARGET_SOURCES ${XSRC} ${XINC} )

add_executable( openssl ${TARGET_SOURCES} )

target_include_directories( openssl PUBLIC ${TARGET_INCLUDE_DIRS} )
target_compile_definitions( openssl PUBLIC ${TARGET_DEFINES} )
target_link_libraries( openssl PUBLIC ${TARGET_LINK} )
target_compile_options( openssl PUBLIC ${TARGET_COMPILE_FLAGS} )