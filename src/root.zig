const std = @import("std");

pub const Vector2 = @import("Vector2.zig");
pub const Vector3 = @import("Vector3.zig");
pub const Vector4 = @import("Vector4.zig");

test "ref all decls recursive" {
    std.testing.refAllDecls(@This());
}
