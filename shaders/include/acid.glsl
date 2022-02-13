#define track cameraPosition.x


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
	
	
	intensity -= 1.0 * sinpowfast (clamp01(track, pos.x, 0.0), 2.0);
	intensity += 1.0 * sinpowfast (clamp01(track, pos.z, 0.0), 2.0);
	intensity -= 1.0 * sinpowfast (clamp01(track, pos.y, 0.0), 2.0);
	
	freq = 1325.0 + 700.0 * clamp01(1.0 - sign(intensity) * sign(Distance));
	
	pos.y += intensity * 5.0 * sin(Distance / freq);
	
	pos.z += intensity * sin(Distance / freq);
	
	om = intensity * sin(Distance * sin((speed * time) * speed / 16) / 1500);

	rotate(pos.yz, om / 0.1);
	

	return pos;
}