#define track cameraPosition.x

#define ACID_INTESITY 1.5 // Lower numbers increase acid effect. [0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 4.0 5.0]

#define DEFORMATION 1 // Different Effects [1 2 3]

const float sunPathRotation = -40.0;
const float pi = 3.1415926535;
const float rad = 0.01745329;
float cot(float x) {
	return 1.0 / tan(x);
	}
float sec(float x) {
	return 1.0 / cos(x);
	}
float csc(float x) {
	return 1.0 / sin(x);
	}




void rotate(inout vec2 vector, float radians) {
    vector *= mat2(cos(radians), -sin(radians),
                   sin(radians),  cos(radians));
}
//e -Ryry
vec3 Acid(vec3 pos) 
{

	
	const float speed = 20.0 / 80.0;
	float time = track + 8000.0;
	float intensity = 1.0;
	float freq = 1.0;
	float Distance, om, x, y, z;

	
	Distance = pos.x * pos.x + pos.z * pos.z;


	#if DEFORMATION == 1
	{
		om = intensity * sin(Distance * sin((speed * time) * speed / 16) / 1500);

		rotate(pos.yz, om / ACID_INTESITY);
	}
		
	#elif DEFORMATION == 2
	{	
		//add stuff here
	}
	#elif DEFORMATION == 3
		
		//add stuff here
		
	#endif
	
	
	

	return pos;
}

