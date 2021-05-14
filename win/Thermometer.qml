import QtQuick 2.0
import "jsonservice.js" as Service

Rectangle{
    id: tempContainer
    anchors.left: weatherTable.right
    anchors.leftMargin: 10
    width: 180
    height: 800
    radius: 10
    color: "lightblue"
    y: 20

    ListView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true
        model: 101
        delegate: linesDelegate
        spacing: 5
    }

    Component {
        id: linesDelegate
        Rectangle {
            color: "purple"
            width: Service.calculatePosition(index)
            height: 2
            z: 23

            Label {
                anchors.right: parent.right
                text: Service.calculateTempText(index)
            }
        }

    }

}
