# Math library for 3d graphics written in Zig

This is a math library for 3D graphics written in the Zig programming language.
Now it only provides basic vector operations.

## Roadmap
> ✅ = Done, ⚒ = In progress, ❌ = Not done.

- ✅ Implement Vector2, Vector3 and Vector4 with basic operations.
- ❌ Implement matrix operations.
- ❌ Implement quaternion operations.
- ❌ Implement interpolation functions.
- ❌ Complete unit tests coverage.
- ❌ Add documentation.

## Installation
First, fetch the library:
```sh
zig fetch --save=math git+https://github.com/liponex/math.git#main
```

To use this library in your Zig project, add the following to your `build.zig` file:
```zig
const math = b.dependency("math", .{
    .target = target,
    .optimize = optimize,
});
```

```zig
your_compile.root_module.addImport("math", math.module("math"));
```
Where `your_compile` is a `std.Build.Step.Compile`.
