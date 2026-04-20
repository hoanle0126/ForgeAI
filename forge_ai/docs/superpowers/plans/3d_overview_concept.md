# Kế hoạch Nâng cấp: Màn hình Overview 3D Anatomy (Tương tác Kéo Thả)

## 1. Tổng quan Ý tưởng
Thay thế hình ảnh giải phẫu cơ bắp 2D tĩnh hiện tại bằng một **mô hình cơ thể 3D thực thụ**. Người dùng có thể:
- **Xoay (Rotate) 360 độ:** Vuốt trên màn hình để xem cơ bắp từ mọi góc độ (trước, sau, trái, phải).
- **Phóng to/Thu nhỏ (Zoom):** Chụm hai ngón tay để nhìn sát vào các nhóm cơ nhỏ.
- **Tương tác trực tiếp (Hit-testing):** Chạm vào một múi cơ trên mô hình 3D (VD: Cơ ngực, Cơ đùi) để xem ngay thống kê chi tiết (Volume, RPE) của nhóm cơ đó.

## 2. Giải pháp Kỹ thuật (Thư viện)
Hệ sinh thái Flutter cung cấp một số thư viện 3D chất lượng cao để đáp ứng yêu cầu này.

### Lựa chọn 1: `interactive_3d` (Khuyên dùng)
- **Ưu điểm lớn nhất:** Chuyên trị các bài toán tương tác với *từng bộ phận cấu thành* của mô hình 3D (rất phù hợp cho anatomy/y tế/gym).
- **Tính năng nổi bật:** Bắt sự kiện `onTap` chính xác vào từng "node" (object) bên trong file `.glb`, và cho phép **đổi màu** (highlight) động node đó ngay trên code (VD: đổi cơ bụng thành màu Cam).
- **Hiệu năng:** Rất tốt nhờ sử dụng Filament Engine (Android) và SceneKit (iOS).

### Lựa chọn 2: `model_viewer_plus`
- **Ưu điểm lớn nhất:** Rất phổ biến, ổn định, hỗ trợ hiển thị cả môi trường Thực tế Tăng cường (AR).
- **Tính năng nổi bật:** Mượt mà với các thao tác xoay, zoom cơ bản. Rất dễ sử dụng.
- **Hạn chế:** Chạy qua WebView nên khó can thiệp sâu vào việc tương tác và đổi màu từng bộ phận nhỏ như thư viện số 1.

### Lựa chọn 3: `flutter_3d_controller` / `o3d`
- **Ưu điểm lớn nhất:** Kiểm soát camera và Animation rất sâu. 
- **Tính năng nổi bật:** Có thể gọi lệnh để di chuyển góc nhìn máy ảnh đến lưng, đến chân tự động mà người dùng không cần vuốt. Có thể phát hoạt ảnh hình nộm đang chạy, đang gập bụng nếu mô hình có chứa animation.

## 3. Yêu cầu Tiền đề (Quan trọng nhất)
Để làm được tính năng này, Code UI không phải là rào cản lớn nhất. **Trái tim của tính năng nằm ở file mô hình 3D (Asset).**
Bạn cần phải chuẩn bị (hoặc mua/thuê làm) một file `.glb` hoặc `.gltf` đáp ứng các tiêu chuẩn sau:
1. **Chia tách độc lập (Separated Meshes):** Cơ thể không được là một khối liền mạch. Từng nhóm cơ (Ngực, Lưng xô, Đùi trước, Đùi sau...) phải là một object (mesh) riêng biệt.
2. **Định danh chính xác (Node IDs):** Mỗi object phải được đặt tên rõ ràng bên trong phần mềm 3D (Blender/Maya) như: `node_chest`, `node_abs`, `node_quads`. (Ứng dụng Flutter sẽ dựa vào ID này để đổi màu và hứng sự kiện Touch).
3. **Tối ưu (Low-poly):** Lưới Polygon nên được làm nhẹ để đảm bảo ứng dụng load nhanh và xoay mượt mà trên điện thoại cũ.

## 4. Kịch bản Trải nghiệm Người dùng (UX) dự kiến
1. **Mở màn hình Insight:** Đập vào mắt là một hình nộm nam/nữ 3D toàn thân, lơ lửng giữa màn hình nền Glassmorphism.
2. **Hiệu ứng Load:** AI tính toán xong, các múi cơ trên người nộm từ từ chuyển màu gradient theo độ mỏi (Xanh - Cam - Đỏ).
3. **Thao tác xem:** Người dùng vuốt xoay lưng lại để xem các múi cơ xô (Lats).
4. **Thao tác chọn:** Người dùng chạm vào cơ Xô. Khối cơ xô phát sáng (Glow/Highlight viền vàng). Một Tooltip nổi lên báo cáo: *"Cơ Lưng Xô: Tổng Volume 12 Tấn, RPE: 6. Sẵn sàng cho buổi kéo xà hôm nay"*.

---
*Ghi chú: Bản thiết kế này hướng tới chuẩn mực của các ứng dụng Fitness Top Tier (như Fitbod, Muscle and Motion).*