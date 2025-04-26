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
            Console.WriteLine("Podaj Wiek:");
            int wiek = int.Parse(Console.ReadLine());
            Console.WriteLine("Podaj Klase ucznia:");
            string klasa = Console.ReadLine();
            Console.WriteLine("Podaj numer PESEL:");
            string pesel = Console.ReadLine();

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
            string userInput2 = Console.ReadLine();
            int input2 = int.Parse(userInput2);

            switch (input2)
            {
                case 1:
                    string noweImie = Console.ReadLine();
                    uczen.Imie = noweImie;
                    break;
                case 2:
                    string noweNazwisko = Console.ReadLine();
                    uczen.Nazwisko = noweNazwisko;
                    break;
                case 3:
                    string nowyWiek = Console.ReadLine();
                    int nowyWiek2 = int.Parse(nowyWiek);
                    uczen.Wiek = nowyWiek2;
                    break;
                case 4:
                    string nowaKlasa = Console.ReadLine();
                    uczen.Klasa = nowaKlasa;
                    break;
                case 5:
                    string nowyPesel = Console.ReadLine();
                    uczen.Pesel = nowyPesel;
                    break;
            }





        }
    }
}
