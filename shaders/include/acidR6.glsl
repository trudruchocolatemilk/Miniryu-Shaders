#define track cameraPosition.x

vec3 Acid(vec3 pos) {
  float distance2D = locposition.x * locposition.x + locposition.z * locposition.z;

  locposition.y += 5.0 * sin(distance2D * sin((frameTimeCounter * 20 + 36000.0) / 143.0) / 1000.0);

  float y = locposition.y;
  float x = locposition.x;

  float om = sin(distance2D * sin((frameTimeCounter * 20.0 + 36000.0) / 256.0) / 5000.0) * sin((frameTimeCounter * 20.0 + 36000.0) / 200.0);

  locposition.y = x * sin(om) + y * cos(om);
  locposition.x = x * cos(om) - y * sin(om);

  return pos;
}
