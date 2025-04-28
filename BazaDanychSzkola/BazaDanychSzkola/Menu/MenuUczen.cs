using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Services;

namespace BazaDanychSzkola.Menu
{
    internal class MenuUczen
    {
        public void MenuUcznia()
        {
            bool menuUczniow = true;
            while (menuUczniow)
            {
                Console.WriteLine("=== Wybierz opcje ===");
                Console.WriteLine("1. Dodaj ucznia");
                Console.WriteLine("2. Wyswietl uczniów");
                Console.WriteLine("3. Usuń ucznia");
                Console.WriteLine("4. Edytuj ucznia");
                Console.WriteLine("5. Powrót");

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
        }
    }
}
