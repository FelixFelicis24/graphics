#version 430

out vec4 daColor;
in vec3 normalWorld;
in vec3 vertexPositionWorld;
in vec2 TexCoord;

uniform vec3 lightPositionWorld;
uniform vec3 eyePositionWorld;
uniform vec4 ambientLight;
uniform sampler2D myTexture;

void main()
{
	//Tex
	vec4 texColor = texture(myTexture, TexCoord);
	//Diffuse
	vec3 lightVectorWorld = normalize(lightPositionWorld - vertexPositionWorld);
	float brightness = dot(lightVectorWorld, normalize(normalWorld));
	vec4 diffuseLight = vec4(brightness, brightness, brightness, 1.0);

	//Specular
	vec3 reflectedLightVectorWorld = reflect(-lightVectorWorld, normalWorld);
	vec3 eyeVectorWorld = normalize(eyePositionWorld - vertexPositionWorld);
	float s = dot(reflectedLightVectorWorld, eyeVectorWorld);
	s = pow(s, 30);
	vec4 specularLight = vec4(0, s, s, 1);

	//Tex
	vec4 texColor = texture(myTexture, TexCoord);
	daColor = (ambientLight + clamp(diffuseLight, 0, 1) + clamp(specularLight, 0, 1)) * texColor;
}