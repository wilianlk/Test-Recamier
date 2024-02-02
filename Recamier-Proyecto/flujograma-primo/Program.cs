using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace flujograma_primo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            bool continuar = true;

            while (continuar)
            {
                Console.WriteLine("Introduzca un numero: ");
                int numero = Convert.ToInt32(Console.ReadLine());

                bool resultado = EsPrimo(numero);

                if (resultado)
                {
                    Console.WriteLine($"true - El numero {numero} es primo.");
                }
                else
                {
                    Console.WriteLine($"false - El numero {numero} no es primo.");
                }

                Console.WriteLine("¿Desea ingresar otro numero? (S/N): ");
                string respuesta = Console.ReadLine().ToUpper();

                if (respuesta != "S")
                {
                    continuar = false;
                }
            }

            Console.WriteLine("Proceso finalizado.");

        }

        static bool EsPrimo(int numero)
        {
            if (numero < 2)
            {
                return false;
            }

            int raizCuadrada = (int)Math.Sqrt(numero);
            for (int i = 2; i <= raizCuadrada; i++)
            {
                if (numero % i == 0)
                {
                    return false;
                }
            }

            return true;
        }
    }
}
