# DANH SÁCH CA KIỂM THỬ (TEST CASES)

## Module 1: Đăng nhập & Phân quyền (Authentication)

| ID | Tên Test Case | Điều kiện tiên quyết | Các bước thực hiện | Dữ liệu đầu vào | Kết quả mong đợi | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TC_01** | Đăng nhập thành công với quyền Admin | Đã có tài khoản Admin trong DB | 1. Mở trang đăng nhập<br>2. Nhập User/Pass Admin<br>3. Nhấn "Đăng nhập" | User: `admin`<br>Pass: `123456` | Đăng nhập thành công, chuyển hướng vào trang Dashboard Admin. | Pass |
| **TC_02** | Đăng nhập thất bại khi sai mật khẩu | Đã có tài khoản hợp lệ | 1. Mở trang đăng nhập<br>2. Nhập đúng User, sai Pass<br>3. Nhấn "Đăng nhập" | User: `admin`<br>Pass: `saimatkhau` | Hệ thống giữ nguyên trang đăng nhập, hiển thị thông báo lỗi "Sai tài khoản hoặc mật khẩu". | Pass |
| **TC_03** | Đăng nhập thất bại khi bỏ trống trường dữ liệu | Đang ở trang đăng nhập | 1. Để trống User và Pass<br>2. Nhấn "Đăng nhập" | User: `""`<br>Pass: `""` | Hệ thống cảnh báo bắt buộc nhập thông tin, không gửi request lỗi lên server. | Pass |
| **TC_04** | Kiểm tra phân quyền truy cập URL Admin | Chưa đăng nhập hoặc đang đăng nhập bằng tài khoản Cư dân | 1. Gõ trực tiếp đường dẫn quản trị lên trình duyệt | URL: `/admin/can-ho` | Hệ thống từ chối truy cập và chuyển hướng về trang Đăng nhập hoặc trang báo lỗi 403. | Pass |

---

## Module 2: Quản lý Căn hộ (Apartment Management)

| ID | Tên Test Case | Điều kiện tiên quyết | Các bước thực hiện | Dữ liệu đầu vào | Kết quả mong đợi | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TC_05** | Thêm mới căn hộ hợp lệ | Đã đăng nhập quyền Admin | 1. Vào mục Quản lý căn hộ -> Thêm mới<br>2. Nhập đủ thông tin hợp lệ<br>3. Nhấn "Lưu" | Mã CH: `A909`<br>Diện tích: `75.5`<br>Giá: `8000000` | Thêm thành công, hiển thị thông báo và căn hộ `A909` xuất hiện trong danh sách. | Pass |
| **TC_06** | Thêm mới căn hộ bị trùng Mã căn hộ | Trong DB đã tồn tại mã căn hộ `A101` | 1. Vào form Thêm căn hộ<br>2. Nhập mã `A101` và các thông tin khác<br>3. Nhấn "Lưu" | Mã CH: `A101`<br>Diện tích: `60`<br>Giá: `6000000` | Hệ thống báo lỗi "Mã căn hộ đã tồn tại", không lưu bản ghi trùng vào DB. | Pass |
| **TC_07** | Thêm căn hộ với diện tích âm hoặc bằng 0 (Giá trị biên) | Đã đăng nhập quyền Admin | 1. Vào form Thêm căn hộ<br>2. Nhập diện tích `0` hoặc `-10`<br>3. Nhấn "Lưu" | Mã CH: `B102`<br>Diện tích: `-10` | Hệ thống báo lỗi validation "Diện tích phải lớn hơn 0". | Pass |
| **TC_08** | Xóa căn hộ đang có cư dân sinh sống | Căn hộ `A101` đang có trạng thái "Đã có người ở" | 1. Tìm căn hộ `A101`<br>2. Nhấn nút "Xóa" và xác nhận | Mã CH: `A101` | Hệ thống ngăn chặn thao tác xóa và thông báo "Không thể xóa căn hộ đang có cư dân". | Pass |

---

## Module 3: Quản lý Cư dân & Hóa đơn

| ID | Tên Test Case | Điều kiện tiên quyết | Các bước thực hiện | Dữ liệu đầu vào | Kết quả mong đợi | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TC_09** | Thêm cư dân với số CCCD sai định dạng | Đã đăng nhập quyền Admin | 1. Mở form Thêm cư dân<br>2. Nhập CCCD ít hơn 12 số hoặc chứa chữ cái<br>3. Nhấn "Lưu" | CCCD: `12345abc` | Hệ thống báo lỗi định dạng CCCD không hợp lệ. | Pass |
| **TC_10** | Lập hóa đơn với chỉ số nước mới nhỏ hơn chỉ số cũ | Căn hộ `A101` có chỉ số nước tháng trước là `150` | 1. Vào mục Tạo hóa đơn cho `A101`<br>2. Nhập chỉ số nước mới là `140`<br>3. Nhấn "Tính tiền / Lưu" | Chỉ số cũ: `150`<br>Chỉ số mới: `140` | Hệ thống báo lỗi "Chỉ số mới không được nhỏ hơn chỉ số cũ". | Pass |# BỘ KỊCH BẢN KIỂM THỬ (TEST CASES)

| Test Case ID | Chức năng | Mô tả ca kiểm thử | Loại test (Pos/Neg) | Các bước thực hiện | Dữ liệu kiểm thử (Test Data) | Kết quả mong đợi | Trạng thái (Pass/Fail) |
| :---: | :---: | :--- | :---: | :--- | :--- | :--- | :---: |
| **TC_AUTH_01** | Login | Đăng nhập thành công với tài khoản đúng | Positive | 1. Nhập username<br>2. Nhập password<br>3. Bấm Đăng nhập | `admin` / `123456` | Chuyển hướng tới trang chủ | Pass |
| **TC_AUTH_02** | Login | Đăng nhập thất bại khi để trống mật khẩu | Negative | 1. Nhập username<br>2. Bỏ trống password<br>3. Bấm Đăng nhập | `admin` / `""` | Báo lỗi "Mật khẩu không được để trống" | Pass |
| **TC_CRUD_01** | CRUD | Thêm mới bản ghi thành công | Positive | 1. Mở form thêm mới<br>2. Điền thông tin hợp lệ<br>3. Bấm Lưu | Dữ liệu hợp lệ | Lưu thành công, dữ liệu hiển thị trên bảng | Pass |
| **TC_CRUD_02** | CRUD | Thêm mới thất bại khi dữ liệu không hợp lệ | Negative | 1. Mở form thêm mới<br>2. Nhập sai định dạng/để trống<br>3. Bấm Lưu | Dữ liệu sai | Báo lỗi validation, không lưu vào DB | Pass |

