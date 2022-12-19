
// INSERT DEFINES

#define DISTANCE

uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;

#include <common>



// /globe/MAT/meshStandardBuilder_SPHERE/rgbToHsv1
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 rgb2hsv(vec3 c)
{
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

// /globe/MAT/meshStandardBuilder_SPHERE/fresnel1
float fresnel(vec4 worldPosition, vec3 worldNormal, vec3 cameraPosition){
	return dot(
		normalize(worldNormal),
		normalize(cameraPosition - worldPosition.xyz)
	);
}

// /globe/MAT/meshStandardBuilder_SPHERE/hsvToRgb1
// https://github.com/hughsk/glsl-hsv2rgb
// https://stackoverflow.com/questions/15095909/from-rgb-to-hsv-in-opengl-glsl
vec3 hsv2rgb(vec3 c) {
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}







// /globe/MAT/meshStandardBuilder_SPHERE/globals1
varying vec4 v_POLY_globals1_worldPosition;
varying vec3 v_POLY_globals1_worldNormal;
varying vec3 v_POLY_globals1_cameraPosition;




#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <clipping_planes_pars_fragment>

struct SSSModel {
	bool isActive;
	vec3 color;
	float thickness;
	float power;
	float scale;
	float distortion;
	float ambient;
	float attenuation;
};

void RE_Direct_Scattering(
	const in IncidentLight directLight,
	const in GeometricContext geometry,
	const in SSSModel sssModel,
	inout ReflectedLight reflectedLight
	){
	vec3 scatteringHalf = normalize(directLight.direction + (geometry.normal * sssModel.distortion));
	float scatteringDot = pow(saturate(dot(geometry.viewDir, -scatteringHalf)), sssModel.power) * sssModel.scale;
	vec3 scatteringIllu = (scatteringDot + sssModel.ambient) * (sssModel.color * (1.0-sssModel.thickness));
	reflectedLight.directDiffuse += scatteringIllu * sssModel.attenuation * directLight.color;
}

void main() {

	#include <clipping_planes_fragment>

	vec4 diffuseColor = vec4( 1.0 );

	#include <map_fragment>
	#include <alphamap_fragment>



	// /globe/MAT/meshStandardBuilder_SPHERE/constant2
	vec3 v_POLY_constant2_val = vec3(0.0392156862745098, 0.1450980392156863, 0.25098039215686274);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/rgbToHsv1
	vec3 v_POLY_rgbToHsv1_hsv = rgb2hsv(v_POLY_constant2_val);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/fresnel1
	float v_POLY_fresnel1_fresnel = fresnel(v_POLY_globals1_worldPosition,v_POLY_globals1_worldNormal,v_POLY_globals1_cameraPosition);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/multAdd1
	vec3 v_POLY_multAdd1_val = (vec3(1.0, 0.5, 1.0)*(v_POLY_rgbToHsv1_hsv + vec3(0.0, 0.0, 0.0))) + vec3(0.0, 0.0, 0.0);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/hsvToRgb1
	vec3 v_POLY_hsvToRgb1_rgb = hsv2rgb(v_POLY_multAdd1_val);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/mix1
	vec3 v_POLY_mix1_mix = mix(v_POLY_hsvToRgb1_rgb, v_POLY_constant2_val, v_POLY_fresnel1_fresnel);
	
	// /globe/MAT/meshStandardBuilder_SPHERE/output1
	float POLY_metalness = 1.0;
	float POLY_roughness = 1.0;
	vec3 POLY_emissive = v_POLY_mix1_mix;
	SSSModel POLY_SSSModel = SSSModel(/*isActive*/false,/*color*/vec3(1.0, 1.0, 1.0), /*thickness*/0.1, /*power*/2.0, /*scale*/16.0, /*distortion*/0.1,/*ambient*/0.4,/*attenuation*/0.8 );




	// INSERT BODY

	#include <alphatest_fragment>

	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist ); // clamp to [ 0, 1 ]

	gl_FragColor = packDepthToRGBA( dist );

}
