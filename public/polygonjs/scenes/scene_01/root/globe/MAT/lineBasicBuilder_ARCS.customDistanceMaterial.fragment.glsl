
// INSERT DEFINES



// /globe/MAT/lineBasicBuilder_ARCS/fitFrom01ToVariance1
//
//
// FIT
//
//
float fit(float val, float srcMin, float srcMax, float destMin, float destMax){
	float src_range = srcMax - srcMin;
	float dest_range = destMax - destMin;

	float r = (val - srcMin) / src_range;
	return (r * dest_range) + destMin;
}
vec2 fit(vec2 val, vec2 srcMin, vec2 srcMax, vec2 destMin, vec2 destMax){
	return vec2(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y)
	);
}
vec3 fit(vec3 val, vec3 srcMin, vec3 srcMax, vec3 destMin, vec3 destMax){
	return vec3(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z)
	);
}
vec4 fit(vec4 val, vec4 srcMin, vec4 srcMax, vec4 destMin, vec4 destMax){
	return vec4(
		fit(val.x, srcMin.x, srcMax.x, destMin.x, destMax.x),
		fit(val.y, srcMin.y, srcMax.y, destMin.y, destMax.y),
		fit(val.z, srcMin.z, srcMax.z, destMin.z, destMax.z),
		fit(val.w, srcMin.w, srcMax.w, destMin.w, destMax.w)
	);
}

//
//
// FIT TO 01
// fits the range [srcMin, srcMax] to [0, 1]
//
float fitTo01(float val, float srcMin, float srcMax){
	float size = srcMax - srcMin;
	return (val - srcMin) / size;
}
vec2 fitTo01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitTo01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitTo01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitTo01(val.x, srcMin.x, srcMax.x),
		fitTo01(val.y, srcMin.y, srcMax.y),
		fitTo01(val.z, srcMin.z, srcMax.z),
		fitTo01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01
// fits the range [0, 1] to [destMin, destMax]
//
float fitFrom01(float val, float destMin, float destMax){
	return fit(val, 0.0, 1.0, destMin, destMax);
}
vec2 fitFrom01(vec2 val, vec2 srcMin, vec2 srcMax){
	return vec2(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y)
	);
}
vec3 fitFrom01(vec3 val, vec3 srcMin, vec3 srcMax){
	return vec3(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z)
	);
}
vec4 fitFrom01(vec4 val, vec4 srcMin, vec4 srcMax){
	return vec4(
		fitFrom01(val.x, srcMin.x, srcMax.x),
		fitFrom01(val.y, srcMin.y, srcMax.y),
		fitFrom01(val.z, srcMin.z, srcMax.z),
		fitFrom01(val.w, srcMin.w, srcMax.w)
	);
}

//
//
// FIT FROM 01 TO VARIANCE
// fits the range [0, 1] to [center - variance, center + variance]
//
float fitFrom01ToVariance(float val, float center, float variance){
	return fitFrom01(val, center - variance, center + variance);
}
vec2 fitFrom01ToVariance(vec2 val, vec2 center, vec2 variance){
	return vec2(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y)
	);
}
vec3 fitFrom01ToVariance(vec3 val, vec3 center, vec3 variance){
	return vec3(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z)
	);
}
vec4 fitFrom01ToVariance(vec4 val, vec4 center, vec4 variance){
	return vec4(
		fitFrom01ToVariance(val.x, center.x, variance.x),
		fitFrom01ToVariance(val.y, center.y, variance.y),
		fitFrom01ToVariance(val.z, center.z, variance.z),
		fitFrom01ToVariance(val.w, center.w, variance.w)
	);
}

// /globe/MAT/lineBasicBuilder_ARCS/hsvToRgb1
// https://github.com/hughsk/glsl-hsv2rgb
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

// /globe/MAT/lineBasicBuilder_ARCS/cycle1
float cycle(float val, float val_min, float val_max){
	if(val >= val_min && val < val_max){
		return val;
	} else {
		float range = val_max - val_min;
		if(val >= val_max){
			float delta = (val - val_max);
			return val_min + mod(delta, range);
		} else {
			float delta = (val_min - val);
			return val_max - mod(delta, range);
		}
	}
}







// /globe/MAT/lineBasicBuilder_ARCS/globals1
uniform float time;

// /globe/MAT/lineBasicBuilder_ARCS/attribute1
varying float v_POLY_attribute_id;

// /globe/MAT/lineBasicBuilder_ARCS/attribute2
varying float v_POLY_attribute_idn;





#define DISTANCE

uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;

#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <clipping_planes_pars_fragment>

