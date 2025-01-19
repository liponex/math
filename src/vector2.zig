const std = @import("std");
const testing = std.testing;

const Vector2 = @This();

x: f64,
y: f64,

pub fn init(x: f64, y: f64) Vector2 {
    return .{
        .x = x,
        .y = y,
    };
}

pub fn zero() Vector2 {
    return .{
        .x = 0.0,
        .y = 0.0,
    };
}

pub fn add(a: Vector2, b: Vector2) Vector2 {
    return .{
        .x = a.x + b.x,
        .y = a.y + b.y,
    };
}

pub fn sub(a: Vector2, b: Vector2) Vector2 {
    return .{
        .x = a.x - b.x,
        .y = a.y - b.y,
    };
}

pub fn mul(a: Vector2, scalar: f64) Vector2 {
    return .{
        .x = a.x * scalar,
        .y = a.y * scalar,
    };
}

pub fn dot(a: Vector2, b: Vector2) f64 {
    return a.x * b.x + a.y * b.y;
}

pub fn length(a: Vector2) f64 {
    return @sqrt(a.x * a.x + a.y * a.y);
}

test "Init Vector2" {
    const vec = Vector2.init(1.0, 2.0);
    try testing.expectEqual(1.0, vec.x);
    try testing.expectEqual(2.0, vec.y);
}

test "Zero Vector2" {
    const zero_vec = Vector2.zero();
    try testing.expectEqual(0, zero_vec.x);
    try testing.expectEqual(0, zero_vec.y);
}

test "Add Vector2" {
    const a = Vector2.init(1.0, 2.0);
    const b = Vector2.init(-3.0, -4.0);
    const result = a.add(b);
    try testing.expectEqual(-2.0, result.x);
    try testing.expectEqual(-2.0, result.y);
}

test "Subtract Vector2" {
    const a = Vector2.init(1.0, 2.0);
    const b = Vector2.init(-3.0, -4.0);
    const result = a.sub(b);
    try testing.expectEqual(4.0, result.x);
    try testing.expectEqual(6.0, result.y);
}

test "Multiply Vector2 by Scalar" {
    const vec = Vector2.init(1.0, 2.0);
    const scalar: f64 = 3.0;
    const result = vec.mul(scalar);
    try testing.expectEqual(3.0, result.x);
    try testing.expectEqual(6.0, result.y);
}

test "Dot Product of Vector2" {
    const a = Vector2.init(1.0, 2.0);
    const b = Vector2.init(-3.0, -4.0);
    const result = a.dot(b);
    try testing.expectEqual(-11.0, result);
}

test "Length of Vector2" {
    const vec = Vector2.init(3.0, 4.0);
    const vec_len = vec.length();
    try testing.expectApproxEqRel(5.0, vec_len, 0.001);
}
