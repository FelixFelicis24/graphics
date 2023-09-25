#version 430

in layout(location=0) vec3 position;
in layout(location=1) vec3 vertexColor;

uniform vec3 dominatingColor;
uniform float xFlip;
uniform float yFlip;
//uniform float zFlip;

out vec3 theColor;

void main()
{
	gl_Position = vec4(position, 1.0);
	gl_Position.x = gl_Position.x * xFlip;
	gl_Position.y = gl_Position.y * yFlip;
	//gl_Position.z = gl_Position.z * zFlip;
	theColor = dominatingColor;
}