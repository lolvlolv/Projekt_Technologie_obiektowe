using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Services;

namespace BazaDanychSzkola.Menu
{
    public class MenuNauczyciel
    {
        
        public void MenuNauczycieli()
        {
            bool menuNauczycieli = true;
            while (menuNauczycieli)

            {
                Console.WriteLine("=== Wybierz opcje ===");
                Console.WriteLine("1. Dodaj nauczyciela");
                Console.WriteLine("2. Wyświetl nauczycieli");
                Console.WriteLine("3. Usun nauczyciela");
                Console.WriteLine("4. Edytuj nauczyciela");
                Console.WriteLine("5. Powrót");

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
                    default:
                        Console.WriteLine("Wybór niepoprawny.");
                        break;
                }
            }

        }
    }
}
