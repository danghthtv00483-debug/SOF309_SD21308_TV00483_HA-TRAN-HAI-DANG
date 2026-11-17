# Nhật ký thiết kế và triển khai Unit Test với AI - Tuần 2 (Y3)

## 1. Mục tiêu kiểm thử
- Viết Unit Test bằng JUnit 5 và Mockito cho các Servlet Controller trong dự án Quản lý Chung cư (`DuAnQLCC`).
- Áp dụng `@ParameterizedTest` + `@CsvSource` để kiểm tra dữ liệu biên của Form và `assertThrows()` để kiểm thử ngoại lệ nghiệp vụ.

## 2. Prompt đã sử dụng với AI
> "Dựa trên mã nguồn `pom.xml`, `BQLCanHoUpdateServlet.java` và `KeToanBieuGiaServlet.java` trong dự án JSP/Servlet Quản lý Chung cư, hãy nâng cấp cấu hình JUnit 5 + Mockito và viết bộ Unit Test hoàn chỉnh sử dụng `@ParameterizedTest` với `@CsvSource` cho kiểm thử biên Form và `assertThrows()` cho ngoại lệ nghiệp vụ."

## 3. Kết quả AI sinh ra & Những chỉnh sửa thực tế của sinh viên
- **Nâng cấp thư viện (`pom.xml`):** Chuyển đổi từ JUnit 4.13.2 sang JUnit Jupiter 5.10.2 (`junit-jupiter-api`, `junit-jupiter-params`, `junit-jupiter-engine`). Nâng cấp `mockito-core` (>= 5.15.0), `byte-buddy` (>= 1.17.5) và bổ sung tham số `-XX:+EnableDynamicAgentLoading -Dnet.bytebuddy.experimental=true` trong `maven-surefire-plugin` để tương thích với môi trường JDK 26.
- **Tái cấu trúc tiêm phụ thuộc (Constructor Injection):** Bổ sung constructor nhận tham số `CanHoDAO` cho `BQLCanHoUpdateServlet` và `BieuGiaDichVuDAO` cho `KeToanBieuGiaServlet` (vẫn giữ nguyên constructor mặc định cho Tomcat) để Mockito tiêm đối tượng giả lập (`@InjectMocks`), giúp test chạy độc lập hoàn toàn với cơ sở dữ liệu SQL Server.
- **Kết quả thực thi:** Chạy `mvn test` đạt `Tests run: 14, Failures: 0, Errors: 0, Skipped: 0` (100% Pass).