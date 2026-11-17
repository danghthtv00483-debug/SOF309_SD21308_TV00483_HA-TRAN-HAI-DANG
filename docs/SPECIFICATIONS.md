# ĐẶC TẢ HỆ THỐNG QUẢN LÝ CHUNG CƯ

## 1. Giới thiệu chung
* **Tên hệ thống:** Hệ thống Quản lý Chung cư (Apartment Management System)
* **Công nghệ sử dụng:** Java Servlet/JSP, JPA/Hibernate, SQL Server, Apache Tomcat.
* **Mục tiêu:** Số hóa quy trình quản lý căn hộ, cư dân, hợp đồng thuê/mua, hóa đơn dịch vụ (điện, nước, phí quản lý) và tiếp nhận phản ánh từ cư dân.

## 2. Tác nhân hệ thống (Actors)
* **Ban Quản Lý (Admin):** Có toàn quyền quản trị hệ thống, quản lý thông tin căn hộ, cư dân, tạo hóa đơn hàng tháng, thống kê doanh thu và xử lý khiếu nại.
* **Cư dân (User/Resident):** Đăng nhập xem thông tin căn hộ đang ở, tra cứu hóa đơn dịch vụ hàng tháng, gửi yêu cầu sửa chữa/phản ánh và cập nhật thông tin cá nhân.

## 3. Đặc tả chức năng & Quy tắc nghiệp vụ (Business Rules)

### 3.1. Quản lý Tài khoản & Đăng nhập
* **Mô tả:** Cho phép Admin và Cư dân đăng nhập vào hệ thống bằng Tên đăng nhập (hoặc Email) và Mật khẩu.
* **Quy tắc nghiệp vụ (BR):**
  * `BR01`: Tên đăng nhập và mật khẩu không được để trống.
  * `BR02`: Phân quyền tự động sau khi đăng nhập (Admin chuyển hướng trang quản trị, Cư dân chuyển hướng trang thông tin cá nhân).
  * `BR03`: Tài khoản bị khóa (Status = Inactive) không được phép đăng nhập.

### 3.2. Quản lý Căn hộ
* **Mô tả:** Xem danh sách, thêm mới, cập nhật trạng thái và tìm kiếm căn hộ theo tầng/tòa/trạng thái.
* **Quy tắc nghiệp vụ (BR):**
  * `BR04`: Mã căn hộ (ví dụ: A101, B205) phải là duy nhất trên toàn hệ thống.
  * `BR05`: Diện tích căn hộ và giá thuê/phí dịch vụ cơ bản phải là số dương (`> 0`).
  * `BR06`: Không được xóa căn hộ đang có trạng thái "Đã có người ở" hoặc đang có hợp đồng hiệu lực.

### 3.3. Quản lý Cư dân & Hợp đồng
* **Mô tả:** Lưu trữ thông tin nhân khẩu (Họ tên, CCCD, SĐT, Email) và gắn cư dân vào căn hộ tương ứng.
* **Quy tắc nghiệp vụ (BR):**
  * `BR07`: Số CCCD (12 số) và Số điện thoại (10 số) phải đúng định dạng và không trùng lặp với cư dân khác đang hoạt động.
  * `BR08`: Khi gán cư dân làm chủ hộ của một căn hộ trống, trạng thái căn hộ tự động chuyển thành "Đã có người ở".

### 3.4. Quản lý Hóa đơn & Dịch vụ
* **Mô tả:** Tính tiền điện, nước, phí quản lý hàng tháng theo chỉ số cũ/mới và cập nhật trạng thái thanh toán.
* **Quy tắc nghiệp vụ (BR):**
  * `BR09`: Chỉ số điện/nước tháng mới phải lớn hơn hoặc bằng chỉ số tháng cũ (`ChiSoMoi >= ChiSoCu`).
  * `BR10`: Mỗi căn hộ chỉ được xuất tối đa 01 hóa đơn định kỳ trong cùng một tháng/năm.
