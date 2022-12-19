
// INSERT DEFINES



// /globe/MAT/pointsBuilder_DOTS/disk1
float disk_feather(float dist, float radius, float feather){
	if(feather <= 0.0){
		if(dist < radius){return 1.0;}else{return 0.0;}
	} else {
		float half_feather = feather * 0.5;
		if(dist < (radius - half_feather)){
			return 1.0;
		} else {
			if(dist > (radius + half_feather)){
				return 0.0;
			} else {
				float feather_start = (radius - half_feather);
				float blend = 1.0 - (dist - feather_start) / feather;
				return blend;
			}
		}
	}
}

float disk2d(vec2 pos, vec2 center, float radius, float feather){
	float dist = distance(pos, center);
	return disk_feather(dist, radius, feather);
}

// function could be called sphere, but is an overload of disk, and is the same
float disk3d(vec3 pos, vec3 center, float radius, float feather){
	float dist = distance(pos, center);
	return disk_feather(dist, radius, feather);
}







// /globe/MAT/pointsBuilder_DOTS/varyingRead1
varying vec3 baseColor;






#if DEPTH_PACKING == 3200

	uniform float opacity;

#endif

#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>

varying vec2 vHighPrecisionZW;

void main() {

	#include <clipping_planes_fragment>

	vec4 diffuseColor = vec4( 1.0 );

	#if DEPTH_PACKING == 3200

		diffuseColor.a = opacity;

	#endif


	#include <map_fragment>
	#include <alphamap_fragment>

	// INSERT BODY



	// /globe/MAT/pointsBuilder_DOTS/varyingRead1
	vec3 v_POLY_varyingRead1_fragment = baseColor;
	
	// /globe/MAT/pointsBuilder_DOTS/globals1
	vec2 v_POLY_globals1_gl_PointCoord = gl_PointCoord;
	
	// /globe/MAT/pointsBuilder_DOTS/disk1
	float v_POLY_disk1_float = disk2d(v_POLY_globals1_gl_PointCoord, vec2(0.5, 0.5), 0.46, 0.0);
	
	// /globe/MAT/pointsBuilder_DOTS/output1
	diffuseColor.xyz = v_POLY_varyingRead1_fragment;
	diffuseColor.a = v_POLY_disk1_float;



	// the new body lines should be added before the alphatest_fragment
	// so that alpha is set before (which is really how it would be set if the alphamap_fragment above was used by the material node parameters)

	#include <alphatest_fragment>

	#include <logdepthbuf_fragment>


	// Higher precision equivalent of gl_FragCoord.z. This assumes depthRange has been left to its default values.
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;

	#if DEPTH_PACKING == 3200

		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), diffuseColor.a );

	#elif DEPTH_PACKING == 3201

		gl_FragColor = packDepthToRGBA( fragCoordZ );

	#endif

}
