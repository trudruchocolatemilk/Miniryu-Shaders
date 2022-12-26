#define track cameraPosition.x

#define ACID_INTESITY 1.5 // [0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 4.0 5.0]

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
vec3 Acid(vec3 pos) {

	
	
	const float speed = 20.0 / 80.0;
	float time = track + 8000.0;
	float intensity = 1.0;
	float freq = 1.0;
	float Distance, om, x, y, z;

	
	Distance = pos.x * pos.x + pos.z * pos.z;

	//pos.x += sin(Distance * sin(float(time) / (143.0 * 8)) / 1000);
	//pos.y += 8 * sin(Distance * sin(float(time) / (143.0 * 8)) / 2000);
	
	
	intensity -= 1.0 * sinpowfast (clamp01(track, pos.x, 0.0), 2.0);
	intensity += 1.0 * sinpowfast (clamp01(track, pos.z, 0.0), 2.0);
	intensity -= 1.0 * sinpowfast (clamp01(track, pos.y, 0.0), 2.0);
	
	freq = 1325.0 + 700.0 * clamp01(1.0 - sign(intensity) * sign(Distance));
	
	pos.y += intensity * 5.0 * sin(Distance / freq);
	
	pos.z += intensity * sin(Distance / freq);

	//pos.y = pos.x * sin(om) + pos.y * cos(om);
	//pos.z = pos.x * cos(om) - pos.y * sin(om);


	//float y = pos.y;
	//float x = pos.x;
	//float z = pos.z;

	
	om = intensity * sin(Distance * sin((speed * time) * speed / 16) / 1500);

	//om = (sin((Distance * Distance) * sin(float(time) / 131072.0) / 5000) * sin(float(time) / 400.0));

	rotate(pos.yz, om / ACID_INTESITY);
	

	return pos;
}


//	int worldTrome = worldTime;

//	worldTrome = worldTime + (24000 * moonPhase);

//	texcoord = gl_TextureMatrix[0] * gl_MultiTexCoord0;

//	vec4 pos = gl_ModelViewMatrix * gl_Vertex;
		
//	float distanceSquared = pos.x * pos.x + pos.z * pos.z;
//	pos.x += sin(distanceSquared*sin(float(worldTrome)/(143.0 * 8))/1000);
	//position.z += sin(distanceSquared*sin(float(worldTrome)/(143.0 * 8))/1000);
//	pos.y += 8*sin(distanceSquared*sin(float(worldTrome)/(143.0 * 8))/2000);
		
//	float y = pos.y;
//	float x = pos.x;
//	float z = pos.z;
		
//	float om = (sin(distanceSquared*sin(float(worldTrome)/131072.0)/5000) * sin(float(worldTrome)/400.0));
		
//	pos.y = x*sin(om)+y*cos(om);
//	pos.x = x*cos(om)-y*sin(om);
//	pos.z = z;