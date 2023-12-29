#ifdef GL_ES
precision highp float;
#else
precision lowp float;
#endif

uniform float u_time;
uniform vec2 u_resolution;
uniform sampler2D u_texture_0;

float rand(vec2 radians){
    return fract(sin(dot(radians, vec2(12.9898, 78.233))) * 43758.5453);
}

float coeffDistortion = 0.03;

void main(){
    vec2 coord = gl_FragCoord.xy / u_resolution;
    vec4 final = vec4(1.0);
    float ff_0 = clamp(texture2D(u_texture_0, coord).r, 0.1, 1.0);
    final = mix(texture2D(u_texture_0, coord.xy + rand(coord * u_time) * coeffDistortion) * 0.9, texture2D(u_texture_0, coord), ff_0);
    gl_FragColor = final;
}