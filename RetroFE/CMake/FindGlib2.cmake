FILE(TO_CMAKE_PATH "$ENV{GLIB2_ROOT}" TRY1_DIR)
FILE(TO_CMAKE_PATH "${GLIB2_ROOT}" TRY2_DIR)
FILE(GLOB GLIB2_ROOT ${TRY1_DIR} ${TRY2_DIR})

FIND_PATH(GLIB_glib_2_INCLUDE_DIR glib.h
                                  PATHS /opt/homebrew/include/glib-2.0 ${GLIB2_ROOT}/include ${GLIB2_ROOT}/include/glib-2.0 /usr/local/include/glib-2.0 /usr/include/glib-2.0 /opt/local/include/glib-2.0
                                  ENV INCLUDE DOC "Directory containing glib.h include file")

FIND_PATH(GLIB_glibconfig_2_INCLUDE_DIR glibconfig.h include/glibconfig.h
                                        PATHS /opt/homebrew/lib/glib-2.0 ${GLIB2_ROOT}/include ${GLIB2_ROOT}/include/glib-2.0 ${GLIB2_ROOT}/lib/include ${GLIB2_ROOT}/lib/glib-2.0/include /usr/local/include/glib-2.0 /usr/include/glib-2.0 /usr/lib/glib-2.0/include /usr/local/lib/glib-2.0/include /opt/local/lib/glib-2.0/include
                                        ENV INCLUDE DOC "Directory containing glibconfig.h include file")

FIND_LIBRARY(GLIB_glib_2_LIBRARY NAMES glib-2.0 libglib-2.0
                                 PATHS /opt/homebrew/lib/glib-2.0 /opt/homebrew/lib ${GLIB2_ROOT}/bin ${GLIB2_ROOT}/win32/bin ${GLIB2_ROOT}/lib ${GLIB2_ROOT}/win32/lib /usr/local/lib /usr/lib /opt/local/lib
                                 ENV LIB
                                 DOC "glib library to link with"
                                 NO_SYSTEM_ENVIRONMENT_PATH)

FIND_LIBRARY(GLIB_gmodule_2_LIBRARY NAMES gmodule-2.0 libgmodule-2.0
                                    PATHS /opt/homebrew/lib/glib-2.0 /opt/homebrew/lib ${GLIB2_ROOT}/bin ${GLIB2_ROOT}/win32/bin ${GLIB2_ROOT}/lib ${GLIB2_ROOT}/win32/lib /usr/local/lib /usr/lib /opt/local/lib
                                    ENV LIB
                                    DOC "gmodule library to link with"
                                    NO_SYSTEM_ENVIRONMENT_PATH)

FIND_LIBRARY(GLIB_gobject_2_LIBRARY NAMES gobject-2.0 libgobject-2.0
                                    PATHS /opt/homebrew/lib/glib-2.0 /opt/homebrew/lib ${GLIB2_ROOT}/bin ${GLIB2_ROOT}/win32/bin ${GLIB2_ROOT}/lib ${GLIB2_ROOT}/win32/lib /usr/local/lib /usr/lib /opt/local/lib
                                    ENV LIB
                                    DOC "gobject library to link with"
                                    NO_SYSTEM_ENVIRONMENT_PATH)

FIND_LIBRARY(GLIB_gthread_2_LIBRARY NAMES gthread-2.0 libgthread-2.0
                                    PATHS /opt/homebrew/lib/glib-2.0 /opt/homebrew/lib ${GLIB2_ROOT}/bin ${GLIB2_ROOT}/win32/bin ${GLIB2_ROOT}/lib ${GLIB2_ROOT}/win32/lib /usr/local/lib /usr/lib /opt/local/lib
                                    ENV LIB
                                    DOC "gthread library to link with"
                                    NO_SYSTEM_ENVIRONMENT_PATH)

#IF (GLIB_glib_2_INCLUDE_DIR AND GLIB_glibconfig_2_INCLUDE_DIR AND GLIB_glib_2_LIBRARY AND GLIB_gmodule_2_LIBRARY AND GLIB_gobject_2_LIBRARY AND GLIB_gthread_2_LIBRARY)
  SET(GLIB2_INCLUDE_DIRS ${GLIB_glib_2_INCLUDE_DIR} ${GLIB_glibconfig_2_INCLUDE_DIR})
  list(REMOVE_DUPLICATES GLIB2_INCLUDE_DIRS)
  SET(GLIB2_LIBRARIES ${GLIB_glib_2_LIBRARY} ${GLIB_gmodule_2_LIBRARY} ${GLIB_gobject_2_LIBRARY} ${GLIB_gthread_2_LIBRARY})
  list(REMOVE_DUPLICATES GLIB2_LIBRARIES)
  SET(GLIB2_FOUND TRUE)
#ENDIF (GLIB_glib_2_INCLUDE_DIR AND GLIB_glibconfig_2_INCLUDE_DIR AND GLIB_glib_2_LIBRARY AND GLIB_gmodule_2_LIBRARY AND GLIB_gobject_2_LIBRARY AND GLIB_gthread_2_LIBRARY)
