const THREE = require('three');
const PLYLoader = require('three-ply-loader');
const OrbitControls = require('three-orbit-controls')(THREE);
import WindowResize from 'three-window-resize';
PLYLoader(THREE);

var camera, scene, renderer;

const ThreeJSHelper = {
  init: function () {
    scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2(0x212121, 0.0003);
    var SCREEN_WIDTH = window.innerWidth * 0.5,
        SCREEN_HEIGHT = window.innerHeight * 0.8;

    var VIEW_ANGLE = 60, ASPECT = SCREEN_WIDTH / SCREEN_HEIGHT, NEAR = 0.1, FAR = 20000;
    camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
    scene.add( camera );
    camera.position.set(0, -50, 500);

    renderer = new THREE.WebGLRenderer( { antialias: true } );
    renderer.setSize( SCREEN_WIDTH, SCREEN_HEIGHT );
    renderer.setClearColor(scene.fog.color);
    renderer.shadowMap.enabled = true;
    renderer.shadowMapSoft = true;

    document.querySelector('#renderer').appendChild(renderer.domElement);

    WindowResize(renderer, camera);

    var controls = new OrbitControls(camera, renderer.domElement);
    controls.target = new THREE.Vector3(0, 0, 0);
    controls.maxDistance = 3000;

    scene.add(new THREE.AmbientLight(0x606060));

    var dirLight = new THREE.DirectionalLight(0xffffff);
    dirLight.position.set(200, 200, 1000).normalize();
    camera.add(dirLight);
    camera.add(dirLight.target);

    this.loadModels();
  },
  loadModels: function () {
    var loader = new THREE.PLYLoader();
    // TODO replace with proper url
    var meshUrl = "http://localhost:3000/Body.ply"
    loader.load(meshUrl, function ( geometry ) {
      geometry.computeVertexNormals();
      var material = new THREE.MeshPhongMaterial({ color: 0x0055ff, specular: 0x111111 });
      material.side = THREE.DoubleSide;
      var mesh = new THREE.Mesh(geometry, material);
      mesh.position.set(0, 0, 0);
      scene.add(mesh);
    }, undefined, function ( error ) {
      console.error( error );
    });
  }
}

var render = function () {
  if (renderer) {
    renderer.render( scene, camera );
  }
}

var animate = function () {
  requestAnimationFrame(animate);

  render();
}

export { ThreeJSHelper, animate };

