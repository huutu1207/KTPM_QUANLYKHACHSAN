using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        QL_KhachSanEntities1 db =new QL_KhachSanEntities1();
        public ActionResult Index()
        {
            // Kiểm tra nếu người dùng đã đăng nhập
            if (Session["NhanVien"] != null && Session["UserChucVu"] != null)
            {
                string tenDangNhap = Session["NhanVien"].ToString();
                string chucVu = Session["UserChucVu"].ToString();

                // Lấy thông tin nhân viên từ cơ sở dữ liệu
                var nhanVien = db.NHANVIENs.SingleOrDefault(n => n.HoTen == tenDangNhap);

                if (nhanVien != null)
                {
                    // Truyền thông tin nhân viên vào ViewBag
                    ViewBag.ThongTinNhanVien = nhanVien;

                    // Nếu là quản lý, truyền thêm thông tin vai trò
                    if (chucVu.ToLower() == "quản lý" || chucVu.ToLower() == "manager")
                    {
                        ViewBag.VaiTro = "Quản lý";
                    }
                    else
                    {
                        ViewBag.VaiTro = "Nhân viên";
                    }
                }
            }
            else
            {
                // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
                return RedirectToAction("DangNhap");
            }

            return View();

        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //Gán các giá trị người dùng nhập liệu cho các biến 
            var sTenDN = f["UserName"];
            var sMatKhau = f["Password"];
            //Gán giá trị cho đối tượng được tạo mới (ad)  
            NHANVIEN ad = db.NHANVIENs.SingleOrDefault(n => n.Username == sTenDN && n.Password == sMatKhau);
            if (ad != null)
            {
                Session["UserChucVu"] = ad.ChucVu;
                Session["NhanVien"] = ad.HoTen;
                if (ad.ChucVu == "Quan li" || ad.ChucVu=="Le tan")
                {
                    if (Session["DaGuiEmailHomNay"] == null || (DateTime)Session["DaGuiEmailHomNay"] != DateTime.Today)
                    {
                        var emailService = new WebApplication1.Controllers.EmailService();
                        emailService.GuiThongBaoTraPhong();
                        emailService.GuiThongBaoTraPhong();
                        Session["DaGuiEmailHomNay"] = DateTime.Today;
                    }
                }
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        
        public ActionResult Logout()
        {
            Session["Admin"] = null;
            return RedirectToAction("DangNhap");
        }
        [HttpGet]
        public ActionResult ChinhSua(string id)
        {
            var nv = db.NHANVIENs.FirstOrDefault(n => n.MaNV == id);
            if (nv == null) return HttpNotFound();

            var model = new NHANVIEN
            {
                MaNV = nv.MaNV,
                HoTen = nv.HoTen,
                DiaChi = nv.DiaChi,
                Email = nv.Email,
                NgaySinh = nv.NgaySinh,
                GioiTinh = nv.GioiTinh,
                DienThoai = nv.DienThoai
            };

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChinhSua(NHANVIEN model)
        {
            if (ModelState.IsValid)
            {
                var nv = db.NHANVIENs.FirstOrDefault(n => n.MaNV == model.MaNV);
                if (nv == null) return HttpNotFound();
                
                nv.HoTen = model.HoTen;
                nv.DiaChi = model.DiaChi;
                nv.Email = model.Email;
                nv.NgaySinh = model.NgaySinh;
                nv.GioiTinh = model.GioiTinh;
                nv.DienThoai = model.DienThoai;

                db.SaveChanges();
                TempData["Success"] = "Cập nhật thành công!";
                return RedirectToAction("ChinhSua", "Admin", new { area = "Admin", id = model.MaNV });


            }

            return View(model); // Trả lại form nếu có lỗi nhập liệu
        }
    }
}