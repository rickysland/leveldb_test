rm -rf build output
mkdir -p build output
cd build
#cmake -G"Xcode" ../
cmake ../
make verbose=1
