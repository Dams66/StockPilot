cmake_minimum_required(VERSION 3.16)

project(StockPilot VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Quick Quick3D QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_resources(QML_RESOURCES qml.qrc)

qt_add_executable(appStockPilot
    main.cpp
    src/order.cpp
    src/product.cpp
    src/stockenv.cpp
    src/stockenvmanager.cpp
    include/order.h
    include/product.h
    include/stockenv.h
    include/stockenvmanager.h
    ${QML_RESOURCES}
)

target_include_directories(appStockPilot PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

target_link_libraries(appStockPilot PRIVATE Qt6::Core Qt6::Quick Qt6::Quick3D Qt6::QuickControls2)
