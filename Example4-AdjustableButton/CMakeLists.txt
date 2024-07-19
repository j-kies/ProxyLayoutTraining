cmake_minimum_required(VERSION 3.16)

project(Example4-AdjustableButton VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appExample4-AdjustableButton
    main.cpp
)

set(ASSETS
    assets/arrow-circle-right-svgrepo-com.svg
    assets/cloud-bolt-svgrepo-com.svg
    assets/cloud-sun-alt-svgrepo-com.svg
)


qt_add_qml_module(appExample4-AdjustableButton
    URI Example4.AdjustableButton
    VERSION 1.0
    QML_FILES Main.qml
              AdjustableButton.qml
    RESOURCES ${ASSETS}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appExample4-AdjustableButton PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appExample4-AdjustableButton
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appExample4-AdjustableButton
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appExample4-AdjustableButton
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
