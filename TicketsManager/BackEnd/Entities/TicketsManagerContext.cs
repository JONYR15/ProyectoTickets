using System;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace BackEnd.Entities
{
    public partial class TicketsManagerContext : IdentityDbContext
    {
        public TicketsManagerContext()
        {
            var optionsBuilder = new DbContextOptionsBuilder<TicketsManagerContext>();
            optionsBuilder.UseSqlServer(Utilities.Util.ConnectionString);

        }

        public TicketsManagerContext(DbContextOptions<TicketsManagerContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Incident> Incidents { get; set; }
        public virtual DbSet<Priority> Priorities { get; set; }
        public virtual DbSet<Sesion> Sesions { get; set; }
        public virtual DbSet<Status> Statuses { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(Utilities.Util.ConnectionString);
            optionsBuilder.EnableSensitiveDataLogging(true);
            base.OnConfiguring(optionsBuilder);

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("Department");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Incident>(entity =>
            {
                entity.ToTable("Incident");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.PriorityId).HasColumnName("Priority_Id");

                entity.Property(e => e.RequestById)
                    .HasMaxLength(128)
                    .HasColumnName("RequestBy_Id");

                entity.Property(e => e.StatusId).HasColumnName("Status_Id");

                entity.Property(e => e.Theme).HasMaxLength(100);

                entity.Property(e => e.UserId)
                    .HasMaxLength(128)
                    .HasColumnName("User_Id");

                entity.HasOne(d => d.Priority)
                    .WithMany(p => p.Incidents)
                    .HasForeignKey(d => d.PriorityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_dbo.Incidente_dbo.Prioridad_Prioridad_Id");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Incidents)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dbo.Incidente_dbo.Estado_Estado_Id");
            });

            modelBuilder.Entity<Priority>(entity =>
            {
                entity.ToTable("Priority");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<Sesion>(entity =>
            {
                entity.ToTable("Sesion");

                entity.Property(e => e.Description).IsRequired();

                entity.Property(e => e.IncidentId).HasColumnName("Incident_Id");

                entity.Property(e => e.StatusId).HasColumnName("Status_Id");

                entity.Property(e => e.UserId)
                    .HasMaxLength(128)
                    .HasColumnName("User_Id");

                entity.HasOne(d => d.Incident)
                    .WithMany(p => p.Sesions)
                    .HasForeignKey(d => d.IncidentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_dbo.Sesion_dbo.Incidente_Incidente_Id");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Sesions)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_dbo.Sesion_dbo.Estado_Estado_Id");
            });

            modelBuilder.Entity<Status>(entity =>
            {
                entity.ToTable("Status");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
