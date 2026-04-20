# Thiết kế Màn hình Insight (AI Analytics) - Forge AI

## 1. Tổng quan
Màn hình Insight đóng vai trò là "Huấn luyện viên cá nhân ảo" (AI Personal Trainer), chuyên cung cấp các dự đoán tiến độ và gợi ý bài tập mang tính cá nhân hóa cao. Hệ thống phân tích sâu dựa trên đa dạng nguồn dữ liệu để đưa ra quyết định thông minh.

## 2. Nguồn dữ liệu (Inputs)
AI sẽ tổng hợp và xử lý 3 luồng dữ liệu chính:
- **Lịch sử tập luyện (Workout History):** Khối lượng tạ (Volume), số lần lặp lại (Reps), số hiệp (Sets), thời gian nghỉ.
- **Sinh trắc học (Biometrics):** Cân nặng, tỉ lệ mỡ (nếu có), nhịp tim.
- **Cảm nhận mỏi (RPE - Rate of Perceived Exertion):** Điểm số người dùng tự đánh giá độ khó/mỏi của cơ bắp sau mỗi buổi tập (Thang 1-10).

## 3. Kiến trúc Giao diện (UI/UX)
Màn hình sử dụng mô hình **Swipe to Chat (2 Tabs)**, cho phép người dùng chuyển đổi mượt mà giữa việc xem số liệu tĩnh và trò chuyện tương tác với AI.

### 3.1. Tab 1: Dashboard (Mặc định)
- **Muscle Heat Map (Phân bổ Cơ bắp):** Điểm nhấn chính của tab này. Sử dụng hình nộm cơ thể 2D/3D (phía trước & phía sau) để hiển thị trạng thái cơ bắp bằng màu sắc (VD: Đỏ = Quá tải/Chưa phục hồi, Xanh lá = Đã phục hồi/Sẵn sàng, Xám = Ít tác động).
- **Thẻ Tóm tắt (Summary Cards):** Nằm dưới hoặc xen kẽ Heat Map, cung cấp số liệu tổng quan nhanh như: Tổng khối lượng tạ (Volume) trong tuần, Số calo tiêu thụ dự tính, Số buổi tập.

### 3.2. Tab 2: Ask AI (Trợ lý Ảo)
- **Giao diện Chat:** Toàn màn hình dạng tin nhắn tương tự các ứng dụng chat phổ biến (Bong bóng thoại bên trái của AI, bên phải của User).
- **Proactive AI Report (Báo cáo chủ động):** Ngay khi người dùng chuyển sang tab này, AI sẽ tự động sinh ra một đoạn phân tích ngắn gọn dựa trên dữ liệu hiện tại ở Tab 1. 
  - *Ví dụ:* "Dựa trên RPE và khối lượng tạ tuần qua, cơ ngực của bạn đang có dấu hiệu quá tải (Đỏ). Bạn nên dành hôm nay để tập chân hoặc Cardio nhẹ nhàng."
- **Tương tác sâu:** Người dùng có thể nhập văn bản hoặc dùng gợi ý nhanh (Quick replies) để hỏi thêm (VD: "Gợi ý cho tôi 3 bài tập chân hôm nay"). AI sẽ trả lời và có thể đính kèm các biểu đồ nhỏ (Mini-charts) hoặc danh sách bài tập trực tiếp vào trong bong bóng chat.

## 4. Kế hoạch Triển khai Kỹ thuật (Sơ bộ)
- **State Management:** Riverpod để quản lý state chuyển tab và đồng bộ dữ liệu (Workout Data, RPE) giữa Dashboard và Chat.
- **UI Components:** 
  - Sử dụng Flutter `TabBar` và `TabBarView` (hoặc `PageView`) để làm tính năng Swipe to Chat.
  - Tích hợp một package hiển thị Heat Map cơ bắp (như vẽ SVG trên Canvas hoặc package có sẵn).
  - Khung chat sử dụng `ListView.builder` với các bong bóng thoại tùy biến.
- **AI Integration:** Dữ liệu sẽ được format thành JSON/Text context để gửi lên backend AI (OpenAI/Gemini API) mỗi khi gọi tính năng "Ask AI".

---
*Ngày tạo: 2026-04-20*