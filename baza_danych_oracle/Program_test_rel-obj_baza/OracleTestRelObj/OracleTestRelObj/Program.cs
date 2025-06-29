using Oracle.ManagedDataAccess.Client;
using System.Diagnostics;

namespace OracleObiektowo
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string ConnectionString = "User Id=c##szkola;Password=admin;Data Source=localhost:1521/XE;";

            using var connection = new OracleConnection(ConnectionString);
            try
            {
                connection.Open();
                Console.WriteLine("Połączenie udane!");

                while (true)
                {
                    Console.WriteLine("\nWybierz operację:");
                    Console.WriteLine("1 - Dodaj 1000 uczniów");
                    Console.WriteLine("2 - Aktualizuj 1000 uczniów");
                    Console.WriteLine("3 - Wczytaj 1000 uczniów"); 
                    Console.WriteLine("4 - Usuń 1000 uczniów");
                    Console.WriteLine("0 - Wyjście");
                    Console.Write("Twój wybór: ");
                    string wybor = Console.ReadLine();

                    try
                    {
                        switch (wybor)
                        {
                            case "1":
                                Console.WriteLine("Dodawanie 1000 uczniów...");
                                var czasDodaj = MeasureTime(() => InsertUczniowie(connection, 1000));
                                ZapiszWynik("dodaj", czasDodaj);

                                break;
                            case "2":
                                Console.WriteLine("Aktualizacja 1000 uczniów...");
                                var czasAkt = MeasureTime(() => UpdateUczniowie(connection, 1000));
                                ZapiszWynik("aktualizuj", czasAkt);

                                break;
                            case "3":
                                Console.WriteLine("Wczytywanie 1000 uczniów...");
                                var czasSel = MeasureTime(() => SelectUczniowie(connection, 1000));
                                ZapiszWynik("wczytaj", czasSel);
                                break;
                            case "4":
                                Console.WriteLine("Usuwanie 1000 uczniów...");
                                var czasDel = MeasureTime(() => DeleteUczniowie(connection, 1000));
                                ZapiszWynik("usun", czasDel);
                                break;
                            case "0":
                                Console.WriteLine("Zakończono.");
                                return;
                            default:
                                Console.WriteLine("Nieprawidłowy wybór.");
                                break;
                        }
                    }
                    catch (OracleException ex)
                    {
                        Console.WriteLine($"Błąd Oracle: {ex.Message} (Kod: {ex.Number})");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Błąd: {ex.Message}");
                    }
                }
            }
            catch (OracleException ex)
            {
                Console.WriteLine($"Błąd połączenia: {ex.Message} (Kod: {ex.Number})");
            }
            finally
            {
                connection.Close();
            }
        }

        static long MeasureTime(Action action)
        {
            var sw = Stopwatch.StartNew();
            action();
            sw.Stop();
            return sw.ElapsedMilliseconds;
        }

        static void InsertUczniowie(OracleConnection connection, int count)
        {
            using var cmd = connection.CreateCommand();

            // Pobierz maksymalne id z tabeli uczniowie
            cmd.CommandText = "SELECT NVL(MAX(id), 0) FROM c##szkola.uczniowie";
            int maxId = Convert.ToInt32(cmd.ExecuteScalar());

            // Zapytanie INSERT
            cmd.CommandText = @"
            INSERT INTO c##szkola.uczniowie
            VALUES (
                c##szkola.uczen_type(
                    :id,
                    :imie,
                    :nazwisko,
                    :pesel,
                    c##szkola.adres_type('Miasto', 'Ulica', '00-000'),
                    :klasa,
                    c##szkola.przedmioty_list(),
                    c##szkola.oceny_list()
                )
            )";

            cmd.Parameters.Add("id", OracleDbType.Int32);
            cmd.Parameters.Add("imie", OracleDbType.Varchar2);
            cmd.Parameters.Add("nazwisko", OracleDbType.Varchar2);
            cmd.Parameters.Add("pesel", OracleDbType.Varchar2);
            cmd.Parameters.Add("klasa", OracleDbType.Varchar2);

            for (int i = 1; i <= count; i++)
            {
                int id = maxId + i;
                cmd.Parameters["id"].Value = id;
                cmd.Parameters["imie"].Value = "Imie" + i;
                cmd.Parameters["nazwisko"].Value = "Nazwisko" + i;
                cmd.Parameters["pesel"].Value = (90000000000 + i).ToString();
                cmd.Parameters["klasa"].Value = "1A";
                cmd.ExecuteNonQuery();
            }
        }

        static void UpdateUczniowie(OracleConnection connection, int count)
        {
            using var cmd = connection.CreateCommand();

            // Pobierz maksymalne id z tabeli uczniowie
            cmd.CommandText = "SELECT NVL(MAX(id), 0) FROM c##szkola.uczniowie";
            int maxId = Convert.ToInt32(cmd.ExecuteScalar());
            int startId = maxId - count + 1;

            // Zapytanie UPDATE
            cmd.CommandText = @"
            UPDATE c##szkola.uczniowie u
            SET u.imie = :imie
            WHERE u.id = :id";

            cmd.Parameters.Add("imie", OracleDbType.Varchar2);
            cmd.Parameters.Add("id", OracleDbType.Int32);

            for (int i = 0; i < count; i++)
            {
                int id = startId + i;
                cmd.Parameters["imie"].Value = "NoweImie" + (i + 1);
                cmd.Parameters["id"].Value = id;
                cmd.ExecuteNonQuery();
            }
        }

        static void DeleteUczniowie(OracleConnection connection, int count)
        {
            using var cmd = connection.CreateCommand();

            // Pobierz maksymalne id z tabeli uczniowie
            cmd.CommandText = "SELECT NVL(MAX(id), 0) FROM c##szkola.uczniowie";
            int maxId = Convert.ToInt32(cmd.ExecuteScalar());
            int startId = maxId - count + 1;

            // Zapytanie DELETE
            cmd.CommandText = @"
            DELETE FROM c##szkola.uczniowie
            WHERE id = :id";

            cmd.Parameters.Add("id", OracleDbType.Int32);

            for (int i = 0; i < count; i++)
            {
                int id = startId + i;
                cmd.Parameters["id"].Value = id;
                cmd.ExecuteNonQuery();
            }
        }

        static void SelectUczniowie(OracleConnection connection, int count)
        {
            using var cmd = connection.CreateCommand();

            // Pobierz maksymalne id z tabeli uczniowie
            cmd.CommandText = "SELECT NVL(MAX(id), 0) FROM c##szkola.uczniowie";
            int maxId = Convert.ToInt32(cmd.ExecuteScalar());
            int startId = maxId - count + 1;

            // Zapytanie SELECT
            cmd.CommandText = @"
            SELECT u.id, u.imie, u.nazwisko, u.pesel, u.klasa
            FROM c##szkola.uczniowie u
            WHERE u.id BETWEEN :p_start AND :p_end";

            cmd.Parameters.Add("p_start", OracleDbType.Int32).Value = startId;
            cmd.Parameters.Add("p_end", OracleDbType.Int32).Value = maxId;

            int licznik = 0;
            try
            {
                using var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    licznik++;
                }
                Console.WriteLine($"Wczytano {licznik} uczniów.");
            }
            catch (OracleException ex)
            {
                Console.WriteLine($"Błąd przy wczytywaniu uczniów: {ex.Message} (Kod: {ex.Number})");
            }
        }
        static void ZapiszWynik(string operacja, long czas)
        {
            string linia = $"baza_obiektowa;{operacja};{czas}";
            File.AppendAllLines("Wyniki_obiektowa.txt", new[] { linia });
            Console.WriteLine($"Operacja {operacja} zakończona w {czas} ms");

        }
    }
}