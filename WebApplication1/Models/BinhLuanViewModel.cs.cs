using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class BinhLuanViewModel
    {
        public int MaBL { get; set; }
        public string TenKhachHang { get; set; }
        public DateTime NgayDanhGia { get; set; }
        public string NoiDung { get; set; }
        public int DanhGia { get; set; }
    }
}