using FrontEnd.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace FrontEnd.Hubs
{
    [Authorize]
    public class NotificationHub: Hub
    {
        public readonly static ConnectionMapping<string> _connections =
            new ConnectionMapping<string>();

        public async Task SendNotification(string user, string message)
        {
            await Clients.All.SendAsync("ReceiveNotification", message);
        }

        public override Task OnConnectedAsync()
        {
            string id = Context.User.Claims.FirstOrDefault(x => x.Type.Equals(ClaimTypes.NameIdentifier)).Value;

            _connections.Add(id, Context.ConnectionId);

            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            string id = Context.User.Claims.FirstOrDefault(x => x.Type.Equals(ClaimTypes.NameIdentifier)).Value;

            _connections.Remove(id, Context.ConnectionId);

            return base.OnDisconnectedAsync(exception);
        }
    }
}
