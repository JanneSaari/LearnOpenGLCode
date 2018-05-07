#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

#define NR_POINT_LIGHTS 4

out vec3 Normal;
out vec3 FragPos;
out vec2 TexCoords;
out vec3 LightPos[NR_POINT_LIGHTS];
out vec3 LightDir;


uniform vec3 lightPos[NR_POINT_LIGHTS];
uniform vec3 lightDir;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(aPos, 1.0);
	FragPos = vec3(view * model * vec4(aPos, 1.0));
	Normal = mat3(transpose(inverse(view * model))) * aNormal;
	for(int iii = 0; iii < NR_POINT_LIGHTS; iii++) {
		LightPos[iii] = vec3(view * vec4(lightPos[iii], 1.0));
	}
	TexCoords = aTexCoords;
	LightDir = vec3(view * vec4(lightDir, 0.0));
}