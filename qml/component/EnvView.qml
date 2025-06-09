import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Helpers

Item {
    id: root
    width: 800
    height: 600

    property int dimX: 3
    property int dimY: 3
    property int dimZ: 3

    View3D {
        anchors.fill: parent
        camera: camera
        importScene: sceneRoot

        environment: SceneEnvironment {
            clearColor: "transparent"
            backgroundMode: SceneEnvironment.Transparent
        }
    }

    PerspectiveCamera {
        id: camera
        position: Qt.vector3d(10, 10, 20)
        eulerRotation.x: -30
        eulerRotation.y: 30
        fieldOfView: 90
    }

    Node {
        id: sceneRoot
        property real spacing: 150

        DirectionalLight {
                        ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
                        brightness: 1.0
                        eulerRotation.x: -25
                    }

        Repeater3D {
            id: cubeRepeater
            model: dimX * dimY * dimZ

            delegate: Model {
                source: "#Cube"
                scale: Qt.vector3d(1, 1, 1)
                position: Qt.vector3d((Math.floor(index / (dimZ * dimY)))*sceneRoot.spacing,
                                    (Math.floor(index / dimZ) % dimY)*sceneRoot.spacing,
                                    (index % dimZ)*sceneRoot.spacing)
                materials: [
                    PrincipledMaterial {
                        baseColor: Qt.rgba(0.8, 0.8, 0.8, 1.0)
                    }
                ]

                Component.onCompleted: {
                                console.log("Cube created at index:", index, "posX : " , Math.floor(index / (dimZ * dimY)), "posY : ", Math.floor(index / dimZ) % dimY, "posZ : ", index % dimZ)
                            }
            }
        }
    }

    OrbitCameraController {
        anchors.fill: parent
        camera: camera
        origin: sceneRoot
    }
}
