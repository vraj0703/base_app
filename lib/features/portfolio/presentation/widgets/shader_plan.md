# Implementation Plan: 3D Shader Background (Star Nest)

## 1. Architecture

* **Layer**: Presentation
* **Component**: `StarNestBackground` (StatefulWidget)
* **Logic**: Uses `dart:ui.FragmentProgram` to compile and render a GLSL shader.

## 2. Dependencies

* `flutter` (Built-in `dart:ui`)
* `assets`: `assets/shaders/star_nest.frag`

## 3. Implementation Steps

1. **Create Shader File**: Save the provided GLSL code to `assets/shaders/star_nest.frag`.
    * *Note*: The GLSL code needs slight adaptation for Flutter's `main()` signature and uniform inputs (Resolution, Time).
2. **Update Pubspec**: Ensure `pubspec.yaml` registers the new shader asset. (Already done for `star_nest.frag`, will verify).
3. **Create Widget**: Implement `StarNestBackground` to load the program and paint it using a `CustomPainter`.
    * Uniforms: `uResolution` (vec2), `uTime` (float).
4. **Integrate**: Place `StarNestBackground` into the `PortfolioPage` or `LandingPageView`.

## 4. GLSL Adaptation Notess

Flutter shaders function slightly differently than Shadertoy.

* Input: `vec2 uResolution`, `float uTime`.
* Output: `fragColor` (assigned to output variable).
* Coordinates: `gl_FragCoord` handling.
