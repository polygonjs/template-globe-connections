
uniform float scale;
attribute float lineDistance;

varying float vLineDistance;

#define DISTANCE
varying vec3 vWorldPosition;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>

// INSERT DEFINES



// /globe/MAT/lineBasicBuilder_ARCS/globals1
uniform float time;

// /globe/MAT/lineBasicBuilder_ARCS/attribute1
varying float v_POLY_attribute_id;

// /globe/MAT/lineBasicBuilder_ARCS/attribute2
varying float v_POLY_attribute_idn;

// /globe/MAT/lineBasicBuilder_ARCS/attribute1
attribute float id;

// /globe/MAT/lineBasicBuilder_ARCS/attribute2
attribute float idn;






// vHighPrecisionZW is added to match CustomMeshDepth.frag
// which is itself taken from threejs
varying vec2 vHighPrecisionZW;


void main() {

	// INSERT BODY



	// /globe/MAT/lineBasicBuilder_ARCS/attribute1
	v_POLY_attribute_id = float(id);
	
	// /globe/MAT/lineBasicBuilder_ARCS/globals1
	float v_POLY_globals1_time = time;
	
	// /globe/MAT/lineBasicBuilder_ARCS/attribute3
	v_POLY_attribute_id = float(id);
	
	// /globe/MAT/lineBasicBuilder_ARCS/attribute2
	v_POLY_attribute_idn = float(idn);
	
	// /globe/MAT/lineBasicBuilder_ARCS/output1
	vec3 transformed = vec3( position );vec4 mvPosition = vec4( transformed, 1.0 ); gl_Position = projectionMatrix * modelViewMatrix * mvPosition;





	vLineDistance = scale * lineDistance;

	#include <color_vertex>
// removed:
//	#include <begin_vertex>
	#include <morphtarget_vertex>
// removed:
//	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>


	vHighPrecisionZW = gl_Position.zw;
}
