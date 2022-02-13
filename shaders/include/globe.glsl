vec3 UserDeformation(vec3 position) {
	
	rotate(position.xy, position.z / 20);
	rotate(position.zy, position.x / 20);
	
	return position;
}

vec3 Globe(vec3 position, cfloat radius) {
	position.y -= length2(position.xz) / radius;
	
	return position;
}

vec3 Acid(vec3 position) {
	position.zy = rotate(position.zy, sin(length2(position.zx) * 0.00003) * 0.4);
	
	return position;
}

vec3 TerrainDeformation(vec3 position) {
	
#ifdef DEFORM
	
	#if !defined gbuffers_shadow
		position += gbufferModelViewInverse[1].xyz;
	#endif
	
	#if DEFORMATION == 1
		
		position = Globe(position, 100.0);
		
	#elif DEFORMATION == 2
		
		position = Acid(position);
		
	#else
		
		position = UserDeformation(position);
		
	#endif
	
	#if !defined gbuffers_shadow
		position -= gbufferModelViewInverse[1].xyz;
	#endif
	
#endif
	
	return position;
}