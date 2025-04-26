using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BazaDanychSzkola.Modele;
using BazaDanychSzkola.Services;
using Sqo;

namespace BazaDanychSzkola
{
    class IniciazliacjaBazy
    {
        public void InicializujBaze()
        {
            Siaqodb _siaqodb = new Siaqodb("c:/BazaDanychSzkola");

            //Dodawanie szkoly
            var _szkola = new Szkola
            {
                Nazwa = "Zespół Szkół nr 3 w Chmielniku",
                Adres = "ul. Szkolna 1",
                NumerTel = "123-456-789"
            };
            _siaqodb.StoreObject(_szkola);

            var uczenService = new UczenService(_siaqodb, _szkola);
            var nauczycielService = new NauczycielService(_siaqodb, _szkola);
        }
    }
}

