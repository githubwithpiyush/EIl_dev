using System.Drawing.Imaging;
using System.Drawing;
using System;
using System.Web;

namespace BulkSMSWebApp
{
    public partial class Captcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string captchaCode = GenerateRandomCode(5); // 5-letter code
            Session["Captcha"] = captchaCode;

            using (Bitmap bmp = new Bitmap(100, 40))
            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.Clear(Color.LightGray);
                using (Font font = new Font("Arial", 20, FontStyle.Bold))
                {
                    g.DrawString(captchaCode, font, Brushes.Black, new PointF(10, 5));
                }

                Response.ContentType = "image/png";
                bmp.Save(Response.OutputStream, ImageFormat.Png);
            }
        }

        private string GenerateRandomCode(int length)
        {
            string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            Random rand = new Random();
            char[] result = new char[length];
            for (int i = 0; i < length; i++)
                result[i] = chars[rand.Next(chars.Length)];
            return new string(result);
        }
    }
}