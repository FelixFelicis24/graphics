#version 430


in vec3 normalWorld;
in vec3 vertexPositionWorld;
in vec2 uv;

uniform vec3 lightPositionWorld;
uniform vec3 eyePositionWorld;
uniform vec4 ambientLight;
uniform sampler2D myTexture;

out vec4 daColor;

void main()
{
	//Diffuse
	vec3 lightVectorWorld = normalize(lightPositionWorld - vertexPositionWorld);
	float brightness = dot(lightVectorWorld, normalize(normalWorld));
	vec4 diffuseLight = vec4(brightness, brightness, brightness, 1.0);

	//Specular
	vec3 reflectedLightVectorWorld = reflect(-lightVectorWorld, normalWorld);
	vec3 eyeVectorWorld = normalize(eyePositionWorld - vertexPositionWorld);
	float s = dot(reflectedLightVectorWorld, eyeVectorWorld);
	s = pow(s, 100);
	vec4 specularLight = vec4(s, s, s, 1);

	//Texture
	vec4 texColor = texture(myTexture, uv);

	daColor = texColor * (ambientLight + clamp(diffuseLight, 0, 1) + clamp(specularLight, 0, 1));

}