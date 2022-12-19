
uniform float size;
uniform float scale;
#include <common>
#include <clipping_planes_pars_vertex>
varying float vViewZDepth;

// INSERT DEFINES



// /globe/MAT/pointsBuilder_DOTS/varyingWrite1
varying vec3 baseColor;

// /globe/MAT/pointsBuilder_DOTS/attribute1
attribute float id;






// vHighPrecisionZW is added to match CustomMeshDepth.frag
// which is itself taken from threejs
varying vec2 vHighPrecisionZW;

void main() {

	// INSERT BODY



	// /globe/MAT/pointsBuilder_DOTS/constant1
	float v_POLY_constant1_val = 0.002;
	
	// /globe/MAT/pointsBuilder_DOTS/constant2
	vec3 v_POLY_constant2_val = vec3(1.0, 1.0, 1.0);
	
	// /globe/MAT/pointsBuilder_DOTS/constant3
	vec3 v_POLY_constant3_val = vec3(0.611764705882353, 0.6078431372549019, 0.7490196078431373);
	
	// /globe/MAT/pointsBuilder_DOTS/attribute1
	float v_POLY_attribute1_val = id;
	
	// /globe/MAT/pointsBuilder_DOTS/round1
	float v_POLY_round1_val = sign(v_POLY_attribute1_val)*floor(abs(v_POLY_attribute1_val)+0.5);
	
	// /globe/MAT/pointsBuilder_DOTS/output1
	vec3 transformed = position;
	vec3 objectNormal = normal;
	#ifdef USE_TANGENT
		vec3 objectTangent = vec3( tangent.xyz );
	#endif
	gl_PointSize = v_POLY_constant1_val * size * 10.0;
	
	// /globe/MAT/pointsBuilder_DOTS/floatToVec2_1
	vec2 v_POLY_floatToVec2_1_vec2 = vec2(v_POLY_round1_val, 0.0);
	
	// /globe/MAT/pointsBuilder_DOTS/random1
	float v_POLY_random1_rand = rand(v_POLY_floatToVec2_1_vec2);
	
	// /globe/MAT/pointsBuilder_DOTS/mix1
	vec3 v_POLY_mix1_mix = mix(v_POLY_constant2_val, v_POLY_constant3_val, v_POLY_random1_rand);
	
	// /globe/MAT/pointsBuilder_DOTS/varyingWrite1
	baseColor = v_POLY_mix1_mix;





	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>

	vViewZDepth = - mvPosition.z;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = ( projectionMatrix[ 2 ][ 3 ] == - 1.0 );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif

	vHighPrecisionZW = gl_Position.zw;

}
