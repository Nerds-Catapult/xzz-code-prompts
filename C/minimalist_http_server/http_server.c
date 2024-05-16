#include <sys/socket.h>
#include <sys/sendfile.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <fcntl.h>

void main()
{
	int s = socket(AF_INET, SOCK_STREAM, 0);

	/* internet domain socket struct */
	struct sockaddr_in addr = {
		AF_INET,
		0x901f, /* address of port: 8080 = 0x1f90, in reverse! Idk it's just that way */
		0, /* IPv4 address */
	};

	bind(s, &addr, sizeof(addr));

	/* listen for active connections */
	listen(s, 10);

	/* accepts connections coming from clients */
	int client_fd = accept(s, 0, 0);

	/* receive a message from socket */
	char buffer[256] = {0};
	recv(client_fd, buffer, 256, 0);

	// GET /file.html ... - this is the format for the request
	char *f = buffer + 5;
	*strchr(f, ' ') = 0; // changes the space to a null terminator
	int opened_fd = open(f, O_RDONLY);

	sendfile(client_fd, opened_fd, 0, 256);

	close(opened_fd);
	close(client_fd);
    close(s);
}
