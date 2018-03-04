varying vec2 _uv;

void main()
{ 
	_uv = uv;
	gl_Position = vec4(position, 1.0);
}

========

varying vec2 _uv;

uniform vec3 colour;

float vignette(vec2 p, float r)
{
	return 1.0 - length(p);
	//return smoothstep(0.0,1.0, length(p) * r);
}

void main() 
{
	//float v = smoothstep(0.468,-0.276, _uv.y);
	//vec3 a = vec3(0.1,0.1,0.12);
	//vec3 b = vec3(0.1,0.1,0.12);
	//vec3 rgb = mix(a,b,v);

	float v = vignette(_uv - 0.5, 1.0) + 0.3;

	gl_FragColor = vec4(colour * v, 1.0);
}