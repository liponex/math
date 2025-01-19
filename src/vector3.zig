const std = @import("std");
const testing = std.testing;

const Vector3 = @This();

x: f64,
y: f64,
z: f64,

pub fn init(x: f64, y: f64, z: f64) Vector3 {
    return .{
        .x = x,
        .y = y,
        .z = z,
    };
}

pub fn zero() Vector3 {
    return .{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
    };
}

pub fn add(a: Vector3, b: Vector3) Vector3 {
    return .{
        .x = a.x + b.x,
        .y = a.y + b.y,
        .z = a.z + b.z,
    };
}

pub fn sub(a: Vector3, b: Vector3) Vector3 {
    return .{
        .x = a.x - b.x,
        .y = a.y - b.y,
        .z = a.z - b.z,
    };
}

pub fn mul(a: Vector3, scalar: f64) Vector3 {
    return .{
        .x = a.x * scalar,
        .y = a.y * scalar,
        .z = a.z * scalar,
    };
}

pub fn dot(a: Vector3, b: Vector3) f64 {
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

pub fn cross(a: Vector3, b: Vector3) Vector3 {
    return .{
        .x = a.y * b.z - a.z * b.y,
        .y = a.z * b.x - a.x * b.z,
        .z = a.x * b.y - a.y * b.x,
    };
}

pub fn length(a: Vector3) f64 {
    return @sqrt(a.x * a.x + a.y * a.y + a.z * a.z);
}

test "Init Vector3" {
    const vec = Vector3.init(1.0, 2.0, 3.0);
    try testing.expectEqual(1.0, vec.x);
    try testing.expectEqual(2.0, vec.y);
    try testing.expectEqual(3.0, vec.z);
}

test "Zero Vector3" {
    const zero_vec = Vector3.zero();
    try testing.expectEqual(0, zero_vec.x);
    try testing.expectEqual(0, zero_vec.y);
    try testing.expectEqual(0, zero_vec.z);
}

test "Add Vector3" {
    const a = Vector3.init(1.0, 2.0, 3.0);
    const b = Vector3.init(-3.0, -4.0, -5.0);
    const result = a.add(b);
    try testing.expectEqual(-2.0, result.x);
    try testing.expectEqual(-2.0, result.y);
    try testing.expectEqual(-2.0, result.z);
}

test "Subtract Vector3" {
    const a = Vector3.init(1.0, 2.0, 3.0);
    const b = Vector3.init(-3.0, -4.0, -5.0);
    const result = a.sub(b);
    try testing.expectEqual(4.0, result.x);
    try testing.expectEqual(6.0, result.y);
    try testing.expectEqual(8.0, result.z);
}

test "Multiply Vector3 by Scalar" {
    const vec = Vector3.init(1.0, 2.0, 3.0);
    const scalar: f64 = 3.0;
    const result = vec.mul(scalar);
    try testing.expectEqual(3.0, result.x);
    try testing.expectEqual(6.0, result.y);
    try testing.expectEqual(9.0, result.z);
}

test "Dot Product of Vector3" {
    const a = Vector3.init(1.0, 2.0, 3.0);
    const b = Vector3.init(-3.0, -4.0, -5.0);
    const result = a.dot(b);
    try testing.expectEqual(-26.0, result);
}

test "Cross Product of Vector3" {
    const a = Vector3.init(1.0, 2.0, 3.0);
    const b = Vector3.init(-3.0, -4.0, -5.0);
    const result = a.cross(b);
    try testing.expectEqual(2.0, result.x);
    try testing.expectEqual(-4.0, result.y);
    try testing.expectEqual(2.0, result.z);
}

test "Length of Vector3" {
    const vec = Vector3.init(3.0, 4.0, 5.0);
    const vec_len = vec.length();
    try testing.expectApproxEqRel(7.071, vec_len, 0.001);
}
