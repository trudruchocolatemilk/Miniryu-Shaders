#define track cameraPosition.x

const float sunPathRotation = -40.0;
const float pi = 3.1415926535;
const float rad = 0.01745329;

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

	

	
	//track, 95.9, 492.5 - 95.9


	

	
	
	
	Distance = pos.x * pos.x + pos.z * pos.z;
	
	intensity  = 1.0 * sinpowslow (clamp01(track, 40 - 90, 40.0), 2.0);
	intensity -= 2.0 * sinpowsharp(clamp01(track,  120 - 170, 120.0), 1.0);
	intensity += 2.0 * sinpowsharp(clamp01(track, 477 - 527, 477.0), 1.0);
	intensity -= 2.0 * sinpowsharp(clamp01(track, 818, 868 - 818), 1.0);
	intensity += 2.0 * sinpowsharp(clamp01(track, 1162, 1212 - 1162), 1.0);
	
	intensity -= 2.0 * sinpowsharp(clamp01(track, 1781, 1831 - 1781), 1.0);
	intensity += 2.0 * sinpowsharp(clamp01(track, 2116, 2166 - 2116), 1.0);
	intensity -= 2.0 * sinpowsharp(clamp01(track, 2460, 2510 - 2460), 1.0);
	intensity += 2.0 * sinpowsharp(clamp01(track, 2898, 2948 - 2898), 1.0);
	intensity -= 2.0 * sinpowsharp(clamp01(track, 3245, 3295 - 3245), 1.0);
	intensity += 2.0 * sinpowsharp(clamp01(track, 3588, 3638 - 3588), 1.0);
	intensity -= 1.0 * sinpowfast (clamp01(track, 3991, 35.0), 2.0);
	
	freq = 1325.0 + 700.0 * clamp01(1.0 - sign(intensity) * sign(Distance));
	
	pos.y += intensity * 5.0 * sin(Distance / freq);
	
	intensity *= 1.0 - 2.0 * float(track > (120 + 170) / 2.0);
	intensity *= 1.0 - 2.0 * float(track > (818 + 868) / 2.0);
	intensity *= 1.0 - 2.0 * float(track > (1781 + 1831) / 2.0);
	intensity *= 1.0 - 2.0 * float(track > (2460 + 2510) / 2.0);
	intensity *= 1.0 - 2.0 * float(track > (3245 + 3295) / 2.0);
	
	pos.z += intensity * sin(Distance / freq);
	
	intensity  = sinpowfast(clamp01(track, 95.9, 492.5 - 95.9), 3.0);
	intensity -= sinpowslow(clamp01(track, 2171.3, 2375.3 - 2171.3), 3.0);
	intensity += sinpowfast(clamp01(track, 2375.3, 492.5 - 95.9), 3.0);
	intensity -= sinpowfast(clamp01(track, 6000.0, 492.5 - 95.9), 3.0);
	
	om = intensity * sin(Distance * sin(time * speed / 256.0) / 5000);
	rotate(pos.yz, om / 1.5);
	
	
	intensity  = sinpowsmooth(clamp01(track, 7255.7 - 800.0, 1100.0), 1.0);
	intensity -= sinpowsmooth(clamp01(track, 8882.5 - 750.0, 750.0), 1.0);
	
	//if (worldpos.y > 126.9 && worldpos.y < 131.1 && worldpos.z > -2.1 && worldpos.z < 3.1) {
	//	z = 0.0;
	//	y = 0.0;
	//	
	//	y -= sinpowslow(clamp01(track, 7255.7 - 35.0, 35.0), 2.0);
	//	
	//	y += (min(sinpowsharp(clamp01(track, 7406.9, 7458.5 - 7406.9), 1.0), 0.5) * 2.0);
	//	y += (max(sinpowsharp(clamp01(track, 7406.9, 7458.5 - 7406.9), 1.0), 0.5) * 2.0 - 1.0);
	//	
	//	y -= (min(sinpowsharp(clamp01(track, 7610.9, 7662.5 - 7610.9), 1.0), 0.5) * 2.0);
	//	z -= (max(sinpowsharp(clamp01(track, 7610.9, 7662.5 - 7610.9), 1.0), 0.5) * 2.0 - 1.0);
	//	
	//	z += (min(sinpowsharp(clamp01(track, 7813.7, 7865.3 - 7813.7), 1.0), 0.5) * 2.0);
	//	z += (max(sinpowsharp(clamp01(track, 7813.7, 7865.3 - 7813.7), 1.0), 0.5) * 2.0 - 1.0) * 0.7;
	//	
	//	z -= (min(sinpowsharp(clamp01(track, 8017.7, 8068.1 - 8017.7), 1.0), 0.5) * 2.0) * 0.7;
	//	y += (max(sinpowsharp(clamp01(track, 8017.7, 8068.1 - 8017.7), 1.0), 0.5) * 2.0 - 1.0);
	//	
	//	y -= (min(sinpowsharp(clamp01(track, 8221.7, 8272.1 - 8221.7), 1.0), 0.5) * 2.0);
	//	y -= (max(sinpowsharp(clamp01(track, 8221.7, 8272.1 - 8221.7), 1.0), 0.5) * 2.0 - 1.0);
	//	
	//	y += (min(sinpowsharp(clamp01(track, 8424.5, 8476.1 - 8424.5), 1.0), 0.5) * 2.0);
	//	z += (max(sinpowsharp(clamp01(track, 8424.5, 8476.1 - 8424.5), 1.0), 0.5) * 2.0 - 1.0) * 0.7;
	//	
	//	z -= (min(sinpowsharp(clamp01(track, 8628.5, 8678.9 - 8628.5), 1.0), 0.5) * 2.0) * 0.7;
	//	z -= (max(sinpowsharp(clamp01(track, 8628.5, 8678.9 - 8628.5), 1.0), 0.5) * 2.0 - 1.0);
	//	
	//	z += min(sinpowfast(clamp01(track, 8831.3, 35.0), 2.0), 0.5) * 2.0;
	//	
		// tl, br, tr, bl, br, tl, tr, bl
		// y+ = br
		// y- = tl
		// z+ = bl
		// z- = tr
		
	//	pos.y += 2.5 * y;
	//	pos.z += 2.5 * z;
		
	//	rotate(pos.yz, pos.x * intensity * 0.05);
		
	//	pos.z -= 2.5 * z;
	//	pos.y -= 2.5 * y;
	//} else {
	//	pos.y -= cameraPosition.y - 128.0;
	//	
	//	rotateRad(pos.xz, 60.0 * intensity);
	//	
	//	om = dot(pos.x, pos.x) / 4000.0 * intensity;
	//	rotate(pos.yz, om);
	//	
	//	pos.y += cameraPosition.y - 128.0;

	return pos;
}