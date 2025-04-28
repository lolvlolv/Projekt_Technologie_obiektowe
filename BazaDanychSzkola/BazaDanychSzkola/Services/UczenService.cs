using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Modele;
using Sqo;

namespace BazaDanychSzkola.Services
{
    class UczenService
    {
        static Siaqodb _siaqodb;
        static Szkola _szkola;

        public UczenService(Siaqodb siaqodb, Szkola szkola)
        {
            _siaqodb = siaqodb;
            _szkola = szkola;
        }
        public static void DodajUcznia()
        {
            Console.WriteLine("Podaj imie:");
            string imie = Console.ReadLine();
            Console.WriteLine("Podaj Nazwisko:");
            string nazwisko = Console.ReadLine();
            int wiek;
            while (true)
            {
                Console.WriteLine("Podaj wiek:");
                try
                {
                    wiek = int.Parse(Console.ReadLine());
                    break;
                }
                catch (FormatException)
                {
                    Console.WriteLine("Błąd: podano niepoprawny format.");
                }
            }
            Console.WriteLine("Podaj Klase ucznia:");
            string klasa = Console.ReadLine();
            Console.WriteLine("Podaj numer PESEL:");
            int pesel;
            while (true)
            {
                Console.WriteLine("Podaj wiek:");
                try
                {
                    pesel = int.Parse(Console.ReadLine());
                    break;
                }
                catch (FormatException)
                {
                    Console.WriteLine("Błąd: podano niepoprawny format.");
                }
            }

            Uczen uczen = new Uczen()
            {
                Szkola = _szkola,
                Imie = imie,
                Nazwisko = nazwisko,
                Wiek = wiek,
                Klasa = klasa,
                Pesel = pesel

            };
            _siaqodb.StoreObject(uczen);
            Console.WriteLine("Uczen dodany");

        }

        public static void WyswietlUczniow()
        {
            var uczniowie = _siaqodb.LoadAll<Uczen>();
            Console.WriteLine("===== Lista uczniów =====");
            foreach (var uczen in uczniowie)
            {
                Console.WriteLine($"ID: {uczen.OID}| {uczen.Nazwisko} {uczen.Imie}, {uczen.Wiek}, {uczen.Klasa},{uczen.Pesel}");
            }
        }

        public static void UsunUcznia()
        {
            Console.WriteLine("Podaj ID ucznia do usunięcia");
            string userInput = Console.ReadLine();
            int id = int.Parse(userInput);

            var uczen = _siaqodb.LoadObjectByOID<Uczen>(id);

            if (uczen != null)
            {
                _siaqodb.Delete(uczen);
                Console.WriteLine("Uczen został usuniety.");

            }
            else
            {
                Console.WriteLine("Nie znaleziono ucznia z tym ID");
            }


        }
        public static void EdytujUcznia()
        {
            WyswietlUczniow();
            Console.WriteLine("Podaj ID ucznia do edycji:");
            string userInput = Console.ReadLine();
            int id = int.Parse(userInput);
            var uczen = _siaqodb.LoadObjectByOID<Uczen>(id);

            Console.WriteLine("Znaleziono ucznia z tym ID, oto dane ucznia.");
            Console.WriteLine($"Imie: {uczen.Imie}");
            Console.WriteLine($"Nazwisko: {uczen.Nazwisko}");
            Console.WriteLine($"Wiek: {uczen.Wiek}");
            Console.WriteLine($"Klasa: {uczen.Klasa}");
            Console.WriteLine($"Pesel: {uczen.Pesel}");

            Console.WriteLine("Wybierz pole do edycji.");
            Console.WriteLine("1. Imie.");
            Console.WriteLine("2. Nazwisko.");
            Console.WriteLine("3. Wiek");
            Console.WriteLine("4. Klasa");
            Console.WriteLine("5. Numer Pesel");
            Console.WriteLine("0. Powrót");

            string userInput2 = Console.ReadLine();
            int input2 = int.Parse(userInput2);

            switch (input2)
            {
               
                case 1:
                    Console.WriteLine($"Wprowadz nowe imię.");
                    string noweImie = Console.ReadLine();
                    uczen.Imie = noweImie;
                    Console.WriteLine($"Zmieniono imie na {noweImie}");
                    break;
                case 2:
                    Console.WriteLine($"Wprowadz nowe nazwisko.");
                    string noweNazwisko = Console.ReadLine();
                    uczen.Nazwisko = noweNazwisko;
                    Console.WriteLine($"Zmieniono nazwisko na {noweNazwisko}");

                    break;
                case 3:
                    Console.WriteLine($"Wprowadz nowy wiek.");
                    string nowyWiek = Console.ReadLine();
                    int nowyWiek2 = int.Parse(nowyWiek);
                    uczen.Wiek = nowyWiek2;
                    Console.WriteLine($"Zmieniono wiek na {nowyWiek}");

                    break;
                case 4:
                    Console.WriteLine($"Wprowadz nową klasę.");
                    string nowaKlasa = Console.ReadLine();
                    uczen.Klasa = nowaKlasa;
                    Console.WriteLine($"Zmieniono klasę na {nowaKlasa}");

                    break;
                case 5:
                    Console.WriteLine($"Wprowadz nowy numer pesel.");
                    string nowyPesel = Console.ReadLine();
                    int nowyPesel2 = int.Parse(nowyPesel);
                    uczen.Pesel = nowyPesel2;
                    Console.WriteLine($"Zmieniono numer pesel na {nowyPesel2}");
                    break;
                case 0:
                    return;
                default:
                    Console.WriteLine($"Niepoprawny wybór.");
                    break;
            }





        }
    }
}
