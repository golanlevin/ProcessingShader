#ifdef GL_ES
precision mediump float;
#endif

#define PROCESSING_COLOR_SHADER

uniform vec2  u_resolution;
uniform vec2  u_mouse;
uniform bool  u_button;
uniform float u_time;

void main() {
    vec2 uv = gl_FragCoord.st/u_resolution;

    float r = (u_button) ? uv.x : 1.0-uv.x;
    float g = u_mouse.x / u_resolution.x;
    float b = 0.5 + 0.5 * sin(u_time + 30.0*uv.y);

    gl_FragColor = vec4(r,g,b, 1.0);
}