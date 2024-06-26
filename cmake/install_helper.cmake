include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

set(FHF_VERSION_CONFIG "${FHF_GENERATED_CMAKE_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
set(FHF_PROJECT_CONFIG "${FHF_GENERATED_CMAKE_DIR}/${PROJECT_NAME}Config.cmake")

set(FHF_INSTALL_CMAKE_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")

set(FHF_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
set(FHF_INSTALL_NAMESPACE "${PROJECT_NAME}::")

# TODO: Change to SameMajorVersion when API becomes stable enough
write_basic_package_version_file("${FHF_VERSION_CONFIG}" COMPATIBILITY ExactVersion)
configure_package_config_file(
    cmake/Config.cmake.in
    "${FHF_PROJECT_CONFIG}"
    INSTALL_DESTINATION "${FHF_INSTALL_CMAKE_DIR}"
)

set(FHF_INSTALL_TARGETS fhf_lib)

install(
    TARGETS ${FHF_INSTALL_TARGETS}

    EXPORT ${FHF_TARGETS_EXPORT_NAME}

    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    COMPONENT FHF_Runtime

    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    COMPONENT FHF_Runtime
    NAMELINK_COMPONENT FHF_Development

    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    COMPONENT FHF_Development

    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(DIRECTORY ${FHF_GENERATED_INCLUDE_DIR}/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(
    FILES
    ${FHF_GENERATED_EXPORT_HEADER}
    DESTINATION
    "${CMAKE_INSTALL_INCLUDEDIR}/fhf"
)

install(
    FILES
    ${FHF_PROJECT_CONFIG}
    ${FHF_VERSION_CONFIG}
    DESTINATION
    ${FHF_INSTALL_CMAKE_DIR}
)

set_target_properties(fhf_lib PROPERTIES EXPORT_NAME library)
add_library(FastHalfFloat::library ALIAS fhf_lib)

install(
    EXPORT ${FHF_TARGETS_EXPORT_NAME}
    DESTINATION ${FHF_INSTALL_CMAKE_DIR}
    NAMESPACE ${FHF_INSTALL_NAMESPACE}
    COMPONENT FHF_Development
)