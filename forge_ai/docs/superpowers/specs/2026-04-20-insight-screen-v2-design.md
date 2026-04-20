# Thiết kế Màn hình Insight V2 (AI Analytics & Body Anatomy) - Forge AI

## 1. Tổng quan & Triết lý Thiết kế
Màn hình Insight V2 được "đập đi xây lại" hoàn toàn với phong cách **Premium UI/UX (Glassmorphism & Precision AI)**, đồng bộ chặt chẽ với hệ thống Design Token hiện tại của ứng dụng (`AppColors`, `AppTypography`, `AppSpacing`). 
Hệ thống sử dụng các thư viện trực quan hóa cao cấp (`flutter_body_atlas` / `bodychart_heatmap` và `fl_chart`) để mang lại cảm giác chuyên nghiệp, cá nhân hóa.

## 2. Đồng bộ Style & Theme (Design System)
- **Background:** Giữ nền tảng sáng sủa với `AppColors.warmIvory`.
- **Thẻ (Cards):** Áp dụng component `AppCard` (có shadow nhẹ) nhưng có thể thêm hiệu ứng viền mờ (subtle border) để tạo cảm giác Glassmorphism hiện đại.
- **Typography:** `AppTypography.h2` / `h3` (DM Sans) cho tiêu đề; `AppTypography.statLarge` (JetBrains Mono) để hiển thị số liệu kỹ thuật tạo cảm giác "Dashboard phân tích".
- **Color Accent:** Sử dụng `AppColors.aiBlue` cho các thành phần liên quan đến trí tuệ nhân tạo, `AppColors.sportOrange` và các dải gradient (Xanh lá -> Cam -> Đỏ) cho biểu đồ Heatmap.

## 3. Kiến trúc Giao diện (2 Tabs)

### 3.1. Tab 1: Dashboard (Body Anatomy & Metrics)
- **Interactive Body Atlas:** Hiển thị một mô hình cơ thể người (Anatomy) ở trung tâm. Dữ liệu tập luyện (Volume, RPE) sẽ được map vào từng nhóm cơ cụ thể. 
- **Heatmap Color Coding:** 
  - Cơ bắp mỏi/Overloaded: Đổ màu gradient Cam - Đỏ.
  - Cơ bắp đã phục hồi/Ít tập: Đổ màu Xanh lá - Xám.
- **Tương tác Touch:** Khi chạm vào một múi cơ trên hình nộm, một Tooltip hoặc Bottom Sheet nhỏ sẽ hiện ra hiển thị chi tiết (VD: "Chest: 15,000kg Volume - RPE 8.5").
- **Biểu đồ Sức mạnh (Trend Chart):** Nằm bên dưới hình nộm. Dùng `fl_chart` để vẽ biểu đồ đường (Line Chart) lượn sóng, có hiệu ứng Gradient dưới đường line. Thể hiện tiến độ Volume/1RM trong 4 tuần qua.

### 3.2. Tab 2: Ask AI (AI Assistant)
- **Giao diện Chat Cải tiến:** Khung chat không dùng bong bóng (bubble) đơn điệu nữa. Các câu trả lời của AI sẽ được hiển thị dưới dạng **Insight Cards** (Thẻ phân tích).
- **Rich Content:** AI hỗ trợ Markdown (in đậm, danh sách) và có khả năng **nhúng các biểu đồ mini** (mini bar-chart, circular progress) trực tiếp vào luồng chat để minh họa cho phân tích.
- **Input Field:** Thanh nhập liệu nổi (Floating Input) bo tròn góc ở dưới cùng, có hiệu ứng Glow (phát sáng nhẹ) ở icon Gửi (màu `AppColors.aiBlue`), tạo cảm giác "Kích hoạt AI".

## 4. Yêu cầu Kỹ thuật
- **Package mới:** Thêm `flutter_body_atlas` (hoặc tương đương) và `fl_chart` vào `pubspec.yaml`.
- **State Management:** Riverpod (`InsightNotifier`) để quản lý trạng thái chọn cơ bắp trên mô hình và lịch sử chat AI.
- **Animation:** Thêm các hiệu ứng fade in khi biểu đồ xuất hiện và spring animation khi mở tooltip cơ bắp.

---
*Ngày tạo: 2026-04-20*