cmake_minimum_required(VERSION 3.16)

project(fluxoapp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appfluxoapp
    main.cpp
    resources.qrc
)



qt_add_qml_module(appfluxoapp
    URI fluxoapp
    VERSION 1.0
    QML_FILES
    GetStartedPage.qml
    QML_FILES AuthPage.qml
    SOURCES session.cpp
    SOURCES session.h
    SOURCES fluxo.h
    SOURCES fluxo.cpp
    QML_FILES WithdrawAmount.qml
    #RESOURCES images/money_image.png
    QML_FILES DepositAmount.qml
    QML_FILES WithdrawCategory.qml
    RESOURCES resources.qrc
    QML_FILES MainPage.qml
    QML_FILES DepositCategory.qml
    SOURCES mainOperations.h
    SOURCES mainOperations.cpp
    SOURCES urls.h
    QML_FILES BudgetAmount.qml
    QML_FILES SendMoney.qml
    QML_FILES TransactionBlock.qml
    QML_FILES Navbar.qml
    QML_FILES Header.qml
    QML_FILES MenuPage.qml
    QML_FILES BudgetMainMenu.qml
    QML_FILES BudgetData.qml
    QML_FILES PrivacyPolicy.qml
    QML_FILES BudgetEdit.qml
    QML_FILES TransactionsPage.qml
    QML_FILES BudgetCreateMenuPage.qml
    QML_FILES BudgetBlock.qml
    QML_FILES
    QML_FILES Application.qml
    QML_FILES Statistics.qml
    QML_FILES CursorRectangle.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appfluxoapp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appfluxoapp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appfluxoapp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
include(FetchContent)
install(TARGETS appfluxoapp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if (ANDROID)
    FetchContent_Declare(
      android_openssl
      DOWNLOAD_EXTRACT_TIMESTAMP true
      URL      https://github.com/KDAB/android_openssl/archive/refs/heads/master.zip
#      URL_HASH MD5=c97d6ad774fab16be63b0ab40f78d945 #optional
    )
    FetchContent_MakeAvailable(android_openssl)
    include(${android_openssl_SOURCE_DIR}/android_openssl.cmake)
endif()

if (ANDROID)
    add_android_openssl_libraries(appfluxoapp)
endif()
