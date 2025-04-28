using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Menu;
using BazaDanychSzkola.Modele;
using BazaDanychSzkola.Services;
using Sqo;


namespace BazaDanychSzkola
{


    class Program
    {

        static void Main(string[] args)
        {
            IniciazliacjaBazy baza = new IniciazliacjaBazy();
            baza.InicializujBaze();
            MenuNauczyciel menuNaucz = new MenuNauczyciel();
            MenuUczen menuUczen = new MenuUczen();
            bool dziala = true;

            do
            {
                Console.WriteLine("=== Menu bazy danych szkoły ===");
                Console.WriteLine("1. Wybierz uczniów.");
                Console.WriteLine("2. Wybierz nauczycieli.");
                Console.WriteLine("3. Wyjscie z programu.");

                string wybierzKto = Console.ReadLine();
                int kto = int.Parse(wybierzKto);

                switch (kto)
                {
                    case 1:
                        menuUczen.MenuUcznia();
                        break;

                    case 2:
                        menuNaucz.MenuNauczycieli();
                        break;
                    case 3:
                        dziala = false;
                        break;
                }
            }
            while (dziala);
        }
    }

}

