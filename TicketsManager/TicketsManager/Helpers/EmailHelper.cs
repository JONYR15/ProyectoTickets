using Backend.Models;
using BackEnd.Models;
using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using MimeKit;
using MimeKit.Text;
using System;
using System.Threading.Tasks;

namespace Backend.Helpers
{
    public class EmailHelper : IEmailHelper
    {
        private readonly EmailConfigurationModel _emailConfig;

        public EmailHelper(
            IOptions<EmailConfigurationModel> emailConfig
            )
        {
            _emailConfig = emailConfig.Value;
        }

        public async Task<bool> SendEmailAsync(EmailModel model)
        {
            try
            {
                var email = new MimeMessage();
                email.From.Add(MailboxAddress.Parse(_emailConfig.User));
                email.To.Add(MailboxAddress.Parse(model.To));
                email.Subject = model.Subject;
                email.Body = new TextPart(TextFormat.Html) { Text = model.Body };

                using var smtp = new SmtpClient();
                await smtp.ConnectAsync(_emailConfig.Host, _emailConfig.Port, SecureSocketOptions.StartTls);
                await smtp.AuthenticateAsync(_emailConfig.User, _emailConfig.Password);
                await smtp.SendAsync(email);
                await smtp.DisconnectAsync(true);

                return true;
            }
            catch (Exception Ex)
            {
                return false;
            }
        }
    }
}
