pragma Singleton
import QtQuick 2.6

QtObject {
    property FontLoader fontLoader: FontLoader{
        id: fontLoader
        source: "Montserrat-Regular.ttf"
    }
    readonly property alias fontFamily: fontLoader.name
    readonly property int width: 1240
    readonly property int height: 880
    readonly property color gradientBg1: "#13547a"
    readonly property color gradientBg2: "#80d0c7"
}
