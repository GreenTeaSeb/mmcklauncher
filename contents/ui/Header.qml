/*****************************************************************************
 *   Copyright (C) 2022 by Friedrich Schriewer <friedrich.schriewer@gmx.net> *
 *                                                                           *
 *   This program is free software; you can redistribute it and/or modify    *
 *   it under the terms of the GNU General Public License as published by    *
 *   the Free Software Foundation; either version 2 of the License, or       *
 *   (at your option) any later version.                                     *
 *                                                                           *
 *   This program is distributed in the hope that it will be useful,         *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *   GNU General Public License for more details.                            *
 *                                                                           *
 *   You should have received a copy of the GNU General Public License       *
 *   along with this program; if not, write to the                           *
 *   Free Software Foundation, Inc.,                                         *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .          *
 ****************************************************************************/
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
import QtQuick.Controls 2.5
import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import org.kde.kquickcontrolsaddons 2.0 as KQuickAddons

Item {
  property var iconSize
  width: iconSize * 3.75
  height: iconSize
  PlasmaComponents.RoundButton {
    id: settingsButton
    visible: true
    flat: true
    height: iconSize * 2
    width: height
    anchors.left: parent.left

    PlasmaComponents.ToolTip {
        text: "Settings"
    }
    Item {
      id: visualParentSettings
      y: 2 * iconSize
    }
    Image {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "icons/feather/settings.svg"
        width: iconSize
        height: width
        /*
        sourceSize: Qt.size( imgS.sourceSize.width, imgS.sourceSize.height)
        Image {
            id: imgS
            source: parent.source
            width: 0
            height: 0
        }*/
    }
    onClicked: {
      KQuickAddons.KCMShell.openSystemSettings("kcm_quick")
      root.toggle()
      //plasmoid.action("configure").trigger()
    }
  }
  PlasmaComponents.RoundButton {
    id: powerOffButton
    visible: true
    flat: true
    height: iconSize * 2
    width: height
    anchors.right: parent.right

    PlasmaComponents.ToolTip {
        text: "Power Off"
    }
    Image {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "icons/feather/power.svg"
        width: iconSize
        height: width
        /*
        sourceSize: Qt.size( imgP.sourceSize.width, imgP.sourceSize.height)
        Image {
            id: imgP
            source: parent.source
            width: 0
            height: 0
        }*/
    }
    onClicked: {
      pmEngine.performOperation("requestShutDown")
    }
  }
}
