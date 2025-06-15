import socket
import time

def main():
    host = socket.gethostname()
    local_ip = socket.gethostbyname(host)
    print(f"You need to configure the following IP address and port in the ProNebo or GPS Connector: {local_ip}:10110")

    # Создаем UDP-сокет один раз
    UDP_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    UDP_socket.bind(('localhost', 16969))

    # Создаем TCP-сервер один раз
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind(('', 10110))
    server_socket.listen(3)

    while True:
        try:
            print("Wait for TCP connection...")
            client_socket, client_address = server_socket.accept()
            print(f"Connection has been established with {client_address}")

            while True:
                try:
                    conn, addr = UDP_socket.recvfrom(1024)
                    client_socket.sendall(conn)
                except (ConnectionResetError, BrokenPipeError):
                    print("Client disconnected.")
                    break
                except Exception as e:
                    print(f"Error while sending data: {e}")
                    break

            client_socket.close()
            print("Waiting for new client...")
        except Exception as e:
            print(f"Error accepting client: {e}")
            time.sleep(1)

if __name__ == "__main__":
    main()
