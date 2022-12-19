import { SceneDataManifestImporter } from "@polygonjs/polygonjs/dist/src/engine/io/manifest/import/SceneData";
const manifest = {
  properties: "1671463802663",
  root: "1671463427153",
  nodes: {
    globe: "1671463802663",
    "globe/MAT": "1671463427153",
    "globe/MAT/pointsBuilder_DOTS": "1671463802663",
    "globe/MAT/meshStandardBuilder_SPHERE": "1671463427153",
    "globe/MAT/lineBasicBuilder_ARCS": "1671463427153",
    "globe/MAT/meshBasicBuilder_DISKS": "1671463427153",
    "globe/COP": "1671463427153",
    cameras: "1671463427153",
    "cameras/cameraRenderer1": "1671463427153",
    "cameras/cameraControls1": "1671463427153",
  },
  shaders: {
    "/globe/MAT/pointsBuilder_DOTS": {
      vertex: "1671463802663",
      fragment: "1671463802663",
      "customDistanceMaterial.vertex": "1671463802663",
      "customDistanceMaterial.fragment": "1671463802663",
      "customDepthMaterial.vertex": "1671463802663",
      "customDepthMaterial.fragment": "1671463802663",
      "customDepthDOFMaterial.vertex": "1671463802663",
      "customDepthDOFMaterial.fragment": "1671463802663",
    },
    "/globe/MAT/meshStandardBuilder_SPHERE": {
      vertex: "1671463802663",
      fragment: "1671463802663",
      "customDepthMaterial.vertex": "1671463802663",
      "customDepthMaterial.fragment": "1671463802663",
      "customDistanceMaterial.vertex": "1671463802663",
      "customDistanceMaterial.fragment": "1671463802663",
      "customDepthDOFMaterial.vertex": "1671463802663",
      "customDepthDOFMaterial.fragment": "1671463802663",
    },
    "/globe/MAT/lineBasicBuilder_ARCS": {
      vertex: "1671463802663",
      fragment: "1671463802663",
      "customDistanceMaterial.vertex": "1671463802663",
      "customDistanceMaterial.fragment": "1671463802663",
      "customDepthMaterial.vertex": "1671463802663",
      "customDepthMaterial.fragment": "1671463802663",
      "customDepthDOFMaterial.vertex": "1671463802663",
      "customDepthDOFMaterial.fragment": "1671463802663",
    },
    "/globe/MAT/meshBasicBuilder_DISKS": {
      vertex: "1671463802663",
      fragment: "1671463802663",
      "customDepthMaterial.vertex": "1671463802663",
      "customDepthMaterial.fragment": "1671463802663",
      "customDistanceMaterial.vertex": "1671463802663",
      "customDistanceMaterial.fragment": "1671463802663",
      "customDepthDOFMaterial.vertex": "1671463802663",
      "customDepthDOFMaterial.fragment": "1671463802663",
    },
  },
};

export const loadSceneData_scene_01 = async (options = {}) => {
  const sceneDataRoot = options.sceneDataRoot || "./polygonjs/scenes";
  return await SceneDataManifestImporter.importSceneData({
    sceneName: "scene_01",
    urlPrefix: sceneDataRoot + "/scene_01",
    manifest: manifest,
    onProgress: options.onProgress,
  });
};
