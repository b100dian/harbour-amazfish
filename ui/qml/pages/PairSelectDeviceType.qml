import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import "../components"

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.Portrait

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            x: Theme.horizontalPageMargin
            width: page.width - 2*Theme.horizontalPageMargin
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Select Device Type")
            }

            DeviceButton {
                txt: qsTr("Amazfit Bip")
                icn: "../pics/devices/amazfit-bip.png"

                onClicked: {
                    pushPairPage("Amazfit Bip", false);
                }
            }

            DeviceButton {
                txt: qsTr("Amazfit GTS")
                icn: "../pics/devices/amazfit-gts.png"

                onClicked: {
                    pushPairPage("Amazfit GTS", true);
                }
            }

            DeviceButton {
                txt: qsTr("MI Band 2")
                icn: "../pics/devices/miband2.png"

                onClicked: {
                    pushPairPage("MI Band 2", false);
                }
            }
            /*
            Button {
                text: qsTr("Amazfit Bip")
                onClicked: {
                    pushPairPage("Amazfit Bip");
                }
            }
            Button {
                text: qsTr("Amazfit GTS")
                onClicked: {
                    pushPairPage("Amazfit GTS");
                }
            }
            Button {
                text: qsTr("MI Band 2")
                onClicked: {
                    pushPairPage("MI Band 2");
                }
            }
            */
        }
    }

    function pushPairPage(deviceType, auth) {
        var pairPage = pageStack.push(Qt.resolvedUrl("PairPage.qml"));
        pairPage.deviceType = deviceType;
        pairPage.deviceRequiresAuthKey = auth;
    }
}
