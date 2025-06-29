using System;
using System.Diagnostics;
using Oracle.ManagedDataAccess.Client;

namespace OracleTest
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string ConnectionString = "User Id=c##relszkola;Password=admin;Data Source=localhost:1521/XE;";

            using var connection = new OracleConnection(ConnectionString);
            connection.Open();

            while (true)
            {
                try
                {
                    Console.WriteLine("\nWybierz operację:");
                    Console.WriteLine("1 - Dodaj 1000 uczniów");
                    Console.WriteLine("2 - Aktualizuj 1000 uczniów");
                    Console.WriteLine("3 - Usuń 1000 uczniów");
                    Console.WriteLine("4 - Wczytaj 1000 uczniów");
                    Console.WriteLine("0 - Wyjście");
                    Console.Write("Twój wybór: ");
                    string wybor = Console.ReadLine();

                    switch (wybor)
                    {
                        case "1":
                            Console.WriteLine("Dodawanie 1000 uczniów...");
                            var czasDodaj = MeasureTime(() => InsertUczniowie(connection, 1000));
                            Console.WriteLine($"Dodanie 1000 uczniów zajęło {czasDodaj} ms");
                            break;
                        case "2":
                            Console.WriteLine("Aktualizacja 1000 uczniów...");
                            var czasAktualizuj = MeasureTime(() => UpdateUczniowie(connection, 1000));
                            Console.WriteLine($"Aktualizacja 1000 uczniów zajęła {czasAktualizuj} ms");
                            break;
                        case "3":
                            Console.WriteLine("Usuwanie 1000 uczniów wraz z powiązanymi ocenami...");
                            var czasUsun = MeasureTime(() => DeleteUczniowie(connection, 1000));
                            Console.WriteLine($"Usunięcie 1000 uczniów zajęło {czasUsun} ms");
                            break;
                        case "4":
                            Console.WriteLine("Wczytywanie 1000 uczniów...");
                            var czasWczytaj = MeasureTime(() => SelectUczniowie(connection, 1000));
                            Console.WriteLine($"Wczytanie 1000 uczniów zajęło {czasWczytaj} ms");
                            break;
                        case "0":
                            Console.WriteLine("Koniec programu.");
                            return;
                        default:
                            Console.WriteLine("Niepoprawny wybór, spróbuj ponownie.");
                            break;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Wystąpił błąd: " + ex.Message);
                }
            }
        }

        static long MeasureTime(Action action)
        {
            Stopwatch sw = Stopwatch.StartNew();
            action();
            sw.Stop();
            return sw.ElapsedMilliseconds;
        }

        static void InsertUczniowie(OracleConnection connection, int count)
        {
            using var transaction = connection.BeginTransaction();
            using var cmdCheck = connection.CreateCommand();
            using var cmdInsert = connection.CreateCommand();

            cmdCheck.Transaction = transaction;
            cmdInsert.Transaction = transaction;

            cmdCheck.CommandText = "SELECT COUNT(*) FROM uczniowie WHERE uczen_id = :uczen_id";
            cmdCheck.Parameters.Add("uczen_id", OracleDbType.Int32);

            cmdInsert.CommandText = @"
                INSERT INTO uczniowie (uczen_id, imie, nazwisko, pesel, klasa_id)
                VALUES (:uczen_id, :imie, :nazwisko, :pesel, :klasa_id)";
            cmdInsert.Parameters.Add("uczen_id", OracleDbType.Int32);
            cmdInsert.Parameters.Add("imie", OracleDbType.Varchar2);
            cmdInsert.Parameters.Add("nazwisko", OracleDbType.Varchar2);
            cmdInsert.Parameters.Add("pesel", OracleDbType.Varchar2);
            cmdInsert.Parameters.Add("klasa_id", OracleDbType.Int32);

            for (int i = 1; i <= count; i++)
            {
                int id = 100000 + i;
                cmdCheck.Parameters["uczen_id"].Value = id;
                var istnieje = Convert.ToInt32(cmdCheck.ExecuteScalar()) > 0;
                if (istnieje)
                {
                    // Pomiń jeśli już jest w bazie
                    continue;
                }

                cmdInsert.Parameters["uczen_id"].Value = id;
                cmdInsert.Parameters["imie"].Value = "Imie" + i;
                cmdInsert.Parameters["nazwisko"].Value = "Nazwisko" + i;
                cmdInsert.Parameters["pesel"].Value = (90000000000 + i).ToString();
                cmdInsert.Parameters["klasa_id"].Value = 1; // Założenie: klasa 1 istnieje
                cmdInsert.ExecuteNonQuery();
            }

            transaction.Commit();
        }

        static void UpdateUczniowie(OracleConnection connection, int count)
        {
            using var transaction = connection.BeginTransaction();
            using var cmd = connection.CreateCommand();
            cmd.Transaction = transaction;

            cmd.CommandText = "UPDATE uczniowie SET imie = :imie WHERE uczen_id = :uczen_id";
            cmd.Parameters.Add("imie", OracleDbType.Varchar2);
            cmd.Parameters.Add("uczen_id", OracleDbType.Int32);

            for (int i = 1; i <= count; i++)
            {
                cmd.Parameters["imie"].Value = "ZmienioneImie" + i;
                cmd.Parameters["uczen_id"].Value = 100000 + i;
                cmd.ExecuteNonQuery();
            }

            transaction.Commit();
        }

        static void DeleteUczniowie(OracleConnection connection, int count)
        {
            using var transaction = connection.BeginTransaction();
            using var cmd = connection.CreateCommand();
            cmd.Transaction = transaction;

            // Usuń powiązane oceny
            cmd.CommandText = "DELETE FROM oceny WHERE uczen_id = :uczen_id";
            var paramOceny = new OracleParameter("uczen_id", OracleDbType.Int32);
            cmd.Parameters.Add(paramOceny);

            for (int i = 1; i <= count; i++)
            {
                paramOceny.Value = 100000 + i;
                cmd.ExecuteNonQuery();
            }

            // Usuń uczniów
            cmd.Parameters.Clear();
            cmd.CommandText = "DELETE FROM uczniowie WHERE uczen_id = :uczen_id";
            var paramUczniowie = new OracleParameter("uczen_id", OracleDbType.Int32);
            cmd.Parameters.Add(paramUczniowie);

            for (int i = 1; i <= count; i++)
            {
                paramUczniowie.Value = 100000 + i;
                cmd.ExecuteNonQuery();
            }

            transaction.Commit();
        }

        static void SelectUczniowie(OracleConnection connection, int count)
        {
            using var cmd = connection.CreateCommand();

            cmd.CommandText = @"
        SELECT uczen_id, imie, nazwisko, pesel, klasa_id FROM uczniowie 
        WHERE uczen_id BETWEEN :start_val AND :end_val";

            cmd.Parameters.Add("start_val", OracleDbType.Int32).Value = 100001;
            cmd.Parameters.Add("end_val", OracleDbType.Int32).Value = 100000 + count;

            int licznik = 0;
            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                licznik++;
            }

            if (licznik == 0)
            {
                Console.WriteLine("Brak uczniów w wybranym zakresie.");
            }
            else
            {
                Console.WriteLine($"Wczytano rekordów: {licznik}");
            }
        }
    }
}