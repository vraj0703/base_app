#include <flutter/runtime_effect.glsl>

uniform vec2 uResolution;
uniform float uTime;

out vec4 fragColor;

void main() {
    vec2 F = gl_FragCoord.xy;
    vec4 O;
    
    // Iterator and attenuation (distance-squared)
    float i = .2, a;
    // Resolution for scaling and centering
    vec2 r = uResolution.xy;
    // Centered ratio-corrected coordinates
    vec2 p = ( F+F - r ) / r.y / .7;
    // Diagonal vector for skewing
    vec2 d = vec2(-1,1);
    // Blackhole center
    vec2 b = p - i*d;
    // Rotate and apply perspective
    vec2 c = p * mat2(1, 1, d/(.1 + i/dot(b,b)));
    // Rotate into spiraling coordinates
    vec2 v = c * mat2(cos(.5*log(a=dot(c,c)) + uTime*i + vec4(0,33,11,0)))/i;
    // Waves cumulative total for coloring
    vec4 w = vec4(0.0); // Initialize w
    
    // Loop through waves
    for(int j=0; j<9; j++) { // Use integer loop and manual float increment if needed, or just standard loop
        i++;
        w += 1.+sin(vec4(v, v.yx)); // Adjust for vec4 w add
        // Distort coordinates
        v += .7* sin(v.yx*i+uTime) / i + .5;
    }
    
    // Acretion disk radius
    i = length( sin(v/.3)*.4 + c*(3.+d) );
    
    // Red/blue gradient
    O = 1. - exp( -exp( c.x * vec4(.6,-.4,-1,0) )
                   // Wave coloring
                   /  w
                   // Acretion disk brightness
                   / ( 2. + i*i/4. - i )
                   // Center darkness
                   / ( .5 + 1. / a )
                   // Rim highlight
                   / ( .03 + abs( length(p)-.7 ) )
             );
             
    fragColor = O;
}
