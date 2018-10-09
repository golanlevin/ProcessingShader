// Simple "Hello World" example for shaders in Processing v.3.4.
// Golan Levin, October 2018

PShader myShader;

void setup() {
  size(540, 720, OPENGL);
  myShader = loadShader("myShader.frag");
}

void draw() {
  background(0);

  myShader.set("u_resolution", float(width), float(height));
  myShader.set("u_mouse", float(mouseX), float(mouseY));
  myShader.set("u_time", ((float)millis()/1000.0));
  myShader.set("u_button", mousePressed); 

  noStroke();
  shader(myShader);
  rect(0, 0, width, height);
}


/*
// Here's what the shader code should look like. 
// It should be stored in the file: data/myShader.frag

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
*/


// More resources for programming GLSL shaders in Processing: 
// The Book of Shaders, by Patricio Gonzalez Vivo and Jen Lowe
//    https://thebookofshaders.com/
// Shaders (Processing Shader Tutorial), by Andres Colubri
//    https://processing.org/tutorials/pshader/
// Gene Kogan, Processing Shader Examples: 
//    https://github.com/genekogan/Processing-Shader-Examples/
// Florian Bruggisser, Processing PostFX shaders
//    https://github.com/cansik/processing-postfx
