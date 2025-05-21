using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Areas.Admin.Controllers
{
    public class QL_DichVuController : Controller
    {
        private QL_KhachSanEntities1 db = new QL_KhachSanEntities1();  
        // GET: Admin/QL_DichVu
        public ActionResult DSDichVu()
        {
            var dv = db.DICHVUs.ToList();
            return View(dv);
        }


        private string GenerateMaDV()
        {
            var lastMaDV = db.DICHVUs
                     .OrderByDescending(d => d.MaDV)
                     .Select(d => d.MaDV)
                     .FirstOrDefault();

            if (lastMaDV == null)
            {
                return "DV001"; // Mã đầu tiên nếu bảng rỗng
            }

            // Lấy phần số từ mã dịch vụ cuối cùng
            var numberPart = int.Parse(lastMaDV.Substring(2));
            return "DV" + (numberPart + 1).ToString("D3"); // Tăng thêm 1 và định dạng 3 chữ số
        }

        [HttpGet]
        public ActionResult ThemDichVu()
        {      
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken] // Thêm ValidateAntiForgeryToken nếu View có @Html.AntiForgeryToken()
        public ActionResult ThemDichVu(DICHVU dichVu, HttpPostedFileBase AnhUpload) // Thêm HttpPostedFileBase AnhUpload
        {
            if (ModelState.IsValid)
            {
                // Gọi hàm tự động sinh mã
                dichVu.MaDV = GenerateMaDV(); // Đảm bảo hàm này được định nghĩa và hoạt động đúng

                // Xử lý upload file ảnh
                if (AnhUpload != null && AnhUpload.ContentLength > 0)
                {
                    try
                    {
                        string fileName = Path.GetFileName(AnhUpload.FileName);
                        string path = Path.Combine(Server.MapPath("~/Images/DichVu"), fileName); 

                        // Tạo thư mục nếu chưa tồn tại
                        string directoryPath = Server.MapPath("~/Images/DichVu");
                        if (!Directory.Exists(directoryPath))
                        {
                            Directory.CreateDirectory(directoryPath);
                        }

                        if (!System.IO.File.Exists(path))
                        {
                            AnhUpload.SaveAs(path); // Lưu file lên server
                            dichVu.AnhDichVu = fileName; // Gán tên file vào thuộc tính AnhDichVu của DICHVU
                        }
                        else
                        {
                            string extension = Path.GetExtension(fileName);
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(fileName);
                            string newFileName = $"{fileNameWithoutExtension}_{DateTime.Now.Ticks}{extension}";
                            path = Path.Combine(Server.MapPath("~/Images/DichVu"), newFileName);
                            AnhUpload.SaveAs(path);
                            dichVu.AnhDichVu = newFileName;
                        }
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", "Lỗi khi upload file ảnh: " + ex.Message);
                        return View(dichVu); // Trả về View với lỗi
                    }
                }
                else
                {
                    dichVu.AnhDichVu = null; 
                }

                db.DICHVUs.Add(dichVu);
                db.SaveChanges();
                return RedirectToAction("DSDichVu");
            }

            return View(dichVu);
        }

        [HttpGet]
        public ActionResult SuaDichVu(string id)
        {
            var dichVu = db.DICHVUs.Find(id);
            if (dichVu == null)
            {
                return HttpNotFound();
            }
            return View(dichVu);
        }

        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult SuaDichVu(DICHVU dichVu)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(dichVu).State = System.Data.Entity.EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("DSDichVu");
        //    }
        //    return View(dichVu);
        //}
        [HttpPost]
        [ValidateAntiForgeryToken] // Nên có để bảo mật
        public ActionResult SuaDichVu(DICHVU dichVu, HttpPostedFileBase AnhUpload) // Thêm tham số AnhUpload
        {
            // Kiểm tra ModelState trước
            if (ModelState.IsValid)
            {
                try
                {
                    // Xử lý upload file ảnh mới nếu có
                    if (AnhUpload != null && AnhUpload.ContentLength > 0)
                    {
                        string oldFileName = dichVu.AnhDichVu; // Lưu lại tên file cũ để có thể xóa nếu cần

                        string fileName = Path.GetFileName(AnhUpload.FileName);
                        string path = Path.Combine(Server.MapPath("~/Images/DichVu"), fileName /* hoặc uniqueFileName */);

                        // Tạo thư mục nếu chưa tồn tại
                        string directoryPath = Server.MapPath("~/Images/DichVu");
                        if (!Directory.Exists(directoryPath))
                        {
                            Directory.CreateDirectory(directoryPath);
                        }

                        AnhUpload.SaveAs(path);
                        dichVu.AnhDichVu = fileName; // Cập nhật tên file ảnh mới cho đối tượng dichVu

                        // (Tùy chọn) Xóa file ảnh cũ nếu không còn dùng đến và tên file mới khác file cũ
                        if (!string.IsNullOrEmpty(oldFileName) && oldFileName != dichVu.AnhDichVu)
                        {
                            string oldPath = Path.Combine(Server.MapPath("~/Images/DichVu"), oldFileName);
                            if (System.IO.File.Exists(oldPath))
                            {
                                // Cẩn thận khi xóa file, đảm bảo logic đúng
                                // System.IO.File.Delete(oldPath);
                            }
                        }
                    }
                    db.Entry(dichVu).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    TempData["SuccessMessage"] = "Cập nhật dịch vụ thành công!"; // Thông báo thành công (tùy chọn)
                    return RedirectToAction("DSDichVu", "QL_DichVu", new { area = "Admin" }); // Nhớ thay QL_DichVu
                }
                catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                {
                    // Lấy chi tiết lỗi validation (như đã hướng dẫn trước)
                    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    {
                        foreach (var validationError in validationErrors.ValidationErrors)
                        {
                            ModelState.AddModelError(validationError.PropertyName, validationError.ErrorMessage);
                        }
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Đã xảy ra lỗi không mong muốn: " + ex.Message);
                }
            }
            return View(dichVu);
        }

        [HttpGet]
        public ActionResult XoaDichVu(string id)
        {
            var dichVu = db.DICHVUs.Find(id);
            if (dichVu == null)
            {
                return HttpNotFound();
            }
            db.DICHVUs.Remove(dichVu);
            db.SaveChanges();
            return RedirectToAction("DSDichVu");
        }

    }
}