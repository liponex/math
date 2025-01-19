const std = @import("std");
const testing = std.testing;

const Vector4 = @This();

x: f64,
y: f64,
z: f64,
w: f64,

pub fn init(x: f64, y: f64, z: f64, w: f64) Vector4 {
    return .{ .x = x, .y = y, .z = z, .w = w };
}

pub fn zero() Vector4 {
    return init(0.0, 0.0, 0.0, 0.0);
}

pub fn add(a: Vector4, b: Vector4) Vector4 {
    return .{
        .x = a.x + b.x,
        .y = a.y + b.y,
        .z = a.z + b.z,
        .w = a.w + b.w,
    };
}

pub fn sub(a: Vector4, b: Vector4) Vector4 {
    return .{
        .x = a.x - b.x,
        .y = a.y - b.y,
        .z = a.z - b.z,
        .w = a.w - b.w,
    };
}

pub fn mul(a: Vector4, b: f64) Vector4 {
    return .{
        .x = a.x * b,
        .y = a.y * b,
        .z = a.z * b,
        .w = a.w * b,
    };
}

pub fn dot(a: Vector4, b: Vector4) f64 {
    return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w;
}

pub fn length(a: Vector4) f64 {
    return @sqrt(a.x * a.x + a.y * a.y + a.z * a.z + a.w * a.w);
}

test "Init Vector4" {
    const vec = Vector4.init(1.0, 2.0, 3.0, 4.0);
    try testing.expectEqual(1.0, vec.x);
    try testing.expectEqual(2.0, vec.y);
    try testing.expectEqual(3.0, vec.z);
    try testing.expectEqual(4.0, vec.w);
}

test "Zero Vector4" {
    const zero_vec = Vector4.zero();
    try testing.expectEqual(0, zero_vec.x);
    try testing.expectEqual(0, zero_vec.y);
    try testing.expectEqual(0, zero_vec.z);
    try testing.expectEqual(0, zero_vec.w);
}

test "Add Vector4" {
    const a = Vector4.init(1.0, 2.0, 3.0, 4.0);
    const b = Vector4.init(-3.0, -4.0, -5.0, -6.0);
    const result = a.add(b);
    try testing.expectEqual(-2.0, result.x);
    try testing.expectEqual(-2.0, result.y);
    try testing.expectEqual(-2.0, result.z);
    try testing.expectEqual(-2.0, result.w);
}

test "Subtract Vector4" {
    const a = Vector4.init(1.0, 2.0, 3.0, 4.0);
    const b = Vector4.init(-3.0, -4.0, -5.0, -6.0);
    const result = a.sub(b);
    try testing.expectEqual(4.0, result.x);
    try testing.expectEqual(6.0, result.y);
    try testing.expectEqual(8.0, result.z);
    try testing.expectEqual(10.0, result.w);
}

test "Multiply Vector4 by Scalar" {
    const vec = Vector4.init(1.0, 2.0, 3.0, 4.0);
    const scalar: f64 = 3.0;
    const result = vec.mul(scalar);
    try testing.expectEqual(3.0, result.x);
    try testing.expectEqual(6.0, result.y);
    try testing.expectEqual(9.0, result.z);
    try testing.expectEqual(12.0, result.w);
}

test "Dot Product of Vector4" {
    const a = Vector4.init(1.0, 2.0, 3.0, 4.0);
    const b = Vector4.init(-3.0, -4.0, -5.0, -6.0);
    const result = a.dot(b);
    try testing.expectEqual(-50.0, result);
}

test "Length of Vector4" {
    const vec = Vector4.init(3.0, 4.0, 5.0, 6.0);
    const vec_len = vec.length();
    try testing.expectApproxEqRel(9.273, vec_len, 0.001);
}
