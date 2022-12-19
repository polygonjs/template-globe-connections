uniform float size;
uniform float scale;
#include <common>



// /globe/MAT/pointsBuilder_DOTS/varyingWrite1
varying vec3 baseColor;

// /globe/MAT/pointsBuilder_DOTS/attribute1
attribute float id;




#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <color_vertex>



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



	#include <morphcolor_vertex>
// removed:
//	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
// removed:
//	gl_PointSize = size;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <fog_vertex>
}