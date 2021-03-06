using Backend.Entities;
using System;

namespace TicketsManager.DAL
{
    public class UnidadDeTrabajo<T> : IDisposable where T : class
    {
        private readonly TicketsManagerContext context;
        public IDALGenerico<T> genericDAL;


        public UnidadDeTrabajo(TicketsManagerContext _context)
        {
            context = _context;
            genericDAL = new DALGenericoImpl<T>(context);

        }

        public bool Complete()
        {
            try
            {
                context.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                string msj = e.Message;
                return false;
            }

        }


        public void Dispose()
        {
            context.Dispose();
        }
    }
}