import QtQuick
import QtQuick.Controls
import QtQuick3D
import QtQuick3D.Helpers

Item {
    id: root
    width: 800
    height: 600

    property int dimX: 1
    property int dimY: 1
    property int dimZ: 1

    function calculateEulerRotation(fromVec3, toVec3) {
        var dx = toVec3.x - fromVec3.x;
        var dy = toVec3.y - fromVec3.y;
        var dz = toVec3.z - fromVec3.z;

        var yaw = Math.atan2(dz, dx) * 180 / Math.PI;
        var distXZ = Math.sqrt(dx*dx + dz*dz);
        var pitch = -Math.atan2(dy, distXZ) * 180 / Math.PI;

        return Qt.vector3d(pitch, yaw, 0);
    }

    View3D {
        anchors.fill: parent
        camera: camera
        importScene: sceneRoot

        environment: SceneEnvironment {
            clearColor: "transparent"
            backgroundMode: SceneEnvironment.Transparent
        }

        Component.onDestruction: {
            importScene = null
        }
    }

    PerspectiveCamera {
        id: camera
        position: Qt.vector3d(0, 200, 600)
        fieldOfView: 110
    }

    Node {
        id: orbitPivot
        property real angle: 0
        property real radius: 500
        property vector3d center: Qt.vector3d(
            (dimX - 1) * sceneRoot.spacing / 2,
            (dimY - 1) * sceneRoot.spacing / 2,
            (dimZ - 1) * sceneRoot.spacing / 2
        )

        onAngleChanged: {
            let rad = angle * Math.PI / 180
            let camPos = Qt.vector3d(
                center.x + radius * Math.cos(rad),
                center.y + 200,
                center.z + radius * Math.sin(rad)
            )
            camera.position = camPos
            camera.lookAt(center)

            cameraLightNode.position = camPos
            cameraLightNode.eulerRotation = calculateEulerRotation(camPos, center)
            basePlate.eulerRotation.y = -angle
        }

        NumberAnimation on angle {
            id: angleAnimation
            from: 360
            to: 0
            duration: 20000
            loops: Animation.Infinite
            running: root.visible
        }
    }

    Node {
        id: sceneRoot
        property real spacing: 150

        DirectionalLight {
            ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
            brightness: 1.0
            castsShadow: true
            shadowMapQuality: Light.ShadowMapQualityHigh
            shadowMapFar: 2000
            eulerRotation.x: -90
        }

        Node {
            id: cameraLightNode

            PointLight {
                id: pointLight
                ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
                position: Qt.vector3d(0, 0, 0)
                shadowMapFar: 2000
                shadowMapQuality: Light.ShadowMapQualityHigh
                visible: true
                castsShadow: true
                brightness: 5
            }
        }

        Model {
            id: basePlate
            source: "#Cube"
            scale: Qt.vector3d(
                dimX * sceneRoot.spacing/100 * 1.5,
                25/100,
                dimZ * sceneRoot.spacing/100 * 1.5
            )

            position: Qt.vector3d(
                    (dimX - 1) * sceneRoot.spacing / 2,
                    -100,
                    (dimZ - 1) * sceneRoot.spacing / 2
                )

            materials: [
                PrincipledMaterial {
                    baseColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
                    roughness: 0.8
                    metalness: 0.3
                }
            ]
        }

        Repeater3D {
            id: cubeRepeater
            model: dimX * dimY * dimZ

            delegate: Model {
                source: "#Cube"
                scale: Qt.vector3d(1, 1, 1)

                position: Qt.vector3d(
                    Math.floor(index / (dimZ * dimY)) * sceneRoot.spacing,
                    Math.floor(index / dimZ) % dimY * sceneRoot.spacing,
                    (index % dimZ) * sceneRoot.spacing
                )

                materials: [
                    PrincipledMaterial {
                        baseColor: Qt.rgba(0.8, 0.8, 0.8, 1.0)
                    }
                ]
            }
        }
    }

    Component.onCompleted: {
        // Taille de la structure
        let sizeX = dimX * sceneRoot.spacing
        let sizeY = dimY * sceneRoot.spacing
        let sizeZ = dimZ * sceneRoot.spacing

        // Centre de la structure
        let center = orbitPivot.center

        // Convertir FOV en radians
        let fovRad = camera.fieldOfView * Math.PI / 180

        // On calcule le FOV horizontal (approximation)
        let aspect = root.width / root.height
        let fovHorizontal = 2 * Math.atan(Math.tan(fovRad / 2) * aspect)

        // Distance nécessaire pour voir la largeur (X et Z)
        let maxHorizontal = Math.max(sizeX, sizeZ)
        let distanceHorizontal = (maxHorizontal / 2) / Math.tan(fovHorizontal / 2)

        // Hauteur minimum pour voir la structure (on met une marge)
        let height = sizeY * 1.5

        // On place la caméra à la distance horizontale, mais en hauteur pour voir en plongée
        let camX = center.x + distanceHorizontal
        let camY = center.y + height
        let camZ = center.z + distanceHorizontal

        camera.position = Qt.vector3d(camX, camY, camZ)
        camera.lookAt(center)
        orbitPivot.radius = Math.sqrt(distanceHorizontal*distanceHorizontal + height*height)
    }
}
