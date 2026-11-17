# KẾ HOẠCH KIỂM THỬ (TEST PLAN) - HỆ THỐNG QUẢN LÝ CHUNG CƯ

## 1. Mục tiêu kiểm thử
* Đảm bảo các chức năng cốt lõi của hệ thống hoạt động đúng theo đặc tả `SPECIFICATIONS.md`.
* Phát hiện sớm các lỗi liên quan đến ràng buộc dữ liệu (Validation), phân quyền truy cập (Authentication/Authorization) và tính toán hóa đơn.

## 2. Phạm vi kiểm thử (Scope)
* **Trong phạm vi (In-Scope):**
  * Chức năng Đăng nhập / Đăng xuất / Phân quyền.
  * Chức năng CRUD (Thêm, Xem, Sửa, Xóa) Căn hộ.
  * Chức năng Quản lý Cư dân.
  * Chức năng Lập và thanh toán Hóa đơn dịch vụ.
* **Ngoài phạm vi (Out-of-Scope):**
  * Kiểm thử chịu tải (Load Testing) với hàng nghìn người dùng đồng thời.
  * Tích hợp cổng thanh toán trực tuyến bên thứ ba (VNPay, Momo).

## 3. Chiến lược & Loại hình kiểm thử
* **Kiểm thử chức năng (Functional Testing):** Kiểm tra luồng nghiệp vụ chính (Happy Path) và các trường hợp ngoại lệ (Negative Path).
* **Kiểm thử giao diện (UI Testing):** Đảm bảo hiển thị đúng bố cục, thông báo lỗi rõ ràng trên trình duyệt (Chrome/Edge).
* **Kiểm thử bảo mật cơ bản:** Đảm bảo Cư dân không thể truy cập trực tiếp vào các URL quản trị của Admin thông qua thanh địa chỉ.

## 4. Môi trường kiểm thử (Test Environment)
* **Hệ điều hành:** Windows 10/11
* **Trình duyệt:** Google Chrome / Microsoft Edge (phiên bản mới nhất)
* **Web Server:** Apache Tomcat 11 (`http://localhost:8080/chungcu_war/`)
* **Cơ sở dữ liệu:** Microsoft SQL Server (Database: `QLCCNew2`)

## 5. Tiêu chí nghiệm thu (Exit Criteria)
* 100% các Test Case mức độ ưu tiên Cao (High) phải đạt trạng thái **Pass**.
* Không còn lỗi nghiêm trọng (Critical/Blocker) làm sập ứng dụng (lỗi HTTP 500).
