cmake_minimum_required(VERSION 3.16)

project(Example5-AdjustableCard VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appExample5-AdjustableCard
    main.cpp
)

set(ASSETS
    assets/sky6.jpg
    assets/arrow-circle-right-svgrepo-com.svg
)

qt_add_qml_module(appExample5-AdjustableCard
    URI Example5.AdjustableCard
    VERSION 1.0
    QML_FILES Main.qml
              AdjustableCard.qml
    RESOURCES ${ASSETS}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appExample5-AdjustableCard PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appExample5-AdjustableCard
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appExample5-AdjustableCard
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appExample5-AdjustableCard
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
