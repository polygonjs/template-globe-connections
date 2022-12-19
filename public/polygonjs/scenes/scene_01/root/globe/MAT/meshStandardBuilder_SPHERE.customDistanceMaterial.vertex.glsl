#define DISTANCE
varying vec3 vWorldPosition;
#include <common>



// /globe/MAT/meshStandardBuilder_SPHERE/globals1
varying vec4 v_POLY_globals1_worldPosition;
varying vec3 v_POLY_globals1_worldNormal;
varying vec3 v_POLY_globals1_cameraPosition;




#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
// removed:
//		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
// removed:
//	#include <begin_vertex>



	// /globe/MAT/meshStandardBuilder_SPHERE/globals1
	v_POLY_globals1_worldPosition = modelMatrix * vec4( position, 1.0 );
	v_POLY_globals1_worldNormal = normalize( mat3( modelMatrix[0].xyz, modelMatrix[1].xyz, modelMatrix[2].xyz ) * normal );
	v_POLY_globals1_cameraPosition = vec3(cameraPosition);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/output1
	vec3 transformed = position;
	vec3 objectNormal = normal;
	#ifdef USE_TANGENT
		vec3 objectTangent = vec3( tangent.xyz );
	#endif



	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <worldpos_vertex>
	#include <clipping_planes_vertex>
	vWorldPosition = worldPosition.xyz;
}