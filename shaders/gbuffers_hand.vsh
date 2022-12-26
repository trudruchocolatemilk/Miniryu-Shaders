#version 120

varying vec4 color;
varying vec4 texcoord;
varying vec4 lmcoord;


attribute vec4 mc_Entity;

uniform int worldTime;
uniform float rainStrength;

varying vec3 normal;
varying vec3 tangent;
varying vec3 binormal;
varying vec3 viewVector;
varying vec2 waves;

varying float distance;
varying float translucent;


void main() {

	texcoord = gl_MultiTexCoord0;
	
	vec4 position = gl_Vertex;
	
	translucent = 0.0f;

	vec4 locposition = gl_ModelViewMatrix * gl_Vertex;
	
	distance = sqrt(locposition.x * locposition.x + locposition.y * locposition.y + locposition.z * locposition.z);


	gl_Position = gl_ProjectionMatrix * (gl_ModelViewMatrix * position);
	
	color = gl_Color;
	
	lmcoord = gl_TextureMatrix[1] * gl_MultiTexCoord1;
	
	gl_FogFragCoord = gl_Position.z;
	
	
	normal = normalize(gl_NormalMatrix * gl_Normal);
	
}