void main () {

	#include <clipping_planes_fragment>

	vec4 diffuseColor = vec4( 1.0 );

	#include <map_fragment>
	#include <alphamap_fragment>

	// INSERT BODY



	// /globe/MAT/lineBasicBuilder_ARCS/attribute1
	float v_POLY_attribute1_val = v_POLY_attribute_id;
	
	// /globe/MAT/lineBasicBuilder_ARCS/globals1
	float v_POLY_globals1_time = time;
	
	// /globe/MAT/lineBasicBuilder_ARCS/attribute3
	float v_POLY_attribute3_val = v_POLY_attribute_id;
	
	// /globe/MAT/lineBasicBuilder_ARCS/constant1
	float v_POLY_constant1_val = 2.0;
	
	// /globe/MAT/lineBasicBuilder_ARCS/attribute2
	float v_POLY_attribute2_val = v_POLY_attribute_idn;
	
	// /globe/MAT/lineBasicBuilder_ARCS/round1
	float v_POLY_round1_val = sign(v_POLY_attribute1_val)*floor(abs(v_POLY_attribute1_val)+0.5);
	
	// /globe/MAT/lineBasicBuilder_ARCS/round2
	float v_POLY_round2_val = sign(v_POLY_attribute3_val)*floor(abs(v_POLY_attribute3_val)+0.5);
	
	// /globe/MAT/lineBasicBuilder_ARCS/negate1
	float v_POLY_negate1_val = -1.0 * v_POLY_constant1_val;
	
	// /globe/MAT/lineBasicBuilder_ARCS/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_round1_val, 150.55);
	
	// /globe/MAT/lineBasicBuilder_ARCS/floatToVec2_2
	vec2 v_POLY_floatToVec2_2_vec2 = vec2(v_POLY_round2_val, 137.55);
	
	// /globe/MAT/lineBasicBuilder_ARCS/random1
	float v_POLY_random1_rand = rand(v_POLY_floatToVec2_1_vec2);
	
	// /globe/MAT/lineBasicBuilder_ARCS/random2
	float v_POLY_random2_rand = rand(v_POLY_floatToVec2_2_vec2);
	
	// /globe/MAT/lineBasicBuilder_ARCS/floatToVec3_1
	vec3 v_POLY_floatToVec3_1_vec3 = vec3(v_POLY_random1_rand, 0.76, 0.75);
	
	// /globe/MAT/lineBasicBuilder_ARCS/fitFrom01ToVariance1
	float v_POLY_fitFrom01ToVariance1_val = fitFrom01ToVariance(v_POLY_random2_rand, 0.5, 9.0);
	
	// /globe/MAT/lineBasicBuilder_ARCS/hsvToRgb1
	vec3 v_POLY_hsvToRgb1_rgb = hsv2rgb(v_POLY_floatToVec3_1_vec3);
	
	// /globe/MAT/lineBasicBuilder_ARCS/multAdd1
	float v_POLY_multAdd1_val = (-0.2*(v_POLY_globals1_time + v_POLY_fitFrom01ToVariance1_val)) + 0.0;
	
	// /globe/MAT/lineBasicBuilder_ARCS/cycle1
	float v_POLY_cycle1_val = cycle(v_POLY_multAdd1_val, v_POLY_negate1_val, v_POLY_constant1_val);
	
	// /globe/MAT/lineBasicBuilder_ARCS/null1
	float v_POLY_null1_val = v_POLY_cycle1_val;
	
	// /globe/MAT/lineBasicBuilder_ARCS/multAdd2
	float v_POLY_multAdd2_val = (1.0*(v_POLY_null1_val + 0.02)) + 0.0;
	
	// /globe/MAT/lineBasicBuilder_ARCS/multAdd3
	float v_POLY_multAdd3_val = (1.0*(v_POLY_null1_val + 0.84)) + 0.0;
	
	// /globe/MAT/lineBasicBuilder_ARCS/smoothstep1
	float v_POLY_smoothstep1_val = smoothstep(v_POLY_null1_val, v_POLY_multAdd2_val, v_POLY_attribute2_val);
	
	// /globe/MAT/lineBasicBuilder_ARCS/multAdd4
	float v_POLY_multAdd4_val = (1.0*(v_POLY_multAdd3_val + 0.2)) + 0.0;
	
	// /globe/MAT/lineBasicBuilder_ARCS/smoothstep2
	float v_POLY_smoothstep2_val = smoothstep(v_POLY_multAdd4_val, v_POLY_multAdd3_val, v_POLY_attribute2_val);
	
	// /globe/MAT/lineBasicBuilder_ARCS/min1
	float v_POLY_min1_val = min(v_POLY_smoothstep1_val, v_POLY_smoothstep2_val);
	
	// /globe/MAT/lineBasicBuilder_ARCS/output1
	diffuseColor.xyz = v_POLY_hsvToRgb1_rgb;
	diffuseColor.w = v_POLY_min1_val;




	#include <alphatest_fragment>

	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist ); // clamp to [ 0, 1 ]

	gl_FragColor = packDepthToRGBA( dist );

}
