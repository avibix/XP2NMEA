import socket
import time
import os

host = socket.gethostname()
local_ip = socket.gethostbyname(host)

# Глобальные переменные для сохранения данных
total_elapsed_time = 0
total_data_size = 0
last_update = time.time()

while True:
    try:
        # UDP
        UDP_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        UDP_socket.bind(('localhost', 16969))

        # TCP
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server_socket.bind(('', 10110))
        server_socket.listen(1)
        print(f"You need to configure the following IP address and port in the GPS Connector: {local_ip}:10110")
        print("Wait for connection")
        client_socket, client_address = server_socket.accept()
        print(f"Connection has been established with {client_address}")

        interval_data_size = 0
        connection_start_time = time.time()

        while True:
            conn, addr = UDP_socket.recvfrom(10245)
            
            client_socket.sendall(conn)
            interval_data_size += len(conn)
            total_data_size += len(conn)

            current_time = time.time()
            total_elapsed_time += current_time - connection_start_time
            connection_start_time = current_time
            update_interval = current_time - last_update

            if update_interval >= 1:
                speed = (interval_data_size / 1024) / update_interval if interval_data_size > 0 else 0.0
                interval_data_size = 0
                last_update = current_time

                elapsed_seconds = int(total_elapsed_time)
                hours = elapsed_seconds // 3600
                minutes = (elapsed_seconds % 3600) // 60
                seconds = elapsed_seconds % 60
                elapsed_str = f"{hours:02d}:{minutes:02d}:{seconds:02d}"
                print(f"\rSpeed rate: {speed:.2f} kB/s   |   Elapsed: {elapsed_str}", end="")

    except (ConnectionError, socket.error):
        try:
            UDP_socket.close()  # Закрываем только UDP-сокет
        except:
            pass
        
        # Показываем скорость 0 при отключении
        current_time = time.time()
        update_interval = current_time - last_update
        if update_interval >= 1:
            elapsed_seconds = int(total_elapsed_time)
            hours = elapsed_seconds // 3600
            minutes = (elapsed_seconds % 3600) // 60
            seconds = elapsed_seconds % 60
            elapsed_str = f"{hours:02d}:{minutes:02d}:{seconds:02d}"
            print(f"\rSpeed rate: 0.00 kB/s   |   Elapsed: {elapsed_str}", end="")
            last_update = current_time

        os.system('cls' if os.name == 'nt' else 'clear')
        continue
    except KeyboardInterrupt:
        try:
            UDP_socket.close()  # Закрываем только UDP-сокет при завершении
        except:
            pass
        print("\nProgram terminated.")
        break
