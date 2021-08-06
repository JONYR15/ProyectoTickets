using BackEnd.Models;
using System.Threading.Tasks;

namespace Backend.Helpers
{
    public interface IEmailHelper
    {
        Task<bool> SendEmailAsync(EmailModel model);
    }
}