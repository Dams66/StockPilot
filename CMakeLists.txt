cmake_minimum_required(VERSION 3.16)

project(StockPilot VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_resources(QML_RESOURCES qml.qrc)

qt_add_executable(appStockPilot
    main.cpp
    ${QML_RESOURCES}
)

target_link_libraries(appStockPilot PRIVATE Qt6::Quick)
