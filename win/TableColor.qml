import QtQuick 2.0
//import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Item {
    id: tableContainer
    visible: true
        width: 640
        height: 480

        TableView {
            id: tableView
            frameVisible: true
            anchors.fill: parent

            model:ListModel{
                id:listModel
                ListElement{
                    Name:qsTr(" ")
                    age:18
                                     From:qsTr(" ")
                }
                ListElement{
                                     Name:qsTr(" ")
                    age:19
                                     From:qsTr(" ")
                }
                ListElement{
                                     Name:qsTr(" ")
                    age:20
                                     From:qsTr(" ")
                }
                ListElement{
                                     Name:qsTr(" ")
                    age:21
                                     From:qsTr(" ")
                }

            }
            Component{
                id:itemDelegateText
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    color: styleData.selected?"#1E90FF":"#000000"
                    elide: styleData.elideMode
                    text: styleData.value
                    font.pointSize: 12
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                }
            }

            TableViewColumn{
                role:"name"
                title: "name"
                width:100
                delegate: itemDelegateText
            }

            TableViewColumn{
                role:"age"
                title: "age"
                width:(tableView.width-100)/2
                delegate:itemDelegateText
            }

            TableViewColumn{
                role:"from"
                title:"from"
                width:(tableView.width-100)/2
                delegate: itemDelegateText
            }

            headerDelegate: Rectangle{
                height: 30
                border.width: 1
                color: "#FAEBD7"
                border.color: "#04f6f6"
                Text {
                    id: headerName
                    text: styleData.value
                    font.pointSize: 15
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.fill: parent
                }
            }

            rowDelegate: Rectangle{
                id:rowRectangle
                property color rowColor: styleData.selected?"#FFDEAD":(styleData.alternate ? "#F0FFF0":"#E6E6FA")
                color:rowColor
                height: 30

                Rectangle{
                    x:100
                    height:parent.height
                    width:1
                    color:"black"
                }

                Rectangle{
                    x:(tableView.width - 100)/2+100
                    height:parent.height
                    width:1
                    color:"black"
                }
    //            MouseArea{
    //                anchors.fill: parent
    //                hoverEnabled: true
    //                enabled: true
    //                property bool isClicked: false
    //                onEntered: {
    //                  //  rowColor = rowRectangle.color
    //                   // rowRectangle.color="#87CEFA"

    //                }
    //                onExited: {

    //                   // rowRectangle.color=rowColor

    //                  //  console.log(isClicked)
    //                }
    //                onClicked: {

    //                    if(tableView.rowCount > styleData.row){
    //                        tableView.selection.clear()
    //                        tableView.selection.select(styleData.row)
    //                       // rowColor="#FFDEAD"


    //                    }
    //                }
    //            }
           }
        }

}
