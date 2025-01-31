build:
	mpicxx -fopenmp -c main.c -o main.o
	mpicxx -fopenmp -c cFunctions.c -o cFunctions.o
	nvcc -I./inc -c cudaFunctions.cu -o cudaFunctions.o
	mpicxx -fopenmp -o program main.o cFunctions.o cudaFunctions.o /usr/local/cuda/lib64/libcudart_static.a -ldl -lrt

clean:
	rm -f *.o ./programnvcc

run:
	mpiexec -np 2 ./program


runOn2:
	mpiexec -np 2 -machinefile  mf  -map-by  node  ./program
