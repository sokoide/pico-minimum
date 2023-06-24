C_SRCS += \
../boot/boot2.c \
../boot/reset_hdr.c \
../boot/vector_tbl.c

OBJS += \
./boot/boot2.o \
./boot/reset_hdr.o \
./boot/vector_tbl.o

# Each subdirectory must supply rules for building sources it contributes
boot/%.o: ../boot/%.c boot/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -O0 -ffreestanding -g3 -I"../include" -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
