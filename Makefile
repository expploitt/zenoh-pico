# #
# # Copyright (c) 2017, 2020 ADLINK Technology Inc.
# #
# # This program and the accompanying materials are made available under the
# # terms of the Eclipse Public License 2.0 which is available at
# # http://www.eclipse.org/legal/epl-2.0, or the Apache License, Version 2.0
# # which is available at https://www.apache.org/licenses/LICENSE-2.0.


PREFIX ?= .
OBJ_DIR ?= $(PREFIX)/obj
OBJ_DIR2 ?= $(PREFIX)/obj/net
OBJ_DIR3 ?= $(PREFIX)/obj/net/unix

LIB_DIR ?= $(PREFIX)/lib

BUILD_FLAGS ?= -DZENOH_ZEPHYR=1 -DZENOH_DEBUG=2 #-DCONFIG_NETWORKING=y -DCONFIG_NET_SOCKETS=y -DCONFIG_PTHREAD_IPC=y -DCONFIG_NET_SOCKETS_POSIX_NAMES=y 
all:
	mkdir -p $(OBJ_DIR) $(LIB_DIR)
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/codec.c -o $(OBJ_DIR)/codec.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/collection.c -o $(OBJ_DIR)/collection.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/iobuf.c -o $(OBJ_DIR)/iobuf.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/utils.c -o $(OBJ_DIR)/utils.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/codec.c -o $(OBJ_DIR)/codec2.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/internal.c -o $(OBJ_DIR)/internal.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/lease_task.c -o $(OBJ_DIR)/lease_task.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/msgcodec.c -o $(OBJ_DIR)/msgcodec.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/property.c -o $(OBJ_DIR)/property.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/read_task.c -o $(OBJ_DIR)/read_task.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/rname.c -o $(OBJ_DIR)/rname.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/session.c -o $(OBJ_DIR)/session.o
	#$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/unix/network.c -o $(OBJ_DIR)/network.o
	#$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/unix/system.c -o $(OBJ_DIR)/system.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/zephyr/network.c -o $(OBJ_DIR)/network.o
	$(CC) -c $(CFLAGS) ${BUILD_FLAGS} -MD -Iinclude src/net/zephyr/system.c -o $(OBJ_DIR)/system.o
	#$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/codec.o $(OBJ_DIR)/collection.o $(OBJ_DIR)/iobuf.o $(OBJ_DIR)/utils.o $(OBJ_DIR)/codec.o $(OBJ_DIR)/internal.o $(OBJ_DIR)/lease_task.o $(OBJ_DIR)/msgcodec.o $(OBJ_DIR)/property.o $(OBJ_DIR)/rname.o $(OBJ_DIR)/session.o $(OBJ_DIR)/network.o $(OBJ_DIR)/system.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/codec.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/collection.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/iobuf.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/utils.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/codec2.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/internal.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/lease_task.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/msgcodec.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/property.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/read_task.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/rname.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/session.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/network.o
	$(AR) -rcs $(LIB_DIR)/libzenohpicolib.a $(OBJ_DIR)/system.o


clean:
	rm -rf $(OBJ_DIR) $(LIB_DIR)
