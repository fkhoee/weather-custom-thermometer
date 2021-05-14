import QtQuick 2.5

Item {
    id: fetchbar

    property alias buttonFetchLabel: buttonstart.text
    property alias button_width: buttonstart.width
    signal buttonStartClicked

    AnimateButton{
        id: buttonstart
        anchors.left: parent.left
        anchors.leftMargin: 25
        y: 10
        button_width: 300
        button_height: 60;
        text: "get datas"

        onClicked: fetchbar.buttonStartClicked()
    }
}
