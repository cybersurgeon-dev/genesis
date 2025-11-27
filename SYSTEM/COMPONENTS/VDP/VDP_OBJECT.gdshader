shader_type canvas_item;

uniform vec4 C0 : source_color;
uniform vec4 C1 : source_color;
uniform vec4 C2 : source_color;
uniform vec4 C3 : source_color;
uniform vec4 C4 : source_color;
uniform vec4 C5 : source_color;
uniform vec4 C6 : source_color;
uniform vec4 C7 : source_color;
uniform vec4 C8 : source_color;
uniform vec4 C9 : source_color;
uniform vec4 C10 : source_color;
uniform vec4 C11 : source_color;
uniform vec4 C12 : source_color;
uniform vec4 C13 : source_color;
uniform vec4 C14 : source_color;
uniform vec4 C15 : source_color;
uniform float fade_value = 0;

void fragment(){
	vec4 referenceColors[16];
	referenceColors[0] = C0;
	referenceColors[1] = C1;
	referenceColors[2] = C2;
	referenceColors[3] = C3;
	referenceColors[4] = C4;
	referenceColors[5] = C5;
	referenceColors[6] = C6;
	referenceColors[7] = C7;
	referenceColors[8] = C8;
	referenceColors[9] = C9;
	referenceColors[10] = C10;
	referenceColors[11] = C11;
	referenceColors[12] = C12;
	referenceColors[13] = C13;
	referenceColors[14] = C14;
	referenceColors[15] = C15;

	vec4 textureColor = texture(TEXTURE, UV);
	COLOR.rgba = referenceColors[int(floor(textureColor.r * float(16)))].rgba;
}