if (NOT DEFINED ENABLE_CASSANDRA OR ENABLE_CASSANDRA)
    if (NOT EXISTS "${ClickHouse_SOURCE_DIR}/contrib/libuv")
        message (WARNING "submodule contrib/libuv is missing. to fix try run: \n git submodule update --init --recursive")
    elseif (NOT EXISTS "${ClickHouse_SOURCE_DIR}/contrib/cassandra")
        message (WARNING "submodule contrib/cassandra is missing. to fix try run: \n git submodule update --init --recursive")
    else()
        set (LIBUV_ROOT_DIR "${ClickHouse_SOURCE_DIR}/contrib/libuv")
        set (CASSANDRA_INCLUDE_DIR
                "${ClickHouse_SOURCE_DIR}/contrib/cassandra/include/")
        if (USE_STATIC_LIBRARIES)
            set (LIBUV_LIBRARY uv_a)
            set (CASSANDRA_LIBRARY cassandra_static)
        else()
            set (LIBUV_LIBRARY uv)
            set (CASSANDRA_LIBRARY cassandra)
        endif()
        set (USE_CASSANDRA 1)
        set (CASS_ROOT_DIR "${ClickHouse_SOURCE_DIR}/contrib/cassandra")

        message(STATUS "Using cassandra: ${CASSANDRA_LIBRARY}")
    endif()
endif()