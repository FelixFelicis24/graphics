#version 430

in layout(location=0) vec4 vertexPositionModel;
in layout(location=1) vec3 vertexColor;
in layout(location=2) vec3 normalModel;
in layout(location=3) vec2 texCoord;


uniform mat4 modelToProjectionMatrix;
uniform mat4 modelToWorldMatrix;

out vec3 normalWorld;
out vec3 vertexPositionWorld;
out vec2 uv;
//out vec3 color;

void main()
{
	gl_Position = modelToProjectionMatrix * vertexPositionModel;
	normalWorld = vec3(modelToWorldMatrix * vec4(normalModel, 0));
	vertexPositionWorld = vec3(modelToWorldMatrix * vertexPositionModel);
	//color = vec3(1.0f, 1.0f, 1.0f);
	uv = texCoord;
}