using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Modele;
using Sqo;

namespace BazaDanychSzkola.Services
{
    class NauczycielService
    {
        static Siaqodb _siaqodb;
        static Szkola _szkola;

        public NauczycielService(Siaqodb siaqodb, Szkola szkola)
        {
            _siaqodb = siaqodb;
            _szkola = szkola;
        }
        public static void DodajNauczyciela()
        {
            Console.WriteLine("Podaj imie:");
            string imie = Console.ReadLine();
            Console.WriteLine("Podaj nazwisko:");
            string nazwisko = Console.ReadLine();
            Console.WriteLine("Podaj wiek:");
            int wiek = int.Parse(Console.ReadLine());
            Console.WriteLine("Podaj nauczany przedmiot:");
            string nauczanyPrzedmiot = Console.ReadLine();
            Console.WriteLine("Podaj numer PESEL:");
            string pesel = Console.ReadLine();

            Nauczyciel nauczyciel = new Nauczyciel()
            {
                Szkola = _szkola,
                Imie = imie,
                Nazwisko = nazwisko,
                Wiek = wiek,
                NauczanyPrzedmiot = nauczanyPrzedmiot,
                Pesel = pesel

            };
            _siaqodb.StoreObject(nauczyciel);
            Console.WriteLine("Nauczyciel dodany.");

        }

        public static void WyswietlNauczycieli()
        {
            var nauczyciele = _siaqodb.LoadAll<Nauczyciel>();
            Console.WriteLine("=== Lista nauczycieli ===");
            foreach (var naucz in nauczyciele)
            {
                Console.WriteLine($"ID: {naucz.OID}| {naucz.Nazwisko} {naucz.Imie}, {naucz.Wiek}, {naucz.NauczanyPrzedmiot},{naucz.Pesel}");
            }
        }

        public static void UsunNauczyciela()
        {
            Console.WriteLine("Podaj ID nauczyciela do usunięcia.");
            string userInput = Console.ReadLine();
            int id = int.Parse(userInput);

            var nauczyciel = _siaqodb.LoadObjectByOID<Nauczyciel>(id);

            if (nauczyciel != null)
            {
                _siaqodb.Delete(nauczyciel);
                Console.WriteLine("Nauczyciel został usuniety.");

            }
            else
            {
                Console.WriteLine("Nie znaleziono nauczyciela z tym ID.");
            }


        }
        public static void EdytujNauczyciela()
        {
            Console.WriteLine("Podaj ID nauczyciela do edycji:");
            string userInput = Console.ReadLine();
            int id = int.Parse(userInput);
            var nauczyciel = _siaqodb.LoadObjectByOID<Nauczyciel>(id);

            Console.WriteLine("Znaleziono ucznia z tym ID, oto dane ucznia.");
            Console.WriteLine($"Imie: {nauczyciel.Imie}");
            Console.WriteLine($"Nazwisko: {nauczyciel.Nazwisko}");
            Console.WriteLine($"Wiek: {nauczyciel.Wiek}");
            Console.WriteLine($"NauczanyPrzedmiot: {nauczyciel.NauczanyPrzedmiot}");
            Console.WriteLine($"Pesel: {nauczyciel.Pesel}");

            Console.WriteLine("Wybierz pole do edycji.");
            string userInput2 = Console.ReadLine();
            int input2 = int.Parse(userInput2);

            switch (input2)
            {
                case 0:
                    Environment.Exit(0);
                    break;
                case 1:
                    string noweImie = Console.ReadLine();
                    nauczyciel.Imie = noweImie;
                    break;
                case 2:
                    string noweNazwisko = Console.ReadLine();
                    nauczyciel.Nazwisko = noweNazwisko;
                    break;
                case 3:
                    string nowyWiek = Console.ReadLine();
                    int nowyWiek2 = int.Parse(nowyWiek);
                    nauczyciel.Wiek = nowyWiek2;
                    break;
                case 4:
                    string nowyNauczanyPrzedmiot = Console.ReadLine();
                    nauczyciel.NauczanyPrzedmiot = nowyNauczanyPrzedmiot;
                    break;
                case 5:
                    string nowyPesel = Console.ReadLine();
                    nauczyciel.Pesel = nowyPesel;
                    break;
            }
        }
    }
}

