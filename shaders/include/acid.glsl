#define track cameraPosition.x

#define ACID_INTESITY 1.0 // Lower numbers increase acid effect. [0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 4.0 5.0]

#define DEFORMATION 1 // Different Effects [1 2 3 4]

const float sunPathRotation = -40.0;
const float pi = 3.1415926535;
const float rad = 0.01745329;
float cot(float x) 
	{
	return 1.0 / tan(x);
	}
float sec(float x) 
	{
	return 1.0 / cos(x);
	}
float csc(float x) 
	{
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

		rotate(pos.yz, om * (ACID_INTESITY * 0.6283184));
	}
		
	#elif DEFORMATION == 2
	{	
		float d = sqrt(Distance);
		float a = atan(pos.z / pos.x) + (pos.x < 0.0 ? pi : 0.0);
		a += ACID_INTESITY * (Distance / 24000);
		pos.x = d * cos(a);
		pos.z = d * sin(a);
		//pos.y = tan(pos.x / pos.z);

	}
	#elif DEFORMATION == 3
	{
		float distance2D = pos.x * pos.x + pos.z * pos.z;
	
		pos.y += 5.0 * sin(distance2D * sin((frameTimeCounter * 20 + 36000.0) / 143.0) / 1000.0);
	
		float y = pos.y;
		float x = pos.x;
	
		float om = sin(distance2D * sin((frameTimeCounter * 20.0 + 36000.0) / 256.0) / 5000.0) * sin((frameTimeCounter * 20.0 + 36000.0) / 200.0);
	
		pos.y = x * sin(om) + y * cos(om);
		pos.x = x * cos(om) - y * sin(om);
		
	}
	#elif DEFORMATION == 4
	{
		
		
	}
	#endif
	
	
	

	return pos;
}

/*
float d = sqrt(Distance);
		float a = atan(pos.z / pos.x) + (pos.x < 0.0 ? pi : 0.0);
		a += ACID_INTESITY * (Distance / 6969);
		pos.x = d * cos(a);
		pos.z = d * sin(a);

float d = sqrt(Distance + (pos.y * pos.y));
		float a = atan(pos.y / d) + (d < 0.0 ? pi : 0.0);
		a += ACID_INTESITY * (Distance / 6969);
		pos.x = d * cos(a);
		pos.y = d * sin(a);


*/