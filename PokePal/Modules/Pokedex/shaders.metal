//
//  shaders.metal
//  PokePal
//
//  Created by William Vabrinskas on 5/28/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 checkerboard(float2 position, half4 currentColor, float size, half4 newColor) {
    uint2 posInChecks = uint2(position.x / size, position.y / size);
    bool isColor = (posInChecks.x ^ posInChecks.y) & 1;
    return isColor ? newColor * currentColor.a : half4(0.0, 0.0, 0.0, 0.0);
}

[[ stitchable ]] half4 noise(float2 position, half4 currentColor, float time) {
    float value = fract(sin(dot(position + time, float2(12.9898, 78.233))) * 43758.5453);
    return half4(value, value, value, 1) * currentColor.a;
}

[[ stitchable ]] half4 pixellate(float2 position, SwiftUI::Layer layer, float strength) {
    float min_strength = max(strength, 0.0001);
    float coord_x = min_strength * round(position.x / min_strength);
    float coord_y = min_strength * round(position.y / min_strength);
    return layer.sample(float2(coord_x, coord_y));
}

[[ stitchable ]] float2 simpleWave(float2 position, float time) {
//    return position + float2 (0, sin(time + position.x / 20)) * 10;
    return position + float2 (sin(time + position.y / 20), sin(time + position.x / 20)) * 5;
}

[[ stitchable ]] float2 complexWave(float2 position, float time, float2 size, float speed, float strength, float frequency) {
    float2 normalizedPosition = position / size;
    float moveAmount = time * speed;

    position.x += sin((normalizedPosition.x + moveAmount) * frequency) * strength;
    position.y += cos((normalizedPosition.y + moveAmount) * frequency) * strength;

    return position;
}

[[ stitchable ]] half4 emboss(float2 position, SwiftUI::Layer layer, float strength) {
    half4 current_color = layer.sample(position);
    half4 new_color = current_color;
    
    //new_color -= layer.sample(position - 1) * strength;
    new_color += layer.sample(position - 1) * strength;

    return half4(new_color);
}

[[ stitchable ]] half4 embossOut(float2 position, SwiftUI::Layer layer, float strength) {
    half4 current_color = layer.sample(position);
    half4 new_color = current_color;

    new_color += layer.sample(position - 1) * strength;
    new_color -= layer.sample(position + 1) * strength;

    return half4(new_color);
}

float2 customFmod(float2 position, float mod) {
    float x = position.x - mod * floor(position.x / mod);
    float y = position.y - mod * floor(position.y / mod);
    return float2(x, y);
}

[[ stitchable ]] half4 dimple(float2 position, SwiftUI::Layer layer) {
  half4 current_color = layer.sample(position);

  float2 remain = customFmod(position, 0.1);
  
  if (remain.y != 0 || remain.x != 0) {
    half4 color = half4(0, 0, 0, 0.2);
    return color;
  }
  
  half4 new_color = current_color;
  
  float2 center = float2(position.x - 5, position.y + 5);
  float distanceFromCenter = length(position - center);
  
  float dimpleRadius = 5.0;
  float dimpleStrength = 1.0;
  float dimple = smoothstep(dimpleRadius - dimpleStrength, dimpleRadius + dimpleStrength, distanceFromCenter);
  
  return new_color * dimple;
}

struct VertexIn {
    float4 position [[attribute(0)]];
    float2 textureCoordinate [[attribute(1)]];
};

struct VertexOut {
    float4 position [[position]];
    float2 textureCoordinate;
};

vertex VertexOut vertex_main(const VertexIn vertexIn [[stage_in]]) {
    VertexOut vertexOut;
    vertexOut.position = vertexIn.position;
    vertexOut.textureCoordinate = vertexIn.textureCoordinate;
    return vertexOut;
}

[[ stitchable ]] float4 fragment_main(VertexOut vertexOut [[stage_in]]) {
    float2 textureCoordinate = vertexOut.textureCoordinate;
    
    // Calculate the distance from the center of the view
    float2 center = float2(0.5, 0.5);
    float distanceFromCenter = length(textureCoordinate - center);
    
    // Apply the dimple effect
    float dimpleRadius = 0.3;
    float dimpleStrength = 0.5;
    float dimple = smoothstep(dimpleRadius - dimpleStrength, dimpleRadius + dimpleStrength, distanceFromCenter);
    
    // Combine the original color with the dimple effect
    float4 color = float4(1.0, 1.0, 1.0, 1.0);
    return color * dimple;
}
