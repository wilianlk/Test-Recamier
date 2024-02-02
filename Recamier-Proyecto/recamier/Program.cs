using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace recamier
{
    internal class Program
    {

        static void Main(string[] args)
        {
            Libro libro = new Libro(1,"code","william",2024,"Masculino"); /* Punto 3: cuando instanciamos una clase y hacemos usos de sus metodos*/
            libro.MostrarDetalles();
            Console.WriteLine("\x1b[34;1mMostrare la sobrecarga del método: \x1b[0m");
            libro.MostrarDetalles(true);
            Console.WriteLine("\x1b[34;1mMostrare la excepción del método: \x1b[0m");
            libro.ActualizarGenero(""); /*Punto 5: mostrando una excepción*/

            Console.ReadLine();
        }
    }
}
