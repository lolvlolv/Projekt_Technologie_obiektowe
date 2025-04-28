using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BazaDanychSzkola.Modele
{
    public class Uczen:Szkola
    {
        public int OID { get; set; }
        public Szkola Szkola { get; set; }
        public string Imie { get; set; }
        public string Nazwisko { get; set; }
        public int Wiek { get; set; }
        public string Klasa { get; set; }
        public int Pesel {  get; set; }
    }
}
