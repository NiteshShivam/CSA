# Step to  use the cross-compiler and generate the optimized assembly file.


1. file xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz should be downloaded first.
2. tar -xvjf xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
3. Add the path to the bin directory to the PATH environment variable. Use the commands
below:

    cd xpack-riscv-none-elf-gcc-13.2.0-2

    export PATH=$PATH:`pwd`/bin

4.Create c file and compile it using the following command.

    riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -o test.elf test.c

5. Run the following command to see the contents of the ELF file.

        riscv-none-elf-readelf -a test.elf



6. To check the size of the ELF file, use the following command.

        riscv-none-elf-size test.elf

7. Install the RISC-V emulator by following these command.

        git clone https://github.com/sysprog21/rv32emu
        cd rv32emu
        git checkout -b new_branch 6c3d9a62d6e979fdd146507df8669d06bbb60c9a
        make
        make check
        ./build/rv32emu ./build/hello.elf
        ./build/rv32emu --stats ../test.elf

8. Compile your C program to get the assembly code.
    
        riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -S test.c -o test.s

14. Compile the assembly file to get the ELF file.

        riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -o test.elf test.s
15. Different Optimization used
        
        riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -O0 -S test.c -o test_o0.s

        risv-none-elf-gcc -march=rv32i -mabi=ilp32 -O1 -S test.c -o test_o1.s

        risv-none-elf-gcc -march=rv32i -mabi=ilp32 -O2 -S test.c -o test_o2.s


        risv-none-elf-gcc -march=rv32i -mabi=ilp32 -O3 -S test.c -o test_o3.s

        riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -Os -S test.c -o test_os.s

        riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -Ofast -S test.c -o test_ofast.s


*.s is the optimization output.

## Open Google colab file
    1. provid path for *.s file in superscalar section code inside the google colab file.
    and see the number of cycle taken for running.
    2. provide the path for *.s in parser code
    one file will be generated ,pass that file into superscalar code and see the number of cycle used.
 
