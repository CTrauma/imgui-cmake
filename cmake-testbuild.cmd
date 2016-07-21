@ECHO OFF
:: Hack to build with MinGW

IF NOT EXIST  ".\out\glfw_src\CMakeLists.txt" (
	git clone --depth 1 https://github.com/shaxbee/glfw.git ./out/glfw_src
)

cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./out/glfw_src -B./out/build/glfw -DCMAKE_BUILD_TYPE=Debug -DGLFW_BUILD_DOCS=0 -DGLFW_BUILD_EXAMPLES=0 -DGLFW_BUILD_TESTS=0 -DCMAKE_DEBUG_POSTFIX=d
cmake --build ./out/build/glfw --target install --config Debug
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./out/glfw_src -B./out/build/glfw -DCMAKE_BUILD_TYPE=Release -DGLFW_BUILD_DOCS=0 -DGLFW_BUILD_EXAMPLES=0 -DGLFW_BUILD_TESTS=0 -DCMAKE_DEBUG_POSTFIX=d
cmake --build ./out/build/glfw --target install --config Release
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H. -B./out/build/imgui -DCMAKE_BUILD_TYPE=Release
cmake --build ./out/build/imgui --target install --config Release
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/opengl_example -B./out/build/opengl_example -DCMAKE_BUILD_TYPE=Debug
cmake --build ./out/build/opengl_example --target install --config Debug
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/opengl_example -B./out/build/opengl_example -DCMAKE_BUILD_TYPE=Release
cmake --build ./out/build/opengl_example --target install --config Release
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/opengl3_example -B./out/build/opengl3_example -DCMAKE_BUILD_TYPE=Debug
cmake --build ./out/build/opengl3_example --target install --config Debug
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/opengl3_example -B./out/build/opengl3_example -DCMAKE_BUILD_TYPE=Release
cmake --build ./out/build/opengl3_example --target install --config Release
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/imconfig_example -B./out/build/imconfig_example -DCMAKE_BUILD_TYPE=Debug
cmake --build ./out/build/imconfig_example --target install --config Debug
cmake -G "MinGW Makefiles" -DCMAKE_INSTALL_PREFIX=./out -DCMAKE_PREFIX_PATH=./out -H./examples/imconfig_example -B./out/build/imconfig_example -DCMAKE_BUILD_TYPE=Release
cmake --build ./out/build/imconfig_example --target install --config Release
