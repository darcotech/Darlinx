import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

CalamaresPage {
    id: root
    
    // State management
    property var selectedProfiles: []
    property var allProfiles: []
    property double totalSizeMB: 0
    property string statusMessage: ""
    
    Component.onCompleted: {
        loadProfiles()
        ensureBaseSelected()
        updateTotalSize()
    }
    
    function loadProfiles() {
        // Load from profiles.json (backend provides this)
        allProfiles = Backend.getAvailableProfiles()
        
        // Auto-select base if required
        selectedProfiles = ["base"]
    }
    
    function ensureBaseSelected() {
        var baseProfile = allProfiles.find(p => p.id === "base")
        if (baseProfile && baseProfile.required) {
            setProfileEnabled("base", true, false)
        }
    }
    
    function toggleProfile(profileId) {
        var index = selectedProfiles.indexOf(profileId)
        
        if (index >= 0) {
            // Deselect
            if (profileId !== "base") {  // Allow deselecting base
                selectedProfiles.splice(index, 1)
            }
        } else {
            // Check selection limit
            if (selectedProfiles.length < allProfiles.length && 
                isCompatible(selectedProfiles.concat([profileId]))) {
                selectedProfiles.push(profileId)
            } else {
                statusMessage = "Too many profiles selected or incompatible combination"
            }
        }
        
        updateTotalSize()
    }
    
    function isCompatible(profileList) {
        // Check for conflicts between profiles
        for (var i = 0; i < profileList.length; i++) {
            var currentProfile = allProfiles.find(p => p.id === profileList[i])
            
            for (var j = i + 1; j < profileList.length; j++) {
                var otherProfile = allProfiles.find(p => p.id === profileList[j])
                
                if (currentProfile.conflicts_with.includes(otherProfile.id)) {
                    return false
                }
            }
        }
        return true
    }
    
    function updateTotalSize() {
        totalSizeMB = 0
        selectedProfiles.forEach(function(profileId) {
            var profile = allProfiles.find(p => p.id === profileId)
            if (profile) {
                totalSizeMB += profile.estimated_size_mb
            }
        })
    }
    
    function getProfileInfo(profileId) {
        return allProfiles.find(p => p.id === profileId)
    }
    
    // UI Layout
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15
        
        // Header
        Label {
            id: titleLabel
            text: "Darlinx Profile Selection"
            font.pixelSize: 28
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            
            FontLoader.onLoaded: {
                font.family = "Inter"  // Or your custom font
            }
        }
        
        SubtitleLabel {
            text: "Choose the profiles that best match your usage. Select multiple for a customized setup."
            Layout.alignment: Qt.AlignHCenter
            horizontalAlignment: Text.AlignHCenter
        }
        
        Divider {
            Layout.fillWidth: true
            height: 1
        }
        
        // Profile List (QListView)
        Rectangle {
            id: profileListContainer
            color: "#f5f5f5"
            radius: 8
            border.color: "#e0e0e0"
            Layout.fillWidth: true
            Layout.preferredHeight: 400
            
            ListView {
                id: profileListView
                anchors.fill: parent
                anchors.margins: 10
                clip: true
                
                model: allProfiles.length > 0 ? allProfiles : []
                
                delegate: ProfileItemDelegate {
                    width: profileListContainer.width - 20
                    modelId: id
                    isBaseProfile: (id === "base")
                    isSelected: selectedProfiles.includes(id)
                    recommendedBySelection: isRecommendedForSelected()
                    
                    onToggleRequested: {
                        toggleProfile(modelId)
                    }
                }
                
                ScrollBar.vertical: ScrollBar {
                    active: true
                }
            }
            
            // Empty state
            Label {
                id: emptyStateLabel
                text: "Loading profiles..."
                visible: allProfiles.length === 0
                anchors.centerIn: parent
                font.italic: true
            }
        }
        
        // Summary Panel
        Rectangle {
            color: "#ffffff"
            radius: 8
            border.color: "#d1d5db"
            Layout.fillWidth: true
            implicitHeight: summaryColumn.height + 20
            
            ColumnLayout {
                id: summaryColumn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 15
                
                RowLayout {
                    Layout.fillWidth: true
                    
                    Label {
                        text: "Selected Profiles:"
                        font.bold: true
                        
                        Connections {
                            function onPressedChanged() {
                                // Recalculate on selection changes
                                updateTotalSize()
                            }
                            
                            target: profileListView.model
                        }
                    }
                    
                    Item { Layout.fillWidth: true }  // Spacer
                    
                    Label {
                        id: sizeLabel
                        text: totalSizeMB > 0 ? formatSize(totalSizeMB) : "0 MB"
                        font.pixelSize: 18
                        
                        function formatSize(mb) {
                            if (mb >= 1024) {
                                return (mb / 1024).toFixed(1) + " GB"
                            }
                            return Math.round(mb) + " MB"
                        }
                    }
                }
                
                Divider {
                    Layout.fillWidth: true
                }
                
                ListView {
                    id: selectedProfilesList
                    width: parent.width
                    height: selectedProfiles.length * 30
                    
                    model: selectedProfiles
                    
                    delegate: RowLayout {
                        Rectangle {
                            color: "transparent"
                            implicitWidth: selectedProfileLabel.width + 24
                            implicitHeight: 26
                            
                            border.color: "transparent"
                            radius: 4
                            
                            Label {
                                id: selectedProfileLabel
                                text: getProfileInfo(modelData).name
                                font.pixelSize: 13
                            }
                            
                            ToolButton {
                                id: removeButton
                                visible: modelData !== "base"  // Can't remove base
                                text: "×"
                                font.pixelSize: 16
                                
                                onClicked: {
                                    toggleProfile(modelData)
                                }
                            }
                        }
                        
                        Layout.leftMargin: 8
                    }
                    
                    ScrollBar.vertical: ScrollBar { active: true }
                }
                
                // Warning for large selections
                RowLayout {
                    id: warningRow
                    
                    Rectangle {
                        color: "#fff3cd"
                        radius: 4
                        implicitWidth: warningIcon.implicitWidth + warningText.width + 20
                        implicitHeight: Math.max(warningIcon.height, warningText.height) + 12
                        
                        visible: totalSizeMB > configuration.warn_on_large_selections
                        
                        Label {
                            id: warningIcon
                            text: "⚠️"
                            font.pixelSize: 16
                        }
                        
                        Label {
                            id: warningText
                            text: "Large installation. Consider selective packages."
                            font.pixelSize: 12
                            Layout.leftMargin: 5
                        }
                    }
                }
            }
        }
        
        // Status/Error Message
        Label {
            id: statusLabel
            text: statusMessage
            color: "#dc3545"
            font.italic: true
            Layout.alignment: Qt.AlignHCenter
            visible: statusMessage.length > 0
        }
        
        Spacer {}
    }
}