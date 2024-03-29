#version 120

//upper majority of sky

varying vec4 color;

const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform int fogMode;




void main() {
	
	vec3 skyColor = color.rgb * 1f;
	float skyColorBoost = 0.0f;
	
		 skyColor.r = 0.2;
		 skyColor.g = 0.1;
		 skyColor.b = 0.4;

		 skyColor.rgb = gl_Fog.color.rgb;

	// if (color.a < 0.6f)
	// {
	// 	skyColor.rgb = vec3(0.75f);
	// }

	gl_FragData[0] = vec4(skyColor.rgb, color.a);
	gl_FragData[1] = vec4(0.0f, 0.0f, 1.0f, 1.0f);
	
	
	//gl_FragData[2] = vec4(0.0f, 0.0f, 0.0f, 1.0f);
	//gl_FragData[3] = vec4(0.0f, 0.0f, 0.0f, 1.0f);
}