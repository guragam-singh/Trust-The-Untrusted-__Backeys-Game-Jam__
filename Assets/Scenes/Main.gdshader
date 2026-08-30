shader_type canvas_item;

uniform float vignette_intensity : hint_range(0.0, 2.0) = 1.2;
uniform float vignette_opacity : hint_range(0.0, 1.0) = 0.6;

void fragment() {
	vec2 uv = UV;
	float dist = distance(uv, vec2(0.5));
	float vignette = smoothstep(0.3, 0.8, dist * vignette_intensity);
	COLOR = vec4(0.0, 0.0, 0.0, vignette * vignette_opacity);
}