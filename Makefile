# the build target executable:
udp_server :  Image.o ImageDB.o ChangeDetection.o Compression.o TransferUDP.o AppProtocol.o Slicer.o
	gcc Image.o ImageDB.o ChangeDetection.o Compression.o TransferUDP.o AppProtocol.o Slicer.o -o udp_server.exe

udp_client : Image.o ImageDB.o ChangeDetection.o Compression.o TransferUDP.o AppProtocol.o Slicer.o
	gcc Image.o ImageDB.o ChangeDetection.o Compression.o TransferUDP.o AppProtocol.o Slicer.o udp-client-sample.o udp-server-sample.o -o udp_client.exe
	
	
TransferUDP.o : TransferUDP.h TransferUDP.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja TransferUDP.c
	
udp-client-sample.o : udp-client-sample.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja udp-client-sample.c
	
udp-server-sample.o : udp-server-sample.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja udp-server-sample.c
	
Slicer.o : Slicer.h Slicer.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja Slicer.c
	
AppProtocol.o : AppProtocol.h AppProtocol.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja AppProtocol.c
	
Image.o : Image.h Image.c
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja Image.c
	
ImageDB.o : ImageDB.h ImageDB.c 
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja ImageDB.c
	
ChangeDetection.o : ChangeDetection.h ChangeDetection.c
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja ChangeDetection.c
	
Compression.o : Compression.h Compression.c
	gcc -c -Icontiki-ng -Icontiki-ng/platform/cooja Compression.c



clean:
	$(RM) Slicer.o  AppProtocol.o Image.o ImageDB.o ChangeDetection.o Compression.o TransferUDP.o udp_server.o udp_client.o udp_server.exe udp_client.exe
