# Known Issues · Buổi 1

Ghi lại lỗi chưa xử lý được hoặc đã xử lý xong.

| STT | Lỗi gặp phải | Lệnh gây lỗi | Cách đã thử | Trạng thái |
|---:|---|---|---|---|
| 1 | Docker daemon không chạy | docker info | Kiểm tra Docker Desktop, khởi động lại daemon | Unresolved - cần bật Docker Desktop hoặc Docker Engine |
| 2 | pip không có trong PATH | pip --version | Dùng `python -m pip --version` hoặc cài pip / thêm pip vào PATH | Unresolved - dùng Python hoặc Miniconda đúng cách |
