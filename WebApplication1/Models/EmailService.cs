using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class EmailService
    {
        QL_KhachSanEntities1 db = new QL_KhachSanEntities1();
        public void GuiEmail(string toEmail, string subject, string body)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(toEmail);
            mail.From = new MailAddress("huycaotientran2003@gmail.com");
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("huycaotientran2003@gmail.com", "sgimbiyxbedlqggl");
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        public void GuiThongBaoTraPhong()
        {
            DateTime targetDate = DateTime.Today.AddDays(2);

            var danhSachKhachHang = db.DATPHONGs
                .Include(dp => dp.KHACHHANG) // Đảm bảo có thông tin khách hàng
                .Where(dp => DbFunctions.TruncateTime(dp.NgayTra) == targetDate && dp.EmailDaGui == false)
                .ToList();

            foreach (var dp in danhSachKhachHang)
            {
                string subject = "Thông báo trả phòng sắp tới";

                string body = $"Kính chào quý khách <b>{dp.KHACHHANG.HoTen}</b>,<br><br>"
                            + $"Chúng tôi xin thông báo rằng quý khách sẽ trả phòng vào ngày <b>{dp.NgayTra:dd/MM/yyyy}</b>.<br>"
                            + $"Vui lòng chuẩn bị để hoàn tất các thủ tục trước ngày trả phòng.<br><br>"
                            + "Trân trọng,<br>Khách sạn ABC";

                GuiEmail(dp.KHACHHANG.Email, subject, body);

                // Đánh dấu đã gửi
                dp.EmailDaGui = true;
            }

            // Lưu thay đổi vào database
            db.SaveChanges();
        }
    }
}