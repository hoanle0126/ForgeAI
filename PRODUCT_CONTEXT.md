# ForgeAI — Ngữ cảnh sản phẩm

File này cung cấp ngữ cảnh sản phẩm cho các AI agent trong tương lai trước khi đưa ra quyết định về sản phẩm, UX, frontend hoặc backend.

## Tầm nhìn sản phẩm

ForgeAI là ứng dụng tập gym đa nền tảng, tập trung giúp người mới bắt đầu tập luyện một cách tự tin hơn. Ứng dụng nên phân tích mục tiêu, thể trạng, thiết bị sẵn có, lịch sinh hoạt, lịch sử tập luyện và sở thích dinh dưỡng của người dùng để gợi ý kế hoạch tập luyện và thực đơn phù hợp.

Sản phẩm cần ưu tiên mobile trước, vì định hướng thương mại là phát hành trên App Store và Google Play. Desktop hoặc web có thể cân nhắc sau, nhưng trải nghiệm mobile, onboarding nhanh, khả năng giữ chân người dùng và xây dựng thói quen nên là trọng tâm khi ra quyết định sản phẩm.

## Người dùng mục tiêu

Nhóm người dùng ban đầu là người mới tập, thường chưa biết:

- Bài tập nào phù hợp với mục tiêu của họ.
- Cách xây dựng kế hoạch tập luyện theo tuần.
- Nên ăn gì để hỗ trợ việc tập luyện.
- Cách điều chỉnh khi mệt, bận, đau cơ hoặc thiếu thiết bị.
- Cách lưu lại bài tập hoặc thực đơn hữu ích để dùng lại.

Ứng dụng nên tạo cảm giác như một huấn luyện viên thực tế, không phải một thư viện nội dung chung chung.

## Giá trị cốt lõi

ForgeAI nên giúp người dùng trả lời nhanh ba câu hỏi:

1. Hôm nay tôi nên tập gì?
2. Hôm nay tôi nên ăn gì?
3. Tôi nên điều chỉnh kế hoạch như thế nào dựa trên tình hình thực tế?

Trải nghiệm cốt lõi nên kết hợp hướng dẫn tập luyện, hướng dẫn dinh dưỡng, theo dõi tiến độ và lưu kế hoạch thành một luồng dễ hiểu cho người mới.

## Cấu trúc repository

- `frontend/`: Ứng dụng Flutter cho giao diện người dùng, ưu tiên mobile.
- `backend/`: Backend NestJS viết bằng TypeScript. Ở thời điểm hiện tại backend mới ở mức scaffold cơ bản của NestJS với `AppModule`, `AppController`, `AppService`, endpoint `GET /` trả về `Hello World!`, cùng test unit/e2e mặc định. Chưa có module nghiệp vụ như auth, users, workouts hay nutrition.

Frontend và backend nên phát triển xoay quanh workflow sản phẩm, không nên trở thành các demo kỹ thuật rời rạc. Khi ra quyết định sản phẩm hoặc kỹ thuật, cần phân biệt rõ giữa định hướng dài hạn của backend và phần đã được hiện thực trong source code hiện tại.

## Nguyên tắc sản phẩm

- Ưu tiên người mới: giải thích hành động đơn giản, tránh làm người dùng bị ngợp bởi thuật ngữ chuyên môn.
- Thực tế hơn hoàn hảo: gợi ý kế hoạch mà người dùng có thể thật sự làm theo với thời gian, thiết bị, thực phẩm và trình độ hiện tại.
- Huấn luyện thích ứng: cho phép kế hoạch thay đổi theo lịch bận, mệt mỏi, đau cơ, buổi tập bị bỏ lỡ hoặc thiết bị sẵn có.
- Lưu và dùng lại: cho phép người dùng lưu bài tập, thực đơn và gợi ý AI hữu ích thành các bộ sưu tập.
- Trải nghiệm mobile chỉn chu: thao tác phải nhanh, rõ ràng, có cá tính thị giác và thoải mái trên màn hình nhỏ.
- Tin cậy và an toàn: tránh tuyên bố y khoa, lời khuyên tập luyện nguy hiểm hoặc chế độ ăn cực đoan.
- Sẵn sàng thương mại: khi thiết kế tính năng lớn, cần cân nhắc onboarding, giữ chân người dùng, giá trị subscription, quyền riêng tư, analytics và ràng buộc review của app store.

## Ý tưởng tạo khác biệt cạnh tranh

- Onboarding cho người mới tạo được kế hoạch tuần đầu thực tế, thay vì bắt người dùng tự cấu hình mọi thứ.
- AI điều chỉnh kế hoạch theo tình huống đời thực như “tôi chỉ có 20 phút”, “tôi đang đau cơ” hoặc “hôm nay tôi chỉ có tạ đơn”.
- Bộ sưu tập bài tập và thực đơn để người dùng lưu, chỉnh sửa và dùng lại.
- Tổng kết hằng tuần giải thích tiến độ, buổi tập bị bỏ lỡ và điều chỉnh tuần sau bằng ngôn ngữ dễ hiểu.
- Gợi ý bữa ăn dựa trên ngân sách, thời gian chuẩn bị, nguyên liệu, sở thích ăn uống và mục tiêu tập luyện.
- Gamification nhẹ: streak, huy hiệu, thử thách theo tuần và các chiến thắng nhỏ, nhưng không làm ứng dụng trở nên trẻ con.
- Insight tiến độ kết nối giữa tập luyện, dinh dưỡng, tính đều đặn và chỉ số cơ thể.
- Mô hình freemium: miễn phí kế hoạch cơ bản và mục đã lưu; trả phí cho AI coach, cá nhân hóa sâu hơn, phân tích tiến độ nâng cao và tạo plan premium.

## Nhóm tính năng nên phát triển trong tương lai

- Onboarding và hồ sơ cá nhân: mục tiêu, kinh nghiệm, chỉ số cơ thể, thiết bị, lịch sinh hoạt, sở thích ăn uống, chấn thương hoặc giới hạn vận động.
- Tạo kế hoạch tập luyện: kế hoạch tuần, bài tập hôm nay, thay thế bài tập, xử lý ngày nghỉ.
- Lập kế hoạch dinh dưỡng: gợi ý bữa ăn, mục tiêu macro, đề xuất dễ mua nguyên liệu, thực đơn đã lưu.
- AI coach: điều chỉnh kế hoạch qua chat, giải thích gợi ý, tổng kết tuần, nhắc nhở.
- Thư viện đã lưu: bài tập, bữa ăn, kế hoạch và gợi ý yêu thích.
- Theo dõi tiến độ: lịch sử tập luyện, chỉ số cơ thể, ảnh tiến độ, tính đều đặn, kỷ lục cá nhân.
- Lớp thương mại: tài khoản, subscription, entitlement, analytics, quyền riêng tư và luồng đồng ý của người dùng.

## Hướng dẫn cho AI agent trong tương lai

Trước khi đề xuất hoặc triển khai tính năng sản phẩm, hãy cân nhắc thay đổi đó hỗ trợ hành trình tập luyện của người mới, định hướng mobile-first để phát hành thương mại và định vị “tập luyện + dinh dưỡng” như thế nào. Tránh thêm tính năng chỉ vì đối thủ có; hãy ưu tiên những tính năng làm người dùng có khả năng hoàn thành buổi tập tiếp theo hoặc làm theo bữa ăn tiếp theo cao hơn.
