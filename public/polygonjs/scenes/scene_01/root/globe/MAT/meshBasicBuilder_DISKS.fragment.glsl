uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
#endif
#include <common>



// /globe/MAT/meshBasicBuilder_DISKS/disk1
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







// /globe/MAT/meshBasicBuilder_DISKS/globals1
varying vec2 v_POLY_globals1_uv;




#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );



	// /globe/MAT/meshBasicBuilder_DISKS/constant1
	vec3 v_POLY_constant1_val = vec3(0.33725490196078434, 0.06274509803921569, 0.06274509803921569);
	
	// /globe/MAT/meshBasicBuilder_DISKS/disk1
	float v_POLY_disk1_float = disk2d(v_POLY_globals1_uv, vec2(0.5, 0.5), 0.55, 0.1);
	
	// /globe/MAT/meshBasicBuilder_DISKS/disk2
	float v_POLY_disk2_float = disk2d(v_POLY_globals1_uv, vec2(0.5, 0.5), 0.41, 0.1);
	
	// /globe/MAT/meshBasicBuilder_DISKS/disk3
	float v_POLY_disk3_float = disk2d(v_POLY_globals1_uv, vec2(0.5, 0.5), 0.21, 0.1);
	
	// /globe/MAT/meshBasicBuilder_DISKS/subtract1
	float v_POLY_subtract1_subtract = (v_POLY_disk1_float - v_POLY_disk2_float - 0.0);
	
	// /globe/MAT/meshBasicBuilder_DISKS/max1
	float v_POLY_max1_val = max(v_POLY_subtract1_subtract, v_POLY_disk3_float);
	
	// /globe/MAT/meshBasicBuilder_DISKS/output1
	diffuseColor.xyz = v_POLY_constant1_val;
	diffuseColor.a = v_POLY_max1_val;



	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vUv2 );
		reflectedLight.indirectDiffuse += lightMapTexel.rgb * lightMapIntensity * RECIPROCAL_PI;
	#else
		reflectedLight.indirectDiffuse += vec3( 1.0 );
	#endif
	#include <aomap_fragment>
	reflectedLight.indirectDiffuse *= diffuseColor.rgb;
	vec3 outgoingLight = reflectedLight.indirectDiffuse;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}