using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace BackEnd.Entities
{
    public partial class Padron_ElectoralContext : DbContext
    {
        public Padron_ElectoralContext()
        {
        }

        public Padron_ElectoralContext(DbContextOptions<Padron_ElectoralContext> options)
            : base(options)
        {
        }

        public virtual DbSet<PadronCompleto> PadronCompletos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<PadronCompleto>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("PADRON_COMPLETO");

                entity.Property(e => e.Cedula)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Correo)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PrimerApellido)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Primer_Apellido");

                entity.Property(e => e.SegundoApellido)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Segundo_Apellido");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
