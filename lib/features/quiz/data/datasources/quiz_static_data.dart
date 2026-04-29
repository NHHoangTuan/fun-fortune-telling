/// Nguồn dữ liệu tĩnh — 2 bộ trắc nghiệm mẫu tiếng Việt.
/// Đây là "fake backend" để app chạy được mà không cần API thật.
const List<Map<String, dynamic>> kStaticQuizzes = [
  // ─────────────────────────────────────────────
  // QUIZ 1: Bạn là kiểu người như thế nào?
  // ─────────────────────────────────────────────
  {
    'id': 'quiz_personality_01',
    'title': 'Bạn là kiểu người như thế nào? 🌟',
    'description':
        'Khám phá tính cách thật sự của bạn qua 8 câu hỏi vui nhộn! Kết quả sẽ khiến bạn "ồ thì ra là vậy" 😄',
    'category': 'personality',
    'imageAsset': 'assets/images/personality_quiz.png',
    'questions': [
      {
        'id': 'p_q1',
        'content': 'Cuối tuần lý tưởng của bạn là gì?',
        'options': [
          {
            'id': 'p_q1_a',
            'content': '🏠 Ở nhà, xem phim và ăn vặt thả ga',
            'value': 'homebody'
          },
          {
            'id': 'p_q1_b',
            'content': '🎉 Ra ngoài, gặp gỡ bạn bè, tiệc tùng',
            'value': 'social'
          },
          {
            'id': 'p_q1_c',
            'content': '🌿 Đi dạo thiên nhiên, nghe nhạc một mình',
            'value': 'dreamer'
          },
          {
            'id': 'p_q1_d',
            'content': '📚 Học kỹ năng mới, đọc sách, làm việc',
            'value': 'achiever'
          },
        ],
      },
      {
        'id': 'p_q2',
        'content': 'Khi bạn bè gặp vấn đề, bạn thường làm gì?',
        'options': [
          {
            'id': 'p_q2_a',
            'content': '🤗 Lắng nghe và an ủi tận tình',
            'value': 'homebody'
          },
          {
            'id': 'p_q2_b',
            'content': '🎯 Đưa ra giải pháp cụ thể ngay lập tức',
            'value': 'achiever'
          },
          {
            'id': 'p_q2_c',
            'content': '😂 Kể chuyện hài để làm họ vui lên',
            'value': 'social'
          },
          {
            'id': 'p_q2_d',
            'content': '🌙 Cho họ không gian và thời gian suy nghĩ',
            'value': 'dreamer'
          },
        ],
      },
      {
        'id': 'p_q3',
        'content': 'Khi mua đồ, bạn thường quyết định thế nào?',
        'options': [
          {
            'id': 'p_q3_a',
            'content': '🔢 So sánh giá, đọc review, cân nhắc kỹ',
            'value': 'achiever'
          },
          {
            'id': 'p_q3_b',
            'content': '💖 Thích là mua, cảm xúc quyết định tất',
            'value': 'dreamer'
          },
          {
            'id': 'p_q3_c',
            'content': '👥 Hỏi ý kiến bạn bè trước khi quyết định',
            'value': 'social'
          },
          {
            'id': 'p_q3_d',
            'content': '🛋️ Mua đồ quen thuộc, không thích thay đổi',
            'value': 'homebody'
          },
        ],
      },
      {
        'id': 'p_q4',
        'content': 'Loài vật nào mô tả bạn nhất?',
        'options': [
          {
            'id': 'p_q4_a',
            'content': '🦉 Cú mèo — Thông minh, quan sát, thích đêm khuya',
            'value': 'dreamer'
          },
          {
            'id': 'p_q4_b',
            'content': '🐬 Cá heo — Vui vẻ, hòa đồng, thích bầy đàn',
            'value': 'social'
          },
          {
            'id': 'p_q4_c',
            'content': '🦁 Sư tử — Mạnh mẽ, lãnh đạo, không chịu thua',
            'value': 'achiever'
          },
          {
            'id': 'p_q4_d',
            'content': '🐢 Rùa — Chậm mà chắc, an toàn là trên hết',
            'value': 'homebody'
          },
        ],
      },
      {
        'id': 'p_q5',
        'content': 'Khi gặp người lạ trong buổi tiệc, bạn làm gì?',
        'options': [
          {
            'id': 'p_q5_a',
            'content': '😊 Chủ động bắt chuyện ngay',
            'value': 'social'
          },
          {
            'id': 'p_q5_b',
            'content': '🙈 Ngồi góc, chờ ai đó nói chuyện trước',
            'value': 'homebody'
          },
          {
            'id': 'p_q5_c',
            'content': '🧐 Quan sát người khác, chọn người thú vị',
            'value': 'dreamer'
          },
          {
            'id': 'p_q5_d',
            'content': '💼 Networking ngay, trao đổi danh thiếp',
            'value': 'achiever'
          },
        ],
      },
      {
        'id': 'p_q6',
        'content': 'Bạn nghĩ tiền dùng để làm gì?',
        'options': [
          {
            'id': 'p_q6_a',
            'content': '🏦 Tiết kiệm, đầu tư cho tương lai',
            'value': 'achiever'
          },
          {
            'id': 'p_q6_b',
            'content': '🎊 Tận hưởng cuộc sống, sống cho hiện tại',
            'value': 'social'
          },
          {
            'id': 'p_q6_c',
            'content': '🎨 Mua trải nghiệm, du lịch, học hỏi',
            'value': 'dreamer'
          },
          {
            'id': 'p_q6_d',
            'content': '🛒 Mua đồ thiết yếu, đừng phung phí',
            'value': 'homebody'
          },
        ],
      },
      {
        'id': 'p_q7',
        'content': 'Ác mộng lớn nhất của bạn là gì?',
        'options': [
          {
            'id': 'p_q7_a',
            'content': '😶 Bị mọi người bỏ qua, không ai chú ý',
            'value': 'social'
          },
          {
            'id': 'p_q7_b',
            'content': '😰 Mất kiểm soát, mọi thứ hỗn loạn',
            'value': 'achiever'
          },
          {
            'id': 'p_q7_c',
            'content': '📢 Bị ép phải nói chuyện với nhiều người',
            'value': 'homebody'
          },
          {
            'id': 'p_q7_d',
            'content': '🔒 Bị giam cầm trong cuộc sống tẻ nhạt',
            'value': 'dreamer'
          },
        ],
      },
      {
        'id': 'p_q8',
        'content': 'Slogan nào hợp với bạn nhất?',
        'options': [
          {
            'id': 'p_q8_a',
            'content': '✨ "Sống là phải vui, khóc làm gì!"',
            'value': 'social'
          },
          {
            'id': 'p_q8_b',
            'content': '🏆 "Không có thất bại, chỉ có bài học"',
            'value': 'achiever'
          },
          {
            'id': 'p_q8_c',
            'content': '🌙 "Một mình thật tốt, yên tĩnh thật tuyệt"',
            'value': 'homebody'
          },
          {
            'id': 'p_q8_d',
            'content': '🌈 "Mơ to, sống sâu, cảm nhận nhiều hơn"',
            'value': 'dreamer'
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────────
  // QUIZ 2: Bạn hợp với nghề gì?
  // ─────────────────────────────────────────────
  {
    'id': 'quiz_career_01',
    'title': 'Bạn hợp với nghề gì? 💼',
    'description':
        'Bạn sinh ra để làm gì? 10 câu hỏi nhẹ nhàng sẽ tiết lộ con đường sự nghiệp phù hợp với bản chất của bạn!',
    'category': 'career',
    'imageAsset': 'assets/images/career_quiz.png',
    'questions': [
      {
        'id': 'c_q1',
        'content': 'Khi làm việc nhóm, bạn thường đóng vai trò gì?',
        'options': [
          {
            'id': 'c_q1_a',
            'content': '🎯 Người đề xuất ý tưởng mới liên tục',
            'value': 'creative'
          },
          {
            'id': 'c_q1_b',
            'content': '📋 Người lập kế hoạch và phân công việc',
            'value': 'manager'
          },
          {
            'id': 'c_q1_c',
            'content': '🤝 Người hòa giải khi có mâu thuẫn',
            'value': 'helper'
          },
          {
            'id': 'c_q1_d',
            'content': '🔬 Người phân tích dữ liệu và kiểm tra logic',
            'value': 'analyst'
          },
          {
            'id': 'c_q1_e',
            'content': '📣 Người thuyết trình và thuyết phục khách hàng',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q2',
        'content': 'Môn học nào bạn thích nhất thời đi học?',
        'options': [
          {
            'id': 'c_q2_a',
            'content': '🎨 Mỹ thuật / Âm nhạc / Văn học',
            'value': 'creative'
          },
          {
            'id': 'c_q2_b',
            'content': '📐 Toán / Lý / Lập trình',
            'value': 'analyst'
          },
          {
            'id': 'c_q2_c',
            'content': '🌍 Địa lý / Lịch sử / Kinh tế',
            'value': 'manager'
          },
          {
            'id': 'c_q2_d',
            'content': '🗣️ Ngoại ngữ / Hùng biện / Kỹ năng mềm',
            'value': 'seller'
          },
          {
            'id': 'c_q2_e',
            'content': '❤️ Sinh học / Giáo dục công dân / Tâm lý',
            'value': 'helper'
          },
        ],
      },
      {
        'id': 'c_q3',
        'content': 'Bạn thích môi trường làm việc như thế nào?',
        'options': [
          {
            'id': 'c_q3_a',
            'content': '🏠 Làm tại nhà, tự do, không ai quản',
            'value': 'creative'
          },
          {
            'id': 'c_q3_b',
            'content': '🏢 Văn phòng chuyên nghiệp, quy trình rõ ràng',
            'value': 'analyst'
          },
          {
            'id': 'c_q3_c',
            'content': '👥 Làm việc trực tiếp với nhiều người',
            'value': 'helper'
          },
          {
            'id': 'c_q3_d',
            'content': '🚀 Startup năng động, thay đổi liên tục',
            'value': 'manager'
          },
          {
            'id': 'c_q3_e',
            'content': '🌏 Di chuyển nhiều, gặp gỡ đối tác khắp nơi',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q4',
        'content': 'Khi rảnh, bạn hay làm gì?',
        'options': [
          {
            'id': 'c_q4_a',
            'content': '✍️ Viết blog, vẽ, làm nhạc, sáng tác',
            'value': 'creative'
          },
          {
            'id': 'c_q4_b',
            'content': '📊 Đọc báo cáo, nghiên cứu số liệu, học khóa học',
            'value': 'analyst'
          },
          {
            'id': 'c_q4_c',
            'content': '🙋 Tình nguyện, giúp đỡ cộng đồng',
            'value': 'helper'
          },
          {
            'id': 'c_q4_d',
            'content': '💡 Lên kế hoạch dự án cá nhân, đọc sách kinh doanh',
            'value': 'manager'
          },
          {
            'id': 'c_q4_e',
            'content': '🎙️ Giao lưu, tham gia sự kiện, kết nối người',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q5',
        'content': 'Điều bạn tự hào nhất về bản thân?',
        'options': [
          {
            'id': 'c_q5_a',
            'content': '🌟 Óc sáng tạo, luôn có ý tưởng độc đáo',
            'value': 'creative'
          },
          {
            'id': 'c_q5_b',
            'content': '🧠 Tư duy logic, giải quyết vấn đề nhanh',
            'value': 'analyst'
          },
          {
            'id': 'c_q5_c',
            'content': '💕 Sự đồng cảm, luôn hiểu cảm xúc người khác',
            'value': 'helper'
          },
          {
            'id': 'c_q5_d',
            'content': '⚡ Khả năng tổ chức và dẫn dắt team',
            'value': 'manager'
          },
          {
            'id': 'c_q5_e',
            'content': '🗣️ Khả năng thuyết phục và giao tiếp',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q6',
        'content': 'Bạn muốn được nhớ đến vì điều gì?',
        'options': [
          {
            'id': 'c_q6_a',
            'content': '🎭 Tác phẩm, sản phẩm sáng tạo để đời',
            'value': 'creative'
          },
          {
            'id': 'c_q6_b',
            'content': '🔑 Khám phá, giải mã điều gì đó quan trọng',
            'value': 'analyst'
          },
          {
            'id': 'c_q6_c',
            'content': '🌱 Đã thay đổi cuộc sống của ai đó tốt hơn',
            'value': 'helper'
          },
          {
            'id': 'c_q6_d',
            'content': '🏗️ Xây dựng thứ gì đó lớn lao, bền vững',
            'value': 'manager'
          },
          {
            'id': 'c_q6_e',
            'content': '🤝 Đã kết nối mọi người lại với nhau',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q7',
        'content': 'Khi dự án thất bại, bạn phản ứng thế nào?',
        'options': [
          {
            'id': 'c_q7_a',
            'content': '🎨 Xem đó là chất liệu sáng tạo, viết về nó',
            'value': 'creative'
          },
          {
            'id': 'c_q7_b',
            'content': '📉 Phân tích nguyên nhân, tìm lỗi hệ thống',
            'value': 'analyst'
          },
          {
            'id': 'c_q7_c',
            'content': '💬 Hỏi thăm team xem ai bị ảnh hưởng nhất',
            'value': 'helper'
          },
          {
            'id': 'c_q7_d',
            'content': '🔄 Lập kế hoạch mới ngay lập tức',
            'value': 'manager'
          },
          {
            'id': 'c_q7_e',
            'content': '📞 Gọi khách hàng, xin lỗi và cứu vãn quan hệ',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q8',
        'content': 'Công cụ nào bạn không thể thiếu?',
        'options': [
          {
            'id': 'c_q8_a',
            'content': '🖊️ Sketchbook, máy ảnh, Figma, Canva',
            'value': 'creative'
          },
          {
            'id': 'c_q8_b',
            'content': '📊 Excel, Python, SQL, máy tính',
            'value': 'analyst'
          },
          {
            'id': 'c_q8_c',
            'content': '📱 Zalo, điện thoại, sổ tay ghi chép cảm xúc',
            'value': 'helper'
          },
          {
            'id': 'c_q8_d',
            'content': '📌 Notion, Trello, lịch, to-do list',
            'value': 'manager'
          },
          {
            'id': 'c_q8_e',
            'content': '📧 Email, LinkedIn, danh thiếp, CRM',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q9',
        'content': 'Bạn thích loại hình nghệ thuật nào nhất?',
        'options': [
          {
            'id': 'c_q9_a',
            'content': '🎬 Phim ảnh, nhiếp ảnh, thiết kế',
            'value': 'creative'
          },
          {
            'id': 'c_q9_b',
            'content': '🧩 Cờ vua, logic game, escape room',
            'value': 'analyst'
          },
          {
            'id': 'c_q9_c',
            'content': '🎭 Kịch, tâm lý nhân vật, kể chuyện',
            'value': 'helper'
          },
          {
            'id': 'c_q9_d',
            'content': '📖 Tiểu thuyết kinh doanh, tự truyện CEO',
            'value': 'manager'
          },
          {
            'id': 'c_q9_e',
            'content': '🎤 Stand-up comedy, MC, podcast',
            'value': 'seller'
          },
        ],
      },
      {
        'id': 'c_q10',
        'content': 'Câu nói nào bạn hay dùng nhất?',
        'options': [
          {
            'id': 'c_q10_a',
            'content': '✨ "Ý tưởng hay đấy, làm thế này đi!"',
            'value': 'creative'
          },
          {
            'id': 'c_q10_b',
            'content': '🤔 "Dữ liệu nói gì? Có bằng chứng không?"',
            'value': 'analyst'
          },
          {
            'id': 'c_q10_c',
            'content': '💬 "Bạn cảm thấy thế nào? Kể mình nghe đi"',
            'value': 'helper'
          },
          {
            'id': 'c_q10_d',
            'content': '📅 "Deadline là khi nào? Ai chịu trách nhiệm?"',
            'value': 'manager'
          },
          {
            'id': 'c_q10_e',
            'content': '🚀 "Deal! Mình làm được, để mình lo cho!"',
            'value': 'seller'
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────────
  // QUIZ 3: Cung hoàng đạo nói gì về bạn?
  // ─────────────────────────────────────────────
  {
    'id': 'quiz_zodiac_01',
    'title': 'Cung hoàng đạo nói gì về bạn? ♈',
    'description':
        'Ngày sinh + vài câu hỏi nho nhỏ sẽ bật mí vibe hoàng đạo của bạn đó! ✨',
    'category': 'zodiac',
    'imageAsset': 'assets/images/zodiac_quiz.png',
    'questions': [
      {
        'id': 'z_q1',
        'content': 'Bạn sinh vào khoảng thời gian nào?',
        'options': [
          {'id': 'z_q1_a', 'content': '♈ 21/3 - 19/4', 'value': 'aries'},
          {'id': 'z_q1_b', 'content': '♉ 20/4 - 20/5', 'value': 'taurus'},
          {'id': 'z_q1_c', 'content': '♊ 21/5 - 20/6', 'value': 'gemini'},
          {'id': 'z_q1_d', 'content': '♋ 21/6 - 22/7', 'value': 'cancer'},
          {'id': 'z_q1_e', 'content': '♌ 23/7 - 22/8', 'value': 'leo'},
          {'id': 'z_q1_f', 'content': '♍ 23/8 - 22/9', 'value': 'virgo'},
          {'id': 'z_q1_g', 'content': '♎ 23/9 - 22/10', 'value': 'libra'},
          {'id': 'z_q1_h', 'content': '♏ 23/10 - 21/11', 'value': 'scorpio'},
          {
            'id': 'z_q1_i',
            'content': '♐ 22/11 - 21/12',
            'value': 'sagittarius'
          },
          {'id': 'z_q1_j', 'content': '♑ 22/12 - 19/1', 'value': 'capricorn'},
          {'id': 'z_q1_k', 'content': '♒ 20/1 - 18/2', 'value': 'aquarius'},
          {'id': 'z_q1_l', 'content': '♓ 19/2 - 20/3', 'value': 'pisces'},
        ],
      },
      {
        'id': 'z_q2',
        'content': 'Bạn được khen nhiều nhất vì điều gì?',
        'options': [
          {
            'id': 'z_q2_a',
            'content': '🔥 Quyết đoán, làm nhanh',
            'value': 'aries'
          },
          {
            'id': 'z_q2_b',
            'content': '🌿 Kiên định, đáng tin',
            'value': 'taurus'
          },
          {
            'id': 'z_q2_c',
            'content': '💬 Nói chuyện cuốn hút',
            'value': 'gemini'
          },
          {'id': 'z_q2_d', 'content': '💞 Ấm áp, tinh tế', 'value': 'cancer'},
        ],
      },
      {
        'id': 'z_q3',
        'content': 'Bạn nạp năng lượng bằng cách nào?',
        'options': [
          {
            'id': 'z_q3_a',
            'content': '🎤 Tỏa sáng trước đám đông',
            'value': 'leo'
          },
          {
            'id': 'z_q3_b',
            'content': '🧹 Sắp xếp lại mọi thứ',
            'value': 'virgo'
          },
          {
            'id': 'z_q3_c',
            'content': '🎨 Làm đẹp cho cuộc sống',
            'value': 'libra'
          },
          {
            'id': 'z_q3_d',
            'content': '🕵️ Đào sâu bí mật thú vị',
            'value': 'scorpio'
          },
        ],
      },
      {
        'id': 'z_q4',
        'content': 'Một chuyến đi lý tưởng của bạn?',
        'options': [
          {
            'id': 'z_q4_a',
            'content': '🏹 Roadtrip tự do, càng xa càng tốt',
            'value': 'sagittarius'
          },
          {
            'id': 'z_q4_b',
            'content': '🏔️ Trekking có kế hoạch rõ ràng',
            'value': 'capricorn'
          },
          {
            'id': 'z_q4_c',
            'content': '🚀 Khám phá nơi độc lạ, ít người biết',
            'value': 'aquarius'
          },
          {
            'id': 'z_q4_d',
            'content': '🌊 Ở biển, thả hồn theo sóng',
            'value': 'pisces'
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────────
  // QUIZ 4: Bạn là kiểu bạn bè như thế nào?
  // ─────────────────────────────────────────────
  {
    'id': 'quiz_friend_01',
    'title': 'Bạn là kiểu bạn bè như thế nào? 🤝',
    'description':
        '8 câu hỏi nhỏ để khám phá vai trò của bạn trong hội bạn thân!',
    'category': 'personality',
    'imageAsset': 'assets/images/friend_quiz.png',
    'questions': [
      {
        'id': 'f_q1',
        'content': 'Khi cả nhóm chưa biết đi đâu chơi, bạn sẽ?',
        'options': [
          {
            'id': 'f_q1_a',
            'content': '📌 Lên kế hoạch chi tiết',
            'value': 'leader'
          },
          {
            'id': 'f_q1_b',
            'content': '🎭 Bật mood vui, rủ rê mọi người',
            'value': 'joker'
          },
          {
            'id': 'f_q1_c',
            'content': '🫶 Hỏi xem ai thích gì',
            'value': 'listener'
          },
          {
            'id': 'f_q1_d',
            'content': '🧭 Đề xuất chỗ mới lạ',
            'value': 'explorer'
          },
        ],
      },
      {
        'id': 'f_q2',
        'content': 'Bạn bè gặp chuyện buồn, bạn làm gì?',
        'options': [
          {
            'id': 'f_q2_a',
            'content': '🤗 Ở bên lắng nghe',
            'value': 'listener'
          },
          {'id': 'f_q2_b', 'content': '🛡️ Bảo vệ, bênh vực', 'value': 'loyal'},
          {
            'id': 'f_q2_c',
            'content': '💡 Đưa giải pháp nhanh',
            'value': 'leader'
          },
          {
            'id': 'f_q2_d',
            'content': '😂 Kể chuyện làm họ vui',
            'value': 'joker'
          },
        ],
      },
      {
        'id': 'f_q3',
        'content': 'Trong group chat, bạn thường là người?',
        'options': [
          {'id': 'f_q3_a', 'content': '📣 Thả meme liên tục', 'value': 'joker'},
          {
            'id': 'f_q3_b',
            'content': '✅ Nhắc lịch, tổng kết',
            'value': 'leader'
          },
          {
            'id': 'f_q3_c',
            'content': '💬 Trò chuyện riêng khi ai cần',
            'value': 'listener'
          },
          {
            'id': 'f_q3_d',
            'content': '🧳 Gợi ý địa điểm mới',
            'value': 'explorer'
          },
        ],
      },
      {
        'id': 'f_q4',
        'content': 'Bạn được nhớ đến nhất vì điều gì?',
        'options': [
          {'id': 'f_q4_a', 'content': '🤝 Luôn giữ lời hứa', 'value': 'loyal'},
          {
            'id': 'f_q4_b',
            'content': '🎯 Giỏi dẫn dắt, quyết định',
            'value': 'leader'
          },
          {
            'id': 'f_q4_c',
            'content': '🌈 Tạo không khí tích cực',
            'value': 'joker'
          },
          {
            'id': 'f_q4_d',
            'content': '🎧 Biết lắng nghe, cảm thông',
            'value': 'listener'
          },
        ],
      },
      {
        'id': 'f_q5',
        'content': 'Khi đi du lịch nhóm, bạn thích kiểu nào?',
        'options': [
          {
            'id': 'f_q5_a',
            'content': '🗺️ Lịch trình rõ ràng',
            'value': 'leader'
          },
          {
            'id': 'f_q5_b',
            'content': '🚲 Đi đâu cũng được, miễn vui',
            'value': 'joker'
          },
          {
            'id': 'f_q5_c',
            'content': '🧭 Khám phá chỗ ít người biết',
            'value': 'explorer'
          },
          {
            'id': 'f_q5_d',
            'content': '🫶 Ưu tiên cảm xúc cả nhóm',
            'value': 'listener'
          },
        ],
      },
      {
        'id': 'f_q6',
        'content': 'Bạn bè hay tìm bạn để xin?',
        'options': [
          {
            'id': 'f_q6_a',
            'content': '🧠 Lời khuyên thực tế',
            'value': 'leader'
          },
          {'id': 'f_q6_b', 'content': '🥹 Sự thấu hiểu', 'value': 'listener'},
          {'id': 'f_q6_c', 'content': '🤣 Nguồn vui vô tận', 'value': 'joker'},
          {
            'id': 'f_q6_d',
            'content': '🛡️ Sự ủng hộ chắc chắn',
            'value': 'loyal'
          },
        ],
      },
      {
        'id': 'f_q7',
        'content': 'Bạn thường giữ vai trò nào trong nhóm?',
        'options': [
          {'id': 'f_q7_a', 'content': '👑 Trưởng nhóm', 'value': 'leader'},
          {'id': 'f_q7_b', 'content': '🎉 Cây hài', 'value': 'joker'},
          {'id': 'f_q7_c', 'content': '🧩 Người kết nối', 'value': 'listener'},
          {'id': 'f_q7_d', 'content': '🧭 Nhà thám hiểm', 'value': 'explorer'},
        ],
      },
      {
        'id': 'f_q8',
        'content': 'Một câu nói hợp với bạn nhất?',
        'options': [
          {'id': 'f_q8_a', 'content': '💪 "Để mình lo!"', 'value': 'leader'},
          {
            'id': 'f_q8_b',
            'content': '🫶 "Bạn nói đi, mình nghe."',
            'value': 'listener'
          },
          {
            'id': 'f_q8_c',
            'content': '✨ "Đi đâu cũng được!"',
            'value': 'explorer'
          },
          {
            'id': 'f_q8_d',
            'content': '🧡 "Mình luôn ở đây."',
            'value': 'loyal'
          },
        ],
      },
    ],
  },
];

/// Kết quả tương ứng cho Quiz 1: Tính cách
const Map<String, Map<String, dynamic>> kPersonalityResults = {
  'social': {
    'resultKey': 'social',
    'title': 'Linh hồn của bữa tiệc 🎉',
    'description':
        'Bạn là người mang năng lượng cho mọi nơi bạn xuất hiện! Bạn yêu thích sự kết nối, luôn là tâm điểm trong nhóm bạn bè. Cuộc sống với bạn là một buổi tiệc lớn, và ai cũng được mời. Đôi khi bạn cần nhớ rằng sạc pin cho bản thân cũng quan trọng không kém sạc pin cho người khác nhé! 🔋',
    'emoji': '🎉',
  },
  'achiever': {
    'resultKey': 'achiever',
    'title': 'Người chinh phục mục tiêu 🏆',
    'description':
        'Bạn sinh ra để đạt được những điều vĩ đại! To-do list là bạn thân của bạn, deadline là động lực của bạn. Bạn không biết "bỏ cuộc" có nghĩa là gì. Nhớ đừng quên dừng lại để tận hưởng hành trình, không chỉ đích đến thôi nhé! 🌟',
    'emoji': '🏆',
  },
  'homebody': {
    'resultKey': 'homebody',
    'title': 'Kẻ yêu tổ ấm 🏠',
    'description':
        'Nhà là nơi bạn nạp lại toàn bộ năng lượng! Bạn trân trọng sự yên tĩnh, những mối quan hệ thật sự ý nghĩa và niềm vui từ những điều nhỏ nhặt. Không phải ai cũng có khả năng tìm thấy hạnh phúc ngay trong chính ngôi nhà của mình như bạn. 🕯️',
    'emoji': '🏠',
  },
  'dreamer': {
    'resultKey': 'dreamer',
    'title': 'Tâm hồn mơ mộng 🌙',
    'description':
        'Bạn thấy thế giới khác với người thường — đẹp hơn, sâu hơn, và đầy ý nghĩa hơn. Bạn sống bằng cảm xúc và trực giác, luôn tìm kiếm điều gì đó hơn cả những gì hiển hiện. Nghệ thuật, thiên nhiên và âm nhạc là ngôn ngữ của tâm hồn bạn. ✨',
    'emoji': '🌙',
  },
};

/// Kết quả tương ứng cho Quiz 2: Nghề nghiệp
const Map<String, Map<String, dynamic>> kCareerResults = {
  'creative': {
    'resultKey': 'creative',
    'title': 'Người sáng tạo bẩm sinh 🎨',
    'description':
        'Bạn sinh ra để tạo ra những thứ chưa từng tồn tại! Designer, Content Creator, Nghệ sĩ, Nhà văn, Photographer — bất kỳ nghề nào cho phép bạn biến ý tưởng thành hiện thực đều phù hợp. Thế giới cần những người như bạn để trở nên đẹp hơn! 🌈',
    'emoji': '🎨',
  },
  'analyst': {
    'resultKey': 'analyst',
    'title': 'Bộ óc phân tích siêu đẳng 🧠',
    'description':
        'Data Analyst, Lập trình viên, Kỹ sư, Nhà nghiên cứu — đó là thiên đường của bạn! Bạn thích giải mã các con số, tìm ra quy luật ẩn sau dữ liệu và xây dựng hệ thống hoạt động hoàn hảo. Trong thời đại AI, bạn chính là mẫu người được săn đón nhất! 💻',
    'emoji': '🧠',
  },
  'helper': {
    'resultKey': 'helper',
    'title': 'Thiên thần hộ mệnh của người khác 💕',
    'description':
        'Giáo viên, Bác sĩ, Tâm lý trị liệu, Nhân viên xã hội, HR — bạn tỏa sáng nhất khi được giúp đỡ và chữa lành người khác. Sự đồng cảm là siêu năng lực của bạn. Bạn không làm việc vì tiền, bạn làm vì tình yêu với con người. 🌟',
    'emoji': '💕',
  },
  'manager': {
    'resultKey': 'manager',
    'title': 'Nhà lãnh đạo tương lai 🚀',
    'description':
        'Product Manager, Doanh nhân, CEO, Project Manager — bạn không chỉ làm việc, bạn dẫn dắt người khác! Bạn nhìn thấy bức tranh lớn trong khi người khác còn đang nhìn từng mảnh ghép. Hãy tin vào tầm nhìn của mình và dám đứng ra gánh vác! 👑',
    'emoji': '🚀',
  },
  'seller': {
    'resultKey': 'seller',
    'title': 'Bậc thầy kết nối & thuyết phục 🤝',
    'description':
        'Sales, Marketing, PR, Business Development, Đại sứ thương hiệu — bạn có khả năng khiến người khác tin tưởng và hành động theo bạn! Lời nói của bạn có sức mạnh. Mạng lưới quan hệ chính là tài sản lớn nhất của bạn. Networking chính là nghề của bạn rồi! 📣',
    'emoji': '🤝',
  },
};

/// Kết quả tương ứng cho Quiz 3: Cung hoàng đạo
const Map<String, Map<String, dynamic>> kZodiacResults = {
  'aries': {
    'resultKey': 'aries',
    'title': 'Bạch Dương bùng nổ 🔥',
    'description':
        'Bạn là tia lửa mở màn mọi cuộc vui! Nhanh, quyết đoán và không ngại bắt đầu điều mới. Thế giới cần năng lượng dám làm của bạn.',
    'emoji': '♈',
  },
  'taurus': {
    'resultKey': 'taurus',
    'title': 'Kim Ngưu vững vàng 🌿',
    'description':
        'Bạn bình tĩnh, ổn định và cực kỳ đáng tin. Gu thẩm mỹ tinh tế, yêu sự thoải mái và bền vững.',
    'emoji': '♉',
  },
  'gemini': {
    'resultKey': 'gemini',
    'title': 'Song Tử hoạt ngôn 💬',
    'description':
        'Bạn nhanh nhạy, tò mò và luôn có chuyện để nói. Năng lượng của bạn khiến mọi cuộc trò chuyện trở nên sống động.',
    'emoji': '♊',
  },
  'cancer': {
    'resultKey': 'cancer',
    'title': 'Cự Giải dịu dàng 🌙',
    'description':
        'Bạn ấm áp, giàu cảm xúc và luôn quan tâm người khác. Một chiếc ô an toàn cho những người bạn yêu thương.',
    'emoji': '♋',
  },
  'leo': {
    'resultKey': 'leo',
    'title': 'Sư Tử rực rỡ 🦁',
    'description':
        'Bạn sinh ra để tỏa sáng! Tự tin, hào phóng và biết cách biến mọi khoảnh khắc thành sân khấu.',
    'emoji': '♌',
  },
  'virgo': {
    'resultKey': 'virgo',
    'title': 'Xử Nữ tinh tế 🧹',
    'description':
        'Bạn tỉ mỉ, thực tế và luôn muốn mọi thứ tốt hơn mỗi ngày. Nhờ bạn mà mọi thứ trở nên gọn gàng, hiệu quả.',
    'emoji': '♍',
  },
  'libra': {
    'resultKey': 'libra',
    'title': 'Thiên Bình duyên dáng 🎨',
    'description':
        'Bạn yêu sự cân bằng, hòa hợp và cái đẹp. Bạn luôn biết cách làm mọi người thấy dễ chịu.',
    'emoji': '♎',
  },
  'scorpio': {
    'resultKey': 'scorpio',
    'title': 'Bọ Cạp bí ẩn 🦂',
    'description':
        'Bạn sâu sắc, mạnh mẽ và có trực giác đáng nể. Một khi đã quyết, bạn đi tới cùng.',
    'emoji': '♏',
  },
  'sagittarius': {
    'resultKey': 'sagittarius',
    'title': 'Nhân Mã tự do 🏹',
    'description':
        'Bạn yêu trải nghiệm, thích khám phá và ghét bị gò bó. Mỗi ngày với bạn là một cuộc phiêu lưu.',
    'emoji': '♐',
  },
  'capricorn': {
    'resultKey': 'capricorn',
    'title': 'Ma Kết kiên trì 🏔️',
    'description':
        'Bạn bền bỉ, kỷ luật và có mục tiêu rõ ràng. Thành công của bạn là kết quả của sự nỗ lực dài hơi.',
    'emoji': '♑',
  },
  'aquarius': {
    'resultKey': 'aquarius',
    'title': 'Bảo Bình khác biệt 🚀',
    'description':
        'Bạn độc lập, sáng tạo và luôn có góc nhìn riêng. Ý tưởng của bạn thường đi trước thời đại.',
    'emoji': '♒',
  },
  'pisces': {
    'resultKey': 'pisces',
    'title': 'Song Ngư mộng mơ 🌊',
    'description':
        'Bạn giàu cảm xúc, lãng mạn và đồng cảm. Một tâm hồn nghệ sĩ với trí tưởng tượng phong phú.',
    'emoji': '♓',
  },
};

/// Kết quả tương ứng cho Quiz 4: Kiểu bạn bè
const Map<String, Map<String, dynamic>> kFriendResults = {
  'leader': {
    'resultKey': 'leader',
    'title': 'Đội trưởng đáng tin 🧭',
    'description':
        'Bạn là người dẫn dắt tự nhiên — quyết đoán, có kế hoạch và luôn kéo cả nhóm tiến lên.',
    'emoji': '🧭',
  },
  'listener': {
    'resultKey': 'listener',
    'title': 'Tri kỷ lắng nghe 🎧',
    'description':
        'Bạn biết cách thấu hiểu và khiến người khác thấy an tâm. Ở bên bạn, ai cũng cảm thấy được là chính mình.',
    'emoji': '🎧',
  },
  'joker': {
    'resultKey': 'joker',
    'title': 'Cây hài quốc dân 🎭',
    'description':
        'Bạn mang năng lượng vui vẻ và khiến mọi người cười không ngừng. Nhóm thiếu bạn là thiếu tiếng cười.',
    'emoji': '🎭',
  },
  'loyal': {
    'resultKey': 'loyal',
    'title': 'Người bạn kiên định 🛡️',
    'description':
        'Bạn trung thành, luôn ở bên khi cần. Tình bạn với bạn là thứ an toàn và bền vững nhất.',
    'emoji': '🛡️',
  },
  'explorer': {
    'resultKey': 'explorer',
    'title': 'Nhà thám hiểm nhóm 🌍',
    'description':
        'Bạn thích trải nghiệm mới, rủ rê cả nhóm khám phá. Đi với bạn là đi tới những điều thú vị.',
    'emoji': '🌍',
  },
};
