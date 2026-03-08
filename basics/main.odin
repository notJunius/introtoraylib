package basics

import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1920, 1080, "3D Basics")

	// camera

	camera := rl.Camera3D {
		position   = {0, 1, 5},
		target     = {},
		up         = {0, 1, 0},
		fovy       = 45,
		projection = .PERSPECTIVE,
	}

	mesh := rl.GenMeshCube(1, 1, 1)
	model := rl.LoadModelFromMesh(mesh)


	for !rl.WindowShouldClose() {
		dt := rl.GetFrameTime()
		rl.BeginDrawing()
		rl.BeginMode3D(camera)
		rl.ClearBackground(rl.WHITE)

		//camera.position.x += 100 * dt

		camera.target.x += 10 * dt

		rl.DrawGrid(10, 0.5)
		rl.DrawModel(model, {0, .5, 0}, 1, rl.BLUE)
		rl.DrawLine3D({-4, 0, -2}, {5, 2, 3}, rl.BLACK)
		rl.EndMode3D()
		rl.EndDrawing()
	}
	rl.CloseWindow()
}

