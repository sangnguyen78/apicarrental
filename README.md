# API Car Rental

API backend cho dự án quản lý thuê xe, xây dựng trên **Laravel 10**. Repository hiện cung cấp API quản lý người dùng qua REST và GraphQL, cùng các mutation phục vụ đăng ký, đăng nhập và quy trình đặt lại mật khẩu.

> **Lưu ý về phạm vi hiện tại:** tên repository là `apicarrental`, nhưng các route và GraphQL schema hiện có chủ yếu thể hiện chức năng người dùng/xác thực. Hãy bổ sung mô tả và endpoint xe/đặt thuê sau khi các chức năng đó được triển khai hoặc xác nhận trong mã nguồn.

## Công nghệ

- PHP **8.1+**
- Laravel **10**
- MySQL hoặc MariaDB
- GraphQL với [Lighthouse](https://lighthouse-php.com/)
- Laravel Sanctum và JWT Auth (các package được khai báo trong Composer)
- Vite, npm và Axios

## Chức năng hiện có

- **REST API người dùng:** tạo, xem danh sách, xem chi tiết, cập nhật và xóa người dùng.
- **GraphQL truy vấn người dùng:** truy vấn danh sách và thông tin người dùng theo ID.
- **GraphQL xác thực:** đăng ký, đăng nhập, đăng xuất và làm mới `auth_key`.
- **Quản lý mật khẩu:** yêu cầu mã đặt lại, đặt lại và cập nhật mật khẩu.
- Xác thực dữ liệu đầu vào và băm mật khẩu khi tạo tài khoản.

## Cài đặt và chạy cục bộ

### Yêu cầu

Cài đặt PHP 8.1 trở lên cùng các extension Laravel cần dùng, Composer, Node.js/npm và MySQL hoặc MariaDB. Cần bật PHP PDO driver phù hợp với cơ sở dữ liệu (ví dụ `pdo_mysql`).

### 1. Tải mã nguồn và cài dependencies

```bash
git clone https://github.com/sangnguyen78/apicarrental.git
cd apicarrental

composer install
npm install
```

### 2. Cấu hình môi trường

Tạo tệp `.env` ở thư mục gốc. Repository hiện không có `.env.example`, vì vậy có thể bắt đầu với cấu hình tối thiểu sau và điều chỉnh thông tin kết nối cho môi trường của bạn:

```dotenv
APP_NAME="API Car Rental"
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://127.0.0.1:8000

LOG_CHANNEL=stack
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=carrental
DB_USERNAME=root
DB_PASSWORD=
```

Tạo database `carrental` trước, sau đó tạo application key:

```bash
php artisan key:generate
```

> Không commit `.env` hoặc thông tin bí mật lên GitHub. Trên môi trường production, đặt `APP_DEBUG=false`.

### 3. Khởi tạo cơ sở dữ liệu

Chọn **một** cách phù hợp với database của bạn:

- Chạy migration Laravel:

  ```bash
  php artisan migrate
  ```

- Hoặc kiểm tra và import SQL có sẵn tại [`database/queryDB.sql`](database/queryDB.sql) vào database `carrental` bằng MySQL client. Hãy sao lưu database trước khi import; không chạy cả migration và SQL dump một cách máy móc nếu chúng tạo trùng bảng.

### 4. Khởi chạy ứng dụng

Mở terminal thứ nhất để chạy Laravel:

```bash
php artisan serve
```

Mở terminal thứ hai nếu cần Vite trong quá trình phát triển frontend/assets:

```bash
npm run dev
```

Laravel mặc định chạy tại <http://127.0.0.1:8000>. Dừng Vite bằng `Ctrl+C` khi không cần nữa.

## API

### REST

Các route REST được khai báo bằng `Route::apiResource('users', ...)` và có prefix `/api` theo cấu hình Laravel mặc định:

| Phương thức | Endpoint | Mô tả |
|---|---|---|
| `GET` | `/api/users` | Lấy danh sách người dùng |
| `GET` | `/api/users/{id}` | Lấy người dùng theo ID |
| `POST` | `/api/users` | Tạo người dùng |
| `PUT/PATCH` | `/api/users/{id}` | Cập nhật người dùng |
| `DELETE` | `/api/users/{id}` | Xóa người dùng |

Ví dụ tạo người dùng:

```bash
curl -X POST http://127.0.0.1:8000/api/users \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{"name":"Nguyen Van A","email":"a@example.com","password":"change-me-123"}'
```

### GraphQL

Schema được định nghĩa tại [`graphql/schema.graphql`](graphql/schema.graphql). Với cấu hình Lighthouse mặc định, endpoint GraphQL là `/graphql`:

```graphql
query {
  users {
    id
    name
    email
  }
}
```

Ví dụ gửi truy vấn bằng `curl`:

```bash
curl -X POST http://127.0.0.1:8000/graphql \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d '{"query":"{ users { id name email } }"}'
```

## Kiểm thử

Chạy bộ kiểm thử Laravel bằng lệnh:

```bash
php artisan test
```

## Ảnh minh họa

Repository hiện chưa có ảnh chụp màn hình hoặc giao diện demo được theo dõi trong mã nguồn. Vì đây là backend API, bạn có thể thêm ảnh từ công cụ kiểm thử (ví dụ Postman/Insomnia), GraphQL IDE hoặc ứng dụng client vào `docs/images/`, rồi nhúng vào README như sau:

```markdown
![Ví dụ kiểm thử API Car Rental](docs/images/api-carrental.png)
```

Không nên dùng ảnh placeholder như ảnh chụp thật; hãy thêm ảnh sau khi đã chụp từ phiên bản đang chạy.

## Cấu trúc liên quan

```text
app/Http/Controllers/   # REST controllers
app/GraphQL/            # GraphQL resolvers và mutations
graphql/schema.graphql  # GraphQL schema
routes/api.php          # REST API routes
database/               # Migrations và SQL scripts
```

## Đóng góp

Các đóng góp giúp cải thiện dự án đều được hoan nghênh. Trước khi bắt đầu một thay đổi lớn, hãy mở issue để trao đổi về hướng triển khai và phạm vi công việc.

1. Fork repository và tạo branch riêng từ `main`:

   ```bash
   git checkout -b feat/mo-ta-thay-doi
   ```

2. Thực hiện thay đổi theo đúng phạm vi, giữ mã nguồn nhất quán với cấu trúc hiện có và không đưa thông tin bí mật hoặc tệp `.env` vào commit.
3. Chạy các kiểm thử phù hợp trước khi gửi:

   ```bash
   php artisan test
   ```

4. Commit với thông điệp ngắn gọn, mô tả đúng nội dung thay đổi, rồi push branch lên fork của bạn.
5. Mở pull request vào nhánh `main`. Trong mô tả PR, nêu mục đích, những thay đổi chính, cách kiểm thử và ảnh minh họa nếu thay đổi có ảnh hưởng đến giao diện.

Pull request sẽ được xem xét trước khi hợp nhất. Có thể đề nghị chỉnh sửa hoặc bổ sung kiểm thử để đảm bảo thay đổi phù hợp với dự án.

## Giấy phép

Hiện repository **chưa có tệp `LICENSE`**, vì vậy chưa có giấy phép mã nguồn mở nào được công bố cho toàn bộ dự án. Không nên mặc định rằng mã nguồn được phép sử dụng, chỉnh sửa hoặc phân phối lại theo một giấy phép cụ thể.

Nếu bạn là chủ sở hữu dự án và muốn cấp quyền sử dụng mã nguồn, hãy chọn giấy phép phù hợp, thêm tệp `LICENSE` ở thư mục gốc và cập nhật mục này. Nếu chưa có sự cho phép rõ ràng, vui lòng liên hệ chủ sở hữu repository trước khi sử dụng hoặc phân phối lại mã nguồn.
