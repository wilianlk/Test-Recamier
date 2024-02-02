using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace recamier
{

    //Punto 1: cuando creamos una clase con sus propiedades y comportamientos tales como
    //encapsulamiento, reutilización, herencia, polimorfismo y abstracción.
    internal class Libro
    {
        // Propiedades
                    //Punto 2: cuando definimos los atrinutos y sus metodos
        public int Id { get; set; }
        public string Titulo { get; set; } 
        public string Autor { get; set; }
        public int AnoPublicacion { get; set; }
        public string Genero { get; set; }

        // Constructor
        public Libro(int id, string titulo, string autor, int anoPublicacion, string genero)
        {
            Id = id;
            Titulo = titulo;
            Autor = autor;
            AnoPublicacion = anoPublicacion;
            Genero = genero;
        }

        // Métodos
        public void MostrarDetalles()
        {
            Console.WriteLine($"Titulo: {Titulo}, Autor: {Autor}, Año de Publicación:  {AnoPublicacion}, Género: {Genero}");
        }

        //punto 4 :sobrecarga del metodo ya que su valor es mutable 

        public void MostrarDetalles(bool mostrarBasico)
        {
            if (mostrarBasico)
            {
                Console.WriteLine($"Titulo: {Titulo}, Autor: {Autor}");
            }
            else
            {
                MostrarDetalles(); 
            }
        }

        public void ActualizarGenero(string nuevoGenero)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(nuevoGenero))
                {
                    throw new ArgumentException("El nuevo genero no puede estar vacio o ser nulo.");
                }

                Genero = nuevoGenero;
                Console.WriteLine("Genero actualizado correctamente.");
            }
            catch (ArgumentException ex)
            {
                Console.WriteLine($"Error al actualizar el genero: {ex.Message}");
            }
        }


    }
}
