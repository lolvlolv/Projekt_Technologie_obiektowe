using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
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

                        bool menuUczniow = true;
                        while (menuUczniow)
                        {
                            Console.WriteLine("=== Wybierz opcje ===");
                            Console.WriteLine("1. Dodaj ucznia");
                            Console.WriteLine("2. Wyswietl uczniów");
                            Console.WriteLine("3. Usuń ucznia");
                            Console.WriteLine("4. Edytuj ucznia");
                            Console.WriteLine("5.Wyjscie");

                            string userInput = Console.ReadLine();
                            int wybor1 = int.Parse(userInput);


                            switch (wybor1)
                            {

                                case 1:
                                    UczenService.DodajUcznia();
                                    break;
                                case 2:
                                    UczenService.WyswietlUczniow();
                                    break;
                                case 3:
                                    UczenService.UsunUcznia();
                                    break;
                                case 4:
                                    UczenService.EdytujUcznia();
                                    break;
                                case 5:
                                    menuUczniow = false;
                                    break;
                                default:
                                    Console.WriteLine("Wybór niepoprawny.");
                                    break;
                            }


                        }
                        break;

                    case 2:
                        bool menuNauczycieli = true;
                        while (menuNauczycieli)

                        {
                            Console.WriteLine("=== Wybierz opcje ===");
                            Console.WriteLine("1. Dodaj nauczyciela");
                            Console.WriteLine("2. Wyświetl nauczycieli");
                            Console.WriteLine("3. Usun nauczyciela");
                            Console.WriteLine("4. Edytuj nauczyciela");
                            Console.WriteLine("5. Wyjscie");

                            string userInput = Console.ReadLine();
                            int wybor2 = int.Parse(userInput);

                            switch (wybor2)
                            {

                                case 1:
                                    NauczycielService.DodajNauczyciela();
                                    break;
                                case 2:
                                    NauczycielService.WyswietlNauczycieli();
                                    break;
                                case 3:
                                    NauczycielService.UsunNauczyciela();
                                    break;
                                case 4:
                                    NauczycielService.EdytujNauczyciela();
                                    break;
                                case 5:
                                    menuNauczycieli = false;
                                    break;
                            }
                        }
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